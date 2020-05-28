import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veggie_go_malaysia/constants/colors.dart';
import 'package:veggie_go_malaysia/datamodels/country.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:veggie_go_malaysia/ui/views/home/widgets/modal_bottom_widget.dart';

import '../home_viewmodel.dart';

class LocationSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.h,
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10.h),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(150.w),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          fillColor: ThemeColors.searchBar,
          filled: true,
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 50.w),
            child: Icon(Icons.search, color: ThemeColors.searchBarIcon),
          ),
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: 50.w),
            child: GestureDetector(
              child: Icon(
                Icons.near_me,
                color: ThemeColors.searchBarIcon,
              ),
              onTap: () {
                // TODO: switch to geolocation

                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: AddTaskScreen(),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class FlagSelector extends HookViewModelWidget<HomeViewModel> {
  FlagSelector({Key key}) : super(key: key, reactive: false);

  //TODO: write widget test

  @override
  Widget buildViewModelWidget(BuildContext context, HomeViewModel model) =>
      Container(
        child: DropdownButtonHideUnderline(
          child: DropdownButton<Country>(
            isExpanded: true,
            value: model.selectedCountry,
            items: Country.country.map((country) {
              return DropdownMenuItem<Country>(
                value: country,
                child: Container(height: 100.h, child: country.countryImage),
              );
            }).toList(),
            onChanged: (value) {
              model.changeCountry(value);
            },
          ),
        ),
      );
}
