import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:mardod/featurs/welcome/welcome_screen.dart';
import 'package:mardod/featurs/widgets/app_padding_widget.dart';
import 'package:mardod/featurs/widgets/background_widget.dart';
import 'package:mardod/featurs/widgets/loading_widget.dart';
import 'package:mardod/featurs/widgets/logo_widget.dart';

import '../../core/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: Constants.splashDelayed), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const WelcomeScreen(),
        ),
      );
    });
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
