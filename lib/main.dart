import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:voom_task/View/AppMain.dart';
import 'package:voom_task/View/MyAuctionScreen.dart';
import 'package:voom_task/View/splash_screen.dart';
import 'package:voom_task/style/icons_file.dart';
import './helpers/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        builder: (context, child) => ResponsiveWrapper.builder(
            BouncingScrollWrapper.builder(context, child!),
            maxWidth: 1200,
            minWidth: 450,
            defaultScale: true,
            breakpoints: [
              const ResponsiveBreakpoint.resize(450, name: MOBILE),
              const ResponsiveBreakpoint.autoScale(800, name: TABLET),
              const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
              const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
              const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
            ],
            background: Container(color: const Color(0xFFF5F5F5))),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: const Color(0xFFDC8035),
          colorScheme: ThemeData().colorScheme.copyWith(
              primary: const Color(0xFFDC8035),
              secondary: const Color(0xFF116A92),
              tertiary: const Color(0xFFF4F4F4)),
          scaffoldBackgroundColor: const Color(0xFFF4F4F4),
          // primarySwatch: Colors.blue,
          // fontFamily: "Tajawal"
        ),
        home: const AppMain());
  }
}
