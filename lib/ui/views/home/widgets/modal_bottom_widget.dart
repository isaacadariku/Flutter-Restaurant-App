import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veggie_go_malaysia/constants/colors.dart';

//class ModalBottomWidget extends StatelessWidget {

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  int height = 10;
  bool check;

  bool checking() => check = !check;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1520.h,
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(100.w),
            topRight: Radius.circular(100.w),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.0),
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
                child: Wrap(spacing: 20.w, children: <Widget>[
                  _appliedFiltersContainers('Vegetarian'),
                  _appliedFiltersContainers('Taiwanese'),
                  _appliedFiltersContainers('<10km'),
                  _appliedFiltersContainers('<10km'),
                ]),
              ),
              SizedBox(height: 20.h),
              Divider(thickness: 1.5, color: Color(0xFfECECEC)),
              SizedBox(height: 40.h),
              _headerText('Vendor Type', Alignment.topLeft),
              SizedBox(height: 40.h),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  spacing: 20.w,
                  children: <Widget>[
                    _vendorTypeContainers('Vegetarian', check),
                    _vendorTypeContainers('Stores & More', check),
                    _vendorTypeContainers('Vegetarian Friendly', check),
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
              Row(
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
                      setState(() {
                        value = !value;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
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
          setState(() {
            height = newValue.round();
          });
        },
        label: '$height',
      ),
    );
  }

  Widget _vendorTypeContainers(String text, bool press) {
    return Container(
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              // TODO: Switch state when check
              setState(() {
                checking();
              });
            },
            child: Container(
              child: press
                  ? CircleAvatar(
                      radius: 50.w,
                      backgroundColor: Color(0xFF83D32F),
                      child: Icon(
                        Icons.check,
                        size: 80.w,
                        color: Colors.white,
                      ),
                    )
                  : CircleAvatar(
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
          SizedBox(width: 10.w),
          CircleAvatar(
            radius: 30.w,
            backgroundColor: Color(0xFF83D32F),
            child: Icon(
              Icons.close,
              size: 60.w,
              color: Colors.white,
            ),
          ),
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
