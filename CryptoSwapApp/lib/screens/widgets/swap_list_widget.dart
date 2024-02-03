import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:swap_app/config/color_constants.dart';
import 'package:swap_app/config/const_data.dart';
import 'package:swap_app/config/image_constants.dart';
import 'package:swap_app/providers/theme_provider.dart';

class SwapTileWidget extends StatelessWidget {
  const SwapTileWidget(
      {super.key,
      required this.index1,
      required this.index2,
      required this.onSwapTap});

  final int index1;
  final int index2;
  final VoidCallback onSwapTap;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
      padding: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        color: theme.dialogBackgroundColor,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: (context.watch<ThemeProvider>().currentMode ==
                ThemeMode.system)
            ? (MediaQuery.of(context).platformBrightness == Brightness.light)
                ? [
                    BoxShadow(
                      color: blackColor.withOpacity(0.09),
                      offset: const Offset(0, 4),
                      blurRadius: 18,
                    )
                  ]
                : null
            : (context.watch<ThemeProvider>().currentMode == ThemeMode.light)
                ? [
                    BoxShadow(
                      color: blackColor.withOpacity(0.09),
                      offset: const Offset(0, 4),
                      blurRadius: 18,
                    )
                  ]
                : null,
      ),
      child: Column(
        children: [
          IntrinsicHeight(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.h),
              child: Row(
                children: [
                  Container(
                    height: 38.h,
                    width: 38.h,
                    margin: EdgeInsets.only(right: 10.w),
                    padding: EdgeInsets.symmetric(vertical: 2.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      // color: primaryColor,
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            height: 25.h,
                            width: 25.h,
                            padding: const EdgeInsets.all(5),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xFFEFF4FD),
                                border: Border.all(
                                  color: coins[index1].backgroundColor,
                                  width: 2,
                                )),
                            child: Image.asset(
                              coins[index1].image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          height: 25.h,
                          width: 25.h,
                          padding: const EdgeInsets.all(5),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0xFFEFF4FD),
                              border: Border.all(
                                color: coins[index2].backgroundColor,
                                width: 2,
                              )),
                          child: Image.asset(
                            coins[index2].image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${coins[index2].name} - ${coins[index1].name}",
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                          color: theme.textTheme.headlineMedium!.color,
                        ),
                      ),
                      Text(
                        "1 ETH - 7.29 BNB",
                        style: TextStyle(
                          fontSize: 11.2.sp,
                          fontWeight: FontWeight.w700,
                          color: greenColor,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: onSwapTap,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      elevation: 0,
                      padding:
                          EdgeInsets.symmetric(vertical: 6.h, horizontal: 13.w),
                      minimumSize: Size.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      "Swap",
                      style: TextStyle(
                        color: whiteColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(height: 17.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.h),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "1 ${coins[index2].name} - \$${coins[index2].value}",
                      style: TextStyle(
                        color: theme.textTheme.headlineMedium!.color,
                        fontSize: 12.7.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "1 ${coins[index1].name} - \$${coins[index1].value}",
                      style: TextStyle(
                        color: theme.textTheme.headlineMedium!.color,
                        fontSize: 12.7.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 20.h,
                  width: 20.h,
                  padding: EdgeInsets.all(2.h),
                  decoration: BoxDecoration(
                    color: orangeColor,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    swapIcon,
                    color: whiteColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
