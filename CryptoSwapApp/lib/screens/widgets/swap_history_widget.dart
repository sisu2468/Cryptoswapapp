import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swap_app/config/color_constants.dart';
import 'package:swap_app/modals/history_model.dart';

class SwapHistoryWidget extends StatelessWidget {
  const SwapHistoryWidget({super.key, required this.historyModel});

  final HistoryModel historyModel;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
      padding: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        color: theme.dialogBackgroundColor,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: MediaQuery.of(context).platformBrightness == Brightness.light
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
        crossAxisAlignment: CrossAxisAlignment.start,
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
                            padding: const EdgeInsets.all(2),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xFFEFF4FD),
                                border: Border.all(
                                  color: historyModel.coin1!.backgroundColor,
                                  width: 2,
                                )),
                            child: Image.asset(
                              historyModel.coin1!.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          height: 25.h,
                          width: 25.h,
                          padding: const EdgeInsets.all(2),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0xFFEFF4FD),
                              border: Border.all(
                                color: historyModel.coin2!.backgroundColor,
                                width: 2,
                              )),
                          child: Image.asset(
                            historyModel.coin2!.image,
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
                        "${historyModel.coin2!.name} - ${historyModel.coin1!.name}",
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                          color: theme.textTheme.headlineMedium!.color,
                        ),
                      ),
                      Text(
                        "${historyModel.coin2!.value} ${historyModel.coin2!.name} - ${historyModel.coin1!.value} ${historyModel.coin1!.name}",
                        style: TextStyle(
                          fontSize: 11.2.sp,
                          fontWeight: FontWeight.w700,
                          color: theme.focusColor,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Icon(Icons.watch_later_outlined,
                          color: theme.textTheme.headlineMedium!.color,
                          size: 14.h),
                      SizedBox(width: 2.w),
                      Text(
                        "${historyModel.date} days before",
                        style: TextStyle(
                          color: theme.textTheme.headlineMedium!.color,
                          fontWeight: FontWeight.w500,
                          fontSize: 10.6.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Divider(height: 17.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Id",
                        style: TextStyle(
                          color: greyColor,
                          fontSize: 12.7.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: " - ${historyModel.id}",
                        style: TextStyle(
                          color: theme.textTheme.headlineMedium!.color,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Transaction Id",
                            style: TextStyle(
                              color: greyColor,
                              fontSize: 12.7.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: " - ${historyModel.transaction}",
                            style: TextStyle(
                              color: theme.textTheme.headlineMedium!.color,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Clipboard.setData(ClipboardData(
                            text: " - ${historyModel.transaction}"));
                      },
                      child: Ink(
                        child: SizedBox(
                          height: 14.h,
                          width: 14.h,
                          child: Image.asset("assets/icons/copy.png",
                              color: theme.textTheme.headlineMedium!.color),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 4.h),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Wallet Name",
                        style: TextStyle(
                          color: greyColor,
                          fontSize: 12.7.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: " - ${historyModel.walletName}",
                        style: TextStyle(
                          color: theme.textTheme.headlineMedium!.color,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 4.h),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Status",
                        style: TextStyle(
                          color: greyColor,
                          fontSize: 12.7.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: " - ${getStatusName(historyModel.status ?? 0)}",
                        style: TextStyle(
                          color: getStatusColor(historyModel.status ?? 0),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 4.h),
              ],
            ),
          ),
        ],
      ),
    );
  }

  getStatusName(int index) {
    if (index == 1) {
      return "Successful";
    } else if (index == 2) {
      return "Padding";
    } else {
      return "Cancel";
    }
  }

  getStatusColor(int index) {
    if (index == 1) {
      return const Color(0xFFC3F619);
    } else if (index == 2) {
      return const Color(0xFFFFD600);
    } else {
      return const Color(0xFFFF2E00);
    }
  }
}
