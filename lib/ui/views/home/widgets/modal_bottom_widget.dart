import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:veggie_go_malaysia/constants/colors.dart';
import '../home_viewmodel.dart';

// showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       builder: (context) => SingleChildScrollView(
//         child: Container(
//           padding:
//           EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
//           child:

class ModalBottomWidget extends HookViewModelWidget<HomeViewModel> {
  ModalBottomWidget({Key key}) : super(key: key, reactive: false);

  // TODO: write widget test

  int height = 10;

  @override
  Widget buildViewModelWidget(BuildContext context, HomeViewModel viewModel) {
    return Container(
      height: 1520.h,
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(50.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(100.w),
            topRight: Radius.circular(100.w),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(40.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  //TODO:
                },
                child: _headerText('Apply', Alignment.topRight),
              ),
              _headerText('Applied Filter', Alignment.topLeft),
              SizedBox(height: 40.h),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(spacing: 30.w, children: <Widget>[
                  _appliedFiltersContainers('Vegetarian'),
                  _appliedFiltersContainers('Taiwanese'),
                  _appliedFiltersContainers('<10km'),
                ]),
              ),
              SizedBox(height: 20.h),
              Divider(thickness: 1.5, color: Color(0xFFECECEC)),
              SizedBox(height: 40.h),
              _headerText('Vendor Type', Alignment.topLeft),
              SizedBox(height: 40.h),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  spacing: 30.w,
                  children: <Widget>[
                    _checkedvendorTypeContainers('Vegetarian'),
                    _uncheckedvendorTypeContainers('Stores & More'),
                    _uncheckedvendorTypeContainers('Vegetarian Friendly'),
                  ],
                ),
              ),
              SizedBox(height: 40.h),
              Divider(thickness: 1.5, color: Color(0xFfECECEC)),
              SizedBox(height: 40.h),
              _headerText('Distance', Alignment.topLeft),
              SizedBox(height: 80.h),
              _slider(context),
              SizedBox(height: 60.h),
              _openNowRow(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _openNowRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          'Open now',
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16.0,
            color: Color(0xFF000000),
          ),
        ),
        Switch.adaptive(
          value: true,
          activeColor: ThemeColors.kActiveColor,
          activeTrackColor: ThemeColors.kActiveTrackColor,
          inactiveThumbColor: ThemeColors.kInactiveColor,
          inactiveTrackColor: ThemeColors.kInactiveColor,
          onChanged: (bool value) {
            // TODO: Get the state and set Functionality
          },
        ),
      ],
    );
  }

  Widget _slider(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
          inactiveTrackColor: Color(0xFFEAEAEA),
          activeTrackColor: Color(0xFFCFEEAE),
          inactiveTickMarkColor: Color(0xFFEAEAEA),
          activeTickMarkColor: Color(0xFFCFEEAE),
          thumbColor: Color(0xFF83D32F),
          overlayColor: Color(0xFFCFEEAE),
          tickMarkShape: RoundSliderTickMarkShape(),
          valueIndicatorShape: PaddleSliderValueIndicatorShape(),
          valueIndicatorColor: Color(0xFF83D32F),
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
          valueIndicatorTextStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16.0,
            color: Colors.white,
          ),
          trackHeight: 22.h),
      child: Slider.adaptive(
        value: height.toDouble(),
        min: 0.0,
        max: 50.0,
        divisions: 10,
        onChanged: (double newValue) {
          // TODO: Get the state and set Functionality
        },
        label: '$height',
      ),
    );
  }

  Widget _checkedvendorTypeContainers(String text) {
    return Container(
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              // TODO:
            },
            child: Container(
              child: CircleAvatar(
                radius: 50.w,
                backgroundColor: Color(0xFF83D32F),
                child: Icon(
                  Icons.check,
                  size: 80.w,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(width: 20.w),
          Text(
            '$text',
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
              color: Color(0xFF000000),
            ),
          ),
        ],
      ),
    );
  }

  Widget _uncheckedvendorTypeContainers(String text) {
    return Container(
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              // TODO:
            },
            child: Container(
              child: CircleAvatar(
                radius: 50.w,
                backgroundColor: Color(0xFF83D32F),
                child: CircleAvatar(
                  radius: 45.w,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.add,
                    size: 80.w,
                    color: Color(0xFF83D32F),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 20.w),
          Text(
            '$text',
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
              color: Color(0xFF000000),
            ),
          ),
        ],
      ),
    );
  }

  Widget _appliedFiltersContainers(String text) {
    return Container(
      height: 120.h,
      padding: EdgeInsets.all(30.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60.w),
        color: Color(0xFF83D32F).withOpacity(0.3),
      ),
      child: Row(
        children: <Widget>[
          SizedBox(width: 10.w),
          Text(
            '$text',
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
              color: Color(0xFF000000),
            ),
          ),
          SizedBox(width: 30.w),
          CircleAvatar(
            radius: 30.w,
            backgroundColor: Color(0xFF83D32F),
            child: Icon(
              Icons.close,
              size: 60.w,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 10.w),
        ],
      ),
    );
  }

  Widget _headerText(String text, Alignment alignment) {
    return Align(
      alignment: alignment,
      child: Text(
        '$text',
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 17.0,
          color: Color(0xFF000000),
        ),
      ),
    );
  }
}
