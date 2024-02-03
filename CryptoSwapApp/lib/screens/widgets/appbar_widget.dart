import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swap_app/config/color_constants.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({super.key, required this.onLeadingTap, required this.title, required this.leadingIcon});

  final VoidCallback onLeadingTap;
  final String title;
  final dynamic leadingIcon;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return AppBar(
      backgroundColor: transparentColor,
      elevation: 0,
      leading: InkWell(
        onTap: onLeadingTap,
        child: (leadingIcon.runtimeType == String) ? Image.asset(leadingIcon,color: theme.drawerTheme.backgroundColor) : Icon(leadingIcon,color: theme.drawerTheme.backgroundColor),
      ),
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 19.2.sp,
          fontWeight: FontWeight.w700,
          color: theme.textTheme.headlineMedium!.color,
        ),
      ),
    );
  }
}
