import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:swap_app/providers/theme_provider.dart';
import 'color_constants.dart';

BoxDecoration getDefaultDecoration({required BuildContext context}) {
  return BoxDecoration(
    color: Theme.of(context).dialogBackgroundColor,
    borderRadius: BorderRadius.circular(10.r),
    boxShadow: (context.watch<ThemeProvider>().currentMode == ThemeMode.system)
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
  );
}
