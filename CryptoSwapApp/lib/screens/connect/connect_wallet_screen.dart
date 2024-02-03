import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swap_app/config/color_constants.dart';
import 'package:swap_app/config/const_styles.dart';
import 'package:swap_app/config/image_constants.dart';
import 'package:swap_app/config/routing_constants.dart';
import 'package:swap_app/screens/widgets/appbar_widget.dart';
import 'package:swap_app/screens/widgets/bg_image.dart';
import 'package:swap_app/screens/widgets/wallet_widget.dart';

class ConnectWalletScreen extends StatefulWidget {
  const ConnectWalletScreen({super.key});

  @override
  State<ConnectWalletScreen> createState() => _ConnectWalletScreenState();
}

class _ConnectWalletScreenState extends State<ConnectWalletScreen> {
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
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
              title: "Connect Wallet",
              leadingIcon: Icons.arrow_back,
            ),
            Container(
              height: size.height * 0.06,
              margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              decoration: getDefaultDecoration(context: context),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedAlign(
                    duration: const Duration(milliseconds: 300),
                    alignment: (_pageIndex == 0)
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    child: Container(
                      height: double.infinity,
                      width: ((size.width * 0.5) - 15.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: primaryColor,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _pageIndex = 0;
                          });
                        },
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: size.height * 0.015,
                            horizontal: ((size.width * 0.22) - 30.w),
                          ),
                        ),
                        child: Text(
                          "QR Code",
                          style: TextStyle(
                            color: (_pageIndex == 0) ? whiteColor : greyColor,
                            fontSize: 12.7.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _pageIndex = 1;
                          });
                        },
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: size.height * 0.015,
                            horizontal: ((size.width * 0.18) - 30.w),
                          ),
                        ),
                        child: Text(
                          "Deep Linking",
                          style: TextStyle(
                            color: (_pageIndex == 1) ? whiteColor : greyColor,
                            fontSize: 12.7.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Text(
                _pageIndex == 1
                    ? "please select one of the below wallet app to connect."
                    : "Please ScanBelow QR Code With Compatable Wallet to Connect App With Wallet.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: theme.textTheme.headlineMedium!.color,
                  fontSize: 12.7.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            _pageIndex == 0
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Column(
                      children: [
                        Container(
                          decoration: getDefaultDecoration(context: context),
                          child: Image.asset(qr,color: theme.iconTheme.color),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 15.h),
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.w, vertical: 10.h),
                          decoration: getDefaultDecoration(context: context),
                          child: Text(
                            "wc:9e5b6e78-940b-476b-a043-2834c435b7ef@1wc:9e5b6e78-940b-476b-a043-2834c435b7ef@1",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                color: theme.iconTheme.color,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Column(
                      children: [
                        WalletWidget(
                            onTap: () {},
                            image: rainbow,
                            walletName: "Rainbow"),
                        WalletWidget(
                            onTap: () {
                              Navigator.pushNamed(context, transferCoinScreen);
                            },
                            image: meta,
                            walletName: "MetaMask"),
                        WalletWidget(
                            onTap: () {},
                            image: gnosis,
                            walletName: "Gnosis Safe"),
                        WalletWidget(
                            onTap: () {}, image: argent, walletName: "Argent"),
                      ],
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
