import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:swap_app/config/color_constants.dart';
import 'package:swap_app/config/const_data.dart';
import 'package:swap_app/config/const_styles.dart';
import 'package:swap_app/config/routing_constants.dart';
import 'package:swap_app/modals/coin_model.dart';
import 'package:swap_app/screens/widgets/bg_image.dart';
import '../../config/image_constants.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/custom_dropdown.dart';
import '../widgets/swap_field_widget.dart';

class TransferCoinScreen extends StatefulWidget {
  const TransferCoinScreen({super.key});

  @override
  State<TransferCoinScreen> createState() => _TransferCoinScreenState();
}

class _TransferCoinScreenState extends State<TransferCoinScreen> {
  int _pageIndex = 0;
  Coin selectedCoin = coins.first;
  Coin selectedCoin2 = coins.last;
  Coin? selectedCoin3;

  String selectedConnectMethod = "ETH";
  List<String> selectList = [
    "ETH",
    "BNB",
    "BCH",
    "BTC",
    "DOGE",
    "LTC",
    "DASH",
    "TRX",
    "XMR"
  ];

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
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(
                  color: greyColor,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 12.h,
                        width: 12.h,
                        margin: EdgeInsets.only(left: 10.w),
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF4F8FE),
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 1,
                            color: lightRadioColor,
                          ),
                        ),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: lightRadioColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 22.h,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            value: selectedConnectMethod,
                            padding: EdgeInsets.zero,
                            alignment: Alignment.centerRight,
                            dropdownColor: theme.indicatorColor,
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: theme.iconTheme.color,
                              size: 17.sp,
                            ),
                            style: TextStyle(
                                color: theme.textTheme.headlineMedium!.color,
                                fontSize: 12.4.sp,
                                fontWeight: FontWeight.w700),
                            items: selectList
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedConnectMethod = value as String;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 25.w),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 2.h),
                      decoration: BoxDecoration(
                        color: theme.highlightColor,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Spacer(),
                          Row(
                            children: [
                              Image.asset(meta, height: 30.h, width: 30.h),
                              SizedBox(width: 5.w),
                              Text("\$3,293.46",
                                  style: TextStyle(
                                    fontSize: 12.7.sp,
                                    fontWeight: FontWeight.w800,
                                    color:
                                        theme.textTheme.headlineMedium!.color,
                                  )),
                            ],
                          ),
                          const Spacer(),
                          Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.h, horizontal: 8.w),
                              decoration: BoxDecoration(
                                color: theme.indicatorColor,
                                borderRadius: BorderRadius.circular(9.r),
                              ),
                              child: Text(
                                maskText(
                                  "0xFF5b6e78940b476ba0432834c435b7ef@1wc:9e5b6e78-940b-476b-a043-2834c435b7aaEg",
                                  5,
                                  4,
                                  "...",
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color:
                                        theme.textTheme.headlineMedium!.color,
                                    fontSize: 12.7.sp,
                                    fontWeight: FontWeight.w600),
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
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
                            horizontal: ((size.width * 0.24) - 30.w),
                          ),
                        ),
                        child: Text(
                          "Swap",
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
                            horizontal: ((size.width * 0.22) - 30.w),
                          ),
                        ),
                        child: Text(
                          "Liquidity",
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
            _pageIndex == 0
                ? Container(
                    decoration: getDefaultDecoration(context: context),
                    margin:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Column(
                          children: [
                            Column(
                              children: [
                                CustomDropDown(
                                  name: "Swap From",
                                  selectedCoin: selectedCoin,
                                  labelColor: theme.textTheme.titleMedium!.color!,
                                  onChange: (value) {
                                    setState(() {
                                      selectedCoin = value as Coin;
                                    });
                                  },
                                ),
                                SwapFieldWidget(
                                  price: 0.00,
                                  currencyName: selectedCoin.name,
                                  color: greenColor,
                                ),
                                Row(
                                  children: [
                                    const Spacer(),
                                    Text(
                                      "Balance: 0.00",
                                      style: TextStyle(
                                        color: greyColor,
                                        fontSize: 10.5.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 15.h),
                            // Repeat
                            Column(
                              children: [
                                CustomDropDown(
                                  name: "Swap To",
                                  selectedCoin: selectedCoin2,
                                  labelColor: theme.textTheme.titleMedium!.color!,
                                  onChange: (value) {
                                    setState(() {
                                      selectedCoin2 = value as Coin;
                                    });
                                  },
                                ),
                                SwapFieldWidget(
                                  price: 0.00,
                                  currencyName: selectedCoin2.name,
                                  color: greenColor,
                                ),
                                Row(
                                  children: [
                                    const Spacer(),
                                    Text(
                                      "Balance: 0.00",
                                      style: TextStyle(
                                        color: greyColor,
                                        fontSize: 10.5.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Positioned(
                          child: InkWell(
                            onTap: () {
                              if (_pageIndex == 0) {
                                setState(() {
                                  Coin temp = selectedCoin;
                                  selectedCoin = selectedCoin2;
                                  selectedCoin2 = temp;
                                });
                              }
                            },
                            child: Container(
                              height: 30.h,
                              width: 30.h,
                              padding: EdgeInsets.all(8.h),
                              decoration: BoxDecoration(
                                color: orangeColor,
                                shape: BoxShape.circle,
                              ),
                              child: Transform.rotate(
                                angle: pi / 2,
                                child: Image.asset(
                                  swapIcon,
                                  color: whiteColor,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(
                    decoration: getDefaultDecoration(context: context),
                    margin:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Column(
                          children: [
                            Column(
                              children: [
                                CustomDropDown(
                                  name: "Input",
                                  selectedCoin: selectedCoin,
                                  labelColor: theme.textTheme.titleMedium!.color!,
                                  onChange: (value) {
                                    setState(() {
                                      selectedCoin = value as Coin;
                                    });
                                  },
                                ),
                                SwapFieldWidget(
                                    price: 0.00,
                                    currencyName: selectedCoin.name,
                                    color: greenColor),
                                Row(
                                  children: [
                                    const Spacer(),
                                    Text(
                                      "Balance: 0.00",
                                      style: TextStyle(
                                        color: greyColor,
                                        fontSize: 10.5.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 15.h),
                            // Repeat
                            Column(
                              children: [
                                CustomDropDown(
                                  name: "Input",
                                  labelColor: theme.textTheme.titleMedium!.color!,
                                  selectedCoin: selectedCoin2,
                                  onChange: (value) {
                                    setState(() {
                                      selectedCoin2 = value as Coin;
                                    });
                                  },
                                ),
                                SwapFieldWidget(
                                  price: 0.00,
                                  currencyName: selectedCoin2.name,
                                  color: greenColor,
                                ),
                                Row(
                                  children: [
                                    const Spacer(),
                                    Text(
                                      "Balance: 0.00",
                                      style: TextStyle(
                                        color: greyColor,
                                        fontSize: 10.5.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Positioned(
                          child: InkWell(
                            onTap: () {
                              if (_pageIndex == 0) {
                                setState(() {
                                  Coin temp = selectedCoin;
                                  selectedCoin = selectedCoin2;
                                  selectedCoin2 = temp;
                                });
                              }
                            },
                            child: Container(
                              height: 30.h,
                              width: 30.h,
                              padding: EdgeInsets.all(8.h),
                              decoration: BoxDecoration(
                                color: orangeColor,
                                shape: BoxShape.circle,
                              ),
                              child: Transform.rotate(
                                angle: pi / 2,
                                child: Image.asset(
                                  plusIcon,
                                  color: whiteColor,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
            Container(
              height: size.height * 0.13,
              margin: EdgeInsets.symmetric(
                horizontal: 15.w,
                vertical: 10.h,
              ),
              padding: EdgeInsets.symmetric(
                vertical: 10.h,
                horizontal: 10.w,
              ),
              decoration: getDefaultDecoration(context: context),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _pageIndex == 0 ? "Bridge Rate" : "ETH Per BNB",
                        style: TextStyle(
                            fontSize: 11.3.sp,
                            color: greyColor,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        _pageIndex == 0 ? "1 ETH = 1 USD" : "0.305155",
                        style: TextStyle(
                            fontSize: 11.3.sp,
                            color: theme.textTheme.headlineMedium!.color,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _pageIndex == 0
                            ? "Minimum Received1 AGV"
                            : "BNB Pre ETH",
                        style: TextStyle(
                            fontSize: 11.3.sp,
                            color: greyColor,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        _pageIndex == 0 ? "1 ETH" : "3.27703",
                        style: TextStyle(
                            fontSize: 11.3.sp,
                            color: theme.textTheme.headlineMedium!.color,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _pageIndex == 0
                            ? "Estimated Time of Arrival"
                            : "Share of Pool",
                        style: TextStyle(
                            fontSize: 11.3.sp,
                            color: greyColor,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        _pageIndex == 0 ? "5 Min - 20 Min" : "76.35%",
                        style: TextStyle(
                            fontSize: 11.3.sp,
                            color: theme.textTheme.headlineMedium!.color,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: darkPrimaryColor,
                  elevation: 7,
                  shadowColor: shadowColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                ),
                onPressed: () {
                  loadingDialog();
                  Future.delayed(const Duration(seconds: 3), () async {
                    Navigator.pop(context);
                    await successDialog();
                  });
                  // Navigator.pushNamed(context, connectWalletScreen);
                },
                child: Text(
                  "Transfer",
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: 14.5.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  String maskText(
      String text, int prefixLength, int suffixLength, String ellipsis) {
    if (text.length <= prefixLength + suffixLength) {
      return text;
    } else {
      String prefix = text.substring(0, prefixLength);
      String suffix = text.substring(text.length - suffixLength);
      return '$prefix$ellipsis$suffix';
    }
  }

  loadingDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.r),
            ),
            insetPadding: const EdgeInsets.all(30),
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SpinKitCircle(
                          color: loadColor,
                          size: 70,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 13.h),
                          child: Text(
                            "Loading...",
                            style: TextStyle(
                              fontSize: 13.7.sp,
                              color: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .color,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 60.w),
                          child: Text(
                            (_pageIndex == 0) ? "Your swap is being Processing" : "Fund is being transferred to the liquidity pool",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 13.7.sp,
                              color: Theme.of(context).textTheme.titleMedium!.color,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
      },
    );
  }

  successDialog() async {
    await showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.r),
            ),
            insetPadding: const EdgeInsets.all(30),
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(swapSuccess, height: 65.h, width: 65.h),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 13.h),
                          child: Text(
                            "Successfully",
                            style: TextStyle(
                              fontSize: 13.7.sp,
                              color: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .color,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 65.w),
                          child: Text(
                            "Fund has been transferred to the liquidity pool",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 13.7.sp,
                                color: Theme.of(context).textTheme.titleMedium!.color,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: darkPrimaryColor,
                              elevation: 7,

                              shadowColor: shadowColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.r),
                              ),
                            ),
                            onPressed: () async {
                              Navigator.popUntil(
                                context,
                                ModalRoute.withName(homePage),
                              );
                              Navigator.pushNamed(context, swapHistoryScreen);
                            },
                            child: Text(
                              "Ok",
                              style: TextStyle(
                                color: whiteColor,
                                fontSize: 14.5.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
      },
    );
  }
}
