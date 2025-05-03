import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/app_padding_widget.dart';
import '../widgets/background_widget.dart';
import '../widgets/loading_widget.dart';
import '../widgets/logo_widget.dart';

import 'controller/splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Get.put(SplashController()).initSplash(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: Column(
          children: [
            const Spacer(),
            ZoomIn(
              child: LogoWidget(),
            ),
            const Spacer(),
            const AppPaddingWidget(
              child: LoadingWidget(),
            )
          ],
        ),
      ),
    );
  }
}
