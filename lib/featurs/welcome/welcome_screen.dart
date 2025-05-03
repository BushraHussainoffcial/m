import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../../core/strings.dart';
import '../auth/screens/login_screen.dart';
import '../widgets/app_button_widget.dart';
import '../widgets/app_padding_widget.dart';
import '../widgets/background_widget.dart';
import '../widgets/logo_widget.dart';

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
            ),

          ],
        ),
      ),
    );
  }
}
