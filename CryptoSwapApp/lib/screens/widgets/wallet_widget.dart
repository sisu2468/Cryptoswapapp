import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swap_app/config/const_styles.dart';

class WalletWidget extends StatelessWidget {
  const WalletWidget(
      {super.key, required this.onTap, required this.image, required this.walletName,});

  final VoidCallback onTap;
  final String image;
  final String walletName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: 10.h,
        ),
        padding: EdgeInsets.only(
            top: 10.h, bottom: 10.h, left: 10.w),
        decoration: getDefaultDecoration(context: context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              walletName,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).textTheme.headlineMedium!.color,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Image.asset(
                image,
                height: 30.h,
                width: 30.h,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
