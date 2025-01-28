import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mardod/featurs/record/screens/record_screen.dart';
import '../core/constants.dart';
import '../core/strings.dart';
import '../core/theme_manager.dart';
import 'splash/splash_screen.dart';

class MardodApp extends StatelessWidget {
  const MardodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(
        Constants.widthSize,
        Constants.heightSize,
      ),
      builder: (context, child) {
        return GetMaterialApp(
          locale: const Locale('ar'),
          debugShowCheckedModeBanner: false,
          title: Strings.appName,
          theme: ThemeManager.myTheme,
          home: const SplashScreen(),
          routes: {
            '/recordRoute': (_)=>RecordScreen()
          },
        );
      },
    );
  }
}
