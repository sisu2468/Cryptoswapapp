import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SwapFieldWidget extends StatelessWidget {
  const SwapFieldWidget({super.key, required this.price, required this.currencyName,this.color = const Color(0xFF888E9E)});

  final double price;
  final String currencyName;
  final Color color;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: 13.h, horizontal: 10.w),
      margin: EdgeInsets.only(bottom: 5.h),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment:
        MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$price",
            style: TextStyle(
              color: color,
              fontSize: 14.5.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            currencyName,
            style: TextStyle(
              color: color,
              fontSize: 14.5.sp,
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }
}
