import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swap_app/config/color_constants.dart';
import 'package:swap_app/modals/coin_model.dart';

import '../../config/const_data.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown(
      {super.key,
      required this.name,
      required this.selectedCoin,
      required this.onChange,
      this.labelColor = const Color(0xFF888E9E)});

  final String name;
  final Coin selectedCoin;
  final ValueSetter onChange;
  final Color labelColor;

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.name,
          style: TextStyle(
            color: widget.labelColor,
            fontSize: 12.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 4.h),
          child: SizedBox(
            height: 14.h,
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                value: widget.selectedCoin,
                isDense: true,
                padding: EdgeInsets.zero,
                alignment: Alignment.centerRight,
                dropdownColor: theme.indicatorColor,
                icon: Icon(Icons.keyboard_arrow_down_rounded,
                    color: greyColor, size: 17.sp),
                style: TextStyle(
                  color: widget.labelColor,
                  fontSize: 12.4.sp,
                  fontWeight: FontWeight.w700,
                ),
                items: coins
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(e.image,
                                scale: 3.6, height: 20.h, width: 20.h),
                            SizedBox(width: 5.w),
                            Text(e.name,
                                style: TextStyle(color: widget.labelColor)),
                          ],
                        ),
                      ),
                    )
                    .toList(),
                onChanged: widget.onChange,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
