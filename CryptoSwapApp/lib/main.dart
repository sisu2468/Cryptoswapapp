import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:swap_app/config/color_constants.dart';
import 'package:swap_app/providers/theme_provider.dart';
import 'package:swap_app/screens/Home/home_page.dart';
import 'package:swap_app/screens/connect/connect_wallet_screen.dart';
import 'package:swap_app/screens/drawer/drawer.dart';
import 'package:swap_app/screens/swap/swap_history.dart';
import 'config/routing_constants.dart';
import 'screens/onboarding/splash_screen.dart';
import 'screens/swap/swap_and_liquidity_screen.dart';
import 'screens/transfer/transfer_coin.dart';

// w500 - w600 -> Medium / Regular
// w700 -> Bold
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider(),),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Swap App',
            themeMode: context.watch<ThemeProvider>().currentMode,
            theme: ThemeData(
              // LIGHT THEME
              primaryColor: primaryColor,
              dialogBackgroundColor: whiteColor,

              highlightColor: lightWhiteColor,
              iconTheme: IconThemeData(
                color: textBlackColor,
              ),
              dividerColor: const Color(0xFF202532).withOpacity(0.16),
              cardColor: lightWhiteColor,
              fontFamily: "Proxima",
              textTheme: TextTheme(
                headlineMedium: TextStyle(
                  color: textBlackColor,
                ),
                titleMedium: TextStyle(
                  color: blackColor,
                ),
              ),
              focusColor: greenColor,
              indicatorColor: whiteColor,
              drawerTheme: DrawerThemeData(
                backgroundColor: textBlackColor,
              ),
            ),
            darkTheme: ThemeData(
              primaryColor: primaryColor,
              dialogBackgroundColor: textBlackColor,
              iconTheme: IconThemeData(
                color: whiteColor,
              ),
              highlightColor: textBlackColor,
              cardColor: textFiledBGColor,
              fontFamily: "Proxima",
              dividerColor: const Color(0xFF3C445A),
              focusColor: lightGreenColor,
              textTheme: TextTheme(
                headlineMedium: TextStyle(
                  color: whiteColor,
                ),
                titleMedium: TextStyle(
                  color: whiteColor,
                ),
              ),

              indicatorColor: textFiledBGColor,
              drawerTheme: DrawerThemeData(
                backgroundColor: whiteColor,
              ),
            ),
            debugShowCheckedModeBanner: false,
            initialRoute: splashScreen,
            onGenerateRoute: (settings) {
              switch (settings.name) {
                case splashScreen:
                  return CupertinoPageRoute(
                      builder: (context) => const SplashScreen(),
                      settings: const RouteSettings(name: splashScreen));
                case homePage:
                  return CupertinoPageRoute(
                      builder: (context) => const HomePage(),
                      settings: const RouteSettings(name: homePage));
                case swapAndLiquidityScreen:
                  return CupertinoPageRoute(
                      builder: (context) => const SwapAndLiquidityScreen(),
                      settings:
                          const RouteSettings(name: swapAndLiquidityScreen));
                case connectWalletScreen:
                  return CupertinoPageRoute(
                      builder: (context) => const ConnectWalletScreen(),
                      settings: const RouteSettings(name: connectWalletScreen));
                case transferCoinScreen:
                  return CupertinoPageRoute(
                      builder: (context) => const TransferCoinScreen(),
                      settings: const RouteSettings(name: transferCoinScreen));
                case swapHistoryScreen:
                  return CupertinoPageRoute(
                      builder: (context) => const SwapHistory(),
                      settings: const RouteSettings(name: swapHistoryScreen));
                case manuPage:
                  return PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 200),
                      transitionsBuilder: (_, a, __, c) =>
                          FadeTransition(opacity: a, child: c),
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const ManuScreen(),
                      settings: const RouteSettings(name: manuPage));
              }
              return null;
            },
          );
        },
      ),
    );
  }
}


