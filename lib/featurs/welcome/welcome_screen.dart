import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mardod/core/strings.dart';
import 'package:mardod/core/theme_manager.dart';
import 'package:mardod/featurs/auth/screens/login_screen.dart';
import 'package:mardod/featurs/widgets/app_button_widget.dart';
import 'package:mardod/featurs/widgets/app_padding_widget.dart';
import 'package:mardod/featurs/widgets/background_widget.dart';
import 'package:mardod/featurs/widgets/logo_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Spacer(),
            ZoomIn(child: const LogoWidget()),
            const Spacer(),
            FadeInUp(
              child: AppPaddingWidget(
                child: AppButtonWidget(
                  text: Strings.nextText,
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const LoginScreen(),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
