import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swap_app/config/color_constants.dart';
import 'package:swap_app/config/const_data.dart';
import 'package:swap_app/screens/widgets/appbar_widget.dart';
import 'package:swap_app/screens/widgets/bg_image.dart';
import 'package:swap_app/screens/widgets/swap_history_widget.dart';

class SwapHistory extends StatefulWidget {
  const SwapHistory({super.key});

  @override
  State<SwapHistory> createState() => _SwapHistoryState();
}

class _SwapHistoryState extends State<SwapHistory> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: BackGroundContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppbarWidget(
              onLeadingTap: () {
                Navigator.pop(context);
              },
              title: "Swap History",
              leadingIcon: Icons.arrow_back,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: walletHistory.length,
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(vertical: 0.h),
                itemBuilder: (context, index) {
                  return SwapHistoryWidget(historyModel: walletHistory[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
