import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swap_app/config/color_constants.dart';
import 'package:swap_app/config/const_data.dart';
import 'package:swap_app/config/const_styles.dart';
import 'package:swap_app/config/image_constants.dart';
import 'package:swap_app/config/routing_constants.dart';
import 'package:swap_app/modals/coin_model.dart';
import 'package:swap_app/modals/network_model.dart';
import 'package:swap_app/screens/widgets/bg_image.dart';
import 'package:swap_app/screens/widgets/custom_dropdown.dart';
import 'package:swap_app/screens/widgets/swap_field_widget.dart';

class SwapAndLiquidityScreen extends StatefulWidget {
  const SwapAndLiquidityScreen({super.key});

  @override
  State<SwapAndLiquidityScreen> createState() => _SwapAndLiquidityScreenState();
}

class _SwapAndLiquidityScreenState extends State<SwapAndLiquidityScreen> {
  int _pageIndex = 0;
  Coin selectedCoin = coins.first;
  Coin selectedCoin2 = coins.last;
  Coin? selectedCoin3;
  NetworkModel selectedNetwork = NetworkModel(
      name: "Ethereum Main Network", color: tealColor, isChecked: true);

  List<NetworkModel> networkData = [
    NetworkModel(
        name: "Ethereum Main Network", color: tealColor, isChecked: true),
    NetworkModel(
        name: "Binance Smart Chain",
        color: const Color(0xFFFCF78C),
        isChecked: false),
    NetworkModel(
        name: "Ropsten Test Network",
        color: const Color(0xFFFF4A8D),
        isChecked: false),
    NetworkModel(
        name: "Kovan Test Network",
        color: const Color(0xFF9064FF),
        isChecked: false),
    NetworkModel(
        name: "Rinkeby Test Network",
        color: const Color(0xFFF6C343),
        isChecked: false),
    NetworkModel(
        name: "Goerli Test Network",
        color: const Color(0xFF3099F2),
        isChecked: false),
    NetworkModel(
        name: "ELocalhost 8545",
        color: const Color(0xFF29B6AF),
        isChecked: false),
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
            AppBar(
              backgroundColor: transparentColor,
              elevation: 0,
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: theme.drawerTheme.backgroundColor,
                ),
              ),
              centerTitle: true,
              title: _pageIndex == 1
                  ? Text(
                      "Add Liquidity",
                      style: TextStyle(
                        fontSize: 19.2.sp,
                        fontWeight: FontWeight.w700,
                        color: theme.textTheme.headlineMedium!.color,
                      ),
                    )
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Swap",
                          style: TextStyle(
                            fontSize: 19.2.sp,
                            fontWeight: FontWeight.w700,
                            color: theme.textTheme.headlineMedium!.color,
                          ),
                        ),
                        SizedBox(width: 2.w),
                        Image.asset(
                          swapIcon,
                          color: theme.drawerTheme.backgroundColor,
                          height: 15.h,
                          fit: BoxFit.cover,
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
                        color: theme.primaryColor,
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
            InkWell(
              onTap: () async {
                await networkDialog(data: networkData);
                setState(() {
                  selectedNetwork =
                      networkData.singleWhere((element) => element.isChecked);
                });
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                decoration: getDefaultDecoration(context: context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                      value: false,
                      groupValue: false,
                      activeColor: tealColor,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      onChanged: (value) {},
                    ),
                    Text(
                      selectedNetwork.name,
                      style: TextStyle(
                        color: theme.textTheme.headlineMedium!.color,
                        fontSize: 15.2.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
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
                                  onChange: (value) {
                                    setState(() {
                                      selectedCoin = value as Coin;
                                    });
                                  },
                                ),
                                SwapFieldWidget(
                                    price: 0.00,
                                    currencyName: selectedCoin.name),
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
                                  onChange: (value) {
                                    setState(() {
                                      selectedCoin2 = value as Coin;
                                    });
                                  },
                                ),
                                SwapFieldWidget(
                                  price: 0.00,
                                  currencyName: selectedCoin2.name,
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
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Input",
                                        style: TextStyle(
                                            color: greyColor,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w700)),
                                    const Spacer(),
                                    SizedBox(width: 5.w),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 4.h),
                                      child: SizedBox(
                                        height: 14.h,
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                            isDense: true,
                                            value: selectedCoin,
                                            dropdownColor: theme.indicatorColor,
                                            icon: Icon(
                                                Icons
                                                    .keyboard_arrow_down_rounded,
                                                color: greyColor,
                                                size: 17.sp),
                                            alignment: Alignment.centerRight,
                                            style: TextStyle(
                                                color: greyColor,
                                                fontSize: 12.7.sp,
                                                fontWeight: FontWeight.w700),
                                            selectedItemBuilder: (context) {
                                              return [
                                                for (int i = 0;
                                                    i < coins.length;
                                                    i++) ...[
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        "Max",
                                                        style: TextStyle(
                                                          color: greyColor,
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                      const SizedBox(width: 4),
                                                      Image.asset(
                                                          coins[i].image,
                                                          scale: 3.6,
                                                          height: 20.h,
                                                          width: 20.h),
                                                      SizedBox(width: 5.w),
                                                      Text(coins[i].name),
                                                    ],
                                                  ),
                                                ],
                                              ];
                                            },
                                            items: coins
                                                .map(
                                                  (e) => DropdownMenuItem(
                                                    value: e,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Image.asset(e.image,
                                                            scale: 3.6,
                                                            height: 20.h,
                                                            width: 20.h),
                                                        SizedBox(width: 5.w),
                                                        Text(e.name),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                                .toList(),
                                            onChanged: (value) {
                                              setState(() {
                                                selectedCoin = value as Coin;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SwapFieldWidget(
                                  price: 0.00,
                                  currencyName: selectedCoin.name,
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
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Input",
                                      style: TextStyle(
                                        color: greyColor,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 4.h),
                                      child: SizedBox(
                                        height: 14.h,
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                            hint: Text(
                                              "Select a currency",
                                              style: TextStyle(
                                                  color: greyColor,
                                                  fontSize: 12.7.sp,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            icon: Icon(
                                                Icons
                                                    .keyboard_arrow_down_rounded,
                                                color: greyColor,
                                                size: 17.sp),
                                            dropdownColor: theme.indicatorColor,
                                            alignment: Alignment.centerRight,
                                            style: TextStyle(
                                                color: greyColor,
                                                fontSize: 12.7.sp,
                                                fontWeight: FontWeight.w700),
                                            isExpanded: false,
                                            value: selectedCoin3,
                                            items: coins
                                                .map(
                                                  (e) => DropdownMenuItem(
                                                    value: e,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Image.asset(e.image,
                                                            scale: 3.6,
                                                            height: 20.h,
                                                            width: 20.h),
                                                        SizedBox(width: 5.w),
                                                        Text(e.name),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                                .toList(),
                                            onChanged: (value) {
                                              setState(() {
                                                selectedCoin3 = value as Coin;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SwapFieldWidget(
                                  price: 0.00,
                                  currencyName: selectedCoin3?.name ?? "",
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
                            onTap: () {},
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
                                  _pageIndex == 0 ? swapIcon : plusIcon,
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
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: darkPrimaryColor,
                    elevation: 7,
                    shadowColor: shadowColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.r),
                    )),
                onPressed: () {
                  Navigator.pushNamed(context, connectWalletScreen);
                },
                child: Text(
                  "Connect Wallet",
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: 14.5,
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

  Future networkDialog({required List<NetworkModel> data}) async {
    await showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.r),
            ),
            insetPadding: const EdgeInsets.all(15),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        child: Text(
                          "Network",
                          style: TextStyle(
                            color: textBlackColor,
                            fontSize: 12.7.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Divider(
                        color: greyColor,
                        height: 5.h,
                        thickness: 1,
                      ),
                      ListView.builder(
                        itemCount: data.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 6.h,
                                    width: 6.h,
                                    margin: EdgeInsets.only(
                                        right: 10.w, left: 15.w),
                                    decoration: BoxDecoration(
                                      color: data[index].color,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  Text(
                                    data[index].name,
                                    style: TextStyle(
                                      color: data[index].isChecked
                                          ? Theme.of(context)
                                              .textTheme
                                              .headlineMedium!
                                              .color
                                          : greyColor,
                                      fontSize: 12.7.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const Spacer(),
                                  Checkbox(
                                    value: data[index].isChecked,
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    activeColor: orangeColor,
                                    overlayColor: MaterialStateProperty.all(
                                        orangeColor.withOpacity(0.5)),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.r),
                                    ),
                                    onChanged: (value) {
                                      for (int i = 0; i < data.length; i++) {
                                        data[i].isChecked = false;
                                      }
                                      setState(() {
                                        data[index].isChecked = true;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              Divider(
                                color: greyColor,
                                height: 5.h,
                                thickness: 1,
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: darkPrimaryColor,
                          elevation: 7,
                          shadowColor: shadowColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.r),
                          )),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Close",
                        style: TextStyle(
                          color: whiteColor,
                          fontSize: 14.5,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
      },
    );
  }
}
