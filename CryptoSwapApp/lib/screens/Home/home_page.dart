import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swap_app/config/image_constants.dart';
import 'package:swap_app/config/routing_constants.dart';
import 'package:swap_app/screens/widgets/appbar_widget.dart';
import 'package:swap_app/screens/widgets/bg_image.dart';
import 'package:swap_app/screens/widgets/swap_list_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Random random = Random();
  List<int> c1 = [];
  List<int> c2 = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < 11; i++) {
      c1.add(random.nextInt(10));
      c2.add(random.nextInt(10));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGroundContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppbarWidget(
              onLeadingTap: () {
                Navigator.pushNamed(context, manuPage);
              },
              title: "Swap List",
              leadingIcon: drawerIcon,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: c1.length,
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(vertical: 0.h),
                itemBuilder: (context, index) {
                  return SwapTileWidget(
                    index1: c1[index],
                    index2: c2[index],
                    onSwapTap: () {
                      Navigator.pushNamed(context, swapAndLiquidityScreen);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
