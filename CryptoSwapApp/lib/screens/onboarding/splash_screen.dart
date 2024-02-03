import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:swap_app/config/color_constants.dart';
import 'package:swap_app/config/image_constants.dart';
import 'package:swap_app/config/routing_constants.dart';
import 'package:swap_app/providers/theme_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, homePage);
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = context.watch<ThemeProvider>();
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: whiteColor,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            (themeProvider.currentMode == ThemeMode.system)
                ? (MediaQuery.of(context).platformBrightness ==
                        Brightness.light)
                    ? bgImage
                    : darkBGImage
                : (themeProvider.currentMode ==
                        ThemeMode.light)
                    ? bgImage
                    : darkBGImage,
            width: size.width,
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Image.asset(
                  logoImage,
                ),
              ),
              SizedBox(height: 7.h),
              Text(
                "Swap App",
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 7.h),
              Text(
                "Lorem Ipsum is simply dummy text of\nthe printing and typesetting industry.",
                style: TextStyle(
                    color: theme.textTheme.headlineMedium!.color,
                    fontSize: 12.7.sp,
                    fontWeight: FontWeight.w500,
                    height: 1.5),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
