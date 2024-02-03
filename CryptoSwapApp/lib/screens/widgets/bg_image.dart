import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swap_app/config/image_constants.dart';
import 'package:swap_app/providers/theme_provider.dart';

class BackGroundContainer extends StatelessWidget {
  const BackGroundContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: context.watch<ThemeProvider>().currentMode == ThemeMode.system
              ? (MediaQuery.of(context).platformBrightness == Brightness.light)
                  ? const AssetImage(bgImage)
                  : const AssetImage(darkBGImage)
              : context.watch<ThemeProvider>().currentMode == ThemeMode.light
                  ? const AssetImage(bgImage)
                  : const AssetImage(darkBGImage),
          fit: BoxFit.fitWidth,
        ),
      ),
      child: child,
    );
  }
}
