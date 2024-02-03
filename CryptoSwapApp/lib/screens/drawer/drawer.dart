import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:swap_app/config/color_constants.dart';
import 'package:swap_app/config/const_styles.dart';
import 'package:swap_app/config/image_constants.dart';
import 'package:swap_app/config/routing_constants.dart';
import 'package:swap_app/providers/theme_provider.dart';
import 'package:swap_app/screens/widgets/appbar_widget.dart';

import '../widgets/bg_image.dart';

class ManuScreen extends StatefulWidget {
  const ManuScreen({super.key});

  @override
  State<ManuScreen> createState() => _ManuScreenState();
}

class _ManuScreenState extends State<ManuScreen> {
  List<Map> dataList = [
    {"name": "Browser", "icon": globIcon},
    {"name": "Swap History", "icon": repeatIcon},
    {"name": "Privacy Policy", "icon": privacyIcon},
    {"name": "Brightness", "icon": moonIcon}
  ];

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: whiteColor,
      body: BackGroundContainer(
        child: Column(
          children: [
            AppbarWidget(
              onLeadingTap: () {
                Navigator.pop(context);
              },
              title: "Swap",
              leadingIcon: Icons.arrow_back,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                children: [
                  Image.asset(coinImage),
                  Column(
                    children: dataList
                        .map(
                          (e) => InkWell(
                            onTap: () {
                              if (e["icon"] == repeatIcon) {
                                Navigator.pushNamed(context, swapHistoryScreen);
                              }
                            },
                            child: Ink(
                              child: Container(
                                decoration:
                                    getDefaultDecoration(context: context),
                                margin: EdgeInsets.symmetric(vertical: 10.h),
                                padding: EdgeInsets.symmetric(vertical: 10.h),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.w),
                                          child: Image.asset(
                                            e["icon"],
                                            height: 22.h,
                                            width: 22.h,
                                            fit: BoxFit.cover,
                                            color: theme.iconTheme.color,
                                          ),
                                        ),
                                        Text(
                                          e["name"],
                                          style: TextStyle(
                                            fontSize: 12.7.sp,
                                            fontWeight: FontWeight.w700,
                                            color: theme.textTheme
                                                .headlineMedium!.color,
                                          ),
                                        ),
                                      ],
                                    ),
                                    if (e["name"] == "Brightness") ...[
                                      Padding(
                                        padding: EdgeInsets.only(
                                          right: 10.w,
                                          left: 10.w,
                                          top: 10.h,
                                        ),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Light",
                                                  style: TextStyle(
                                                    fontSize: 12.7.sp,
                                                    fontWeight: FontWeight.w700,
                                                    color: theme.textTheme
                                                        .headlineMedium!.color,
                                                  ),
                                                ),
                                                Radio(
                                                  value: ThemeMode.light,
                                                  groupValue: context
                                                      .watch<ThemeProvider>()
                                                      .currentMode,
                                                  materialTapTargetSize:
                                                      MaterialTapTargetSize
                                                          .shrinkWrap,
                                                  focusColor: orangeColor,
                                                  fillColor:
                                                      MaterialStateProperty.all(
                                                          greyColor),
                                                  onChanged: (value) {
                                                    context
                                                        .read<ThemeProvider>()
                                                        .changeThemeMode(
                                                            mode: ThemeMode
                                                                .light);
                                                  },
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Dark",
                                                  style: TextStyle(
                                                    fontSize: 12.7.sp,
                                                    fontWeight: FontWeight.w700,
                                                    color: theme.textTheme
                                                        .headlineMedium!.color,
                                                  ),
                                                ),
                                                Radio(
                                                  value: ThemeMode.dark,
                                                  groupValue: context
                                                      .watch<ThemeProvider>()
                                                      .currentMode,
                                                  materialTapTargetSize:
                                                      MaterialTapTargetSize
                                                          .shrinkWrap,
                                                  fillColor:
                                                      MaterialStateProperty.all(
                                                          greyColor),
                                                  onChanged: (value) {
                                                    context
                                                        .read<ThemeProvider>()
                                                        .changeThemeMode(
                                                            mode:
                                                                ThemeMode.dark);
                                                  },
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "System",
                                                  style: TextStyle(
                                                    fontSize: 12.7.sp,
                                                    fontWeight: FontWeight.w700,
                                                    color: theme.textTheme
                                                        .headlineMedium!.color,
                                                  ),
                                                ),
                                                Radio(
                                                  value: ThemeMode.system,
                                                  groupValue: context
                                                      .watch<ThemeProvider>()
                                                      .currentMode,
                                                  activeColor: greyColor,
                                                  materialTapTargetSize:
                                                      MaterialTapTargetSize
                                                          .shrinkWrap,
                                                  fillColor:
                                                      MaterialStateProperty.all(
                                                          greyColor),
                                                  onChanged: (value) {
                                                    context
                                                        .read<ThemeProvider>()
                                                        .changeThemeMode(
                                                            mode: ThemeMode
                                                                .system);
                                                  },
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
