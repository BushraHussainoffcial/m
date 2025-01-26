import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mardod/core/colors.dart';
import 'package:mardod/core/strings.dart';
import 'package:mardod/featurs/auth/screens/login_screen.dart';
import 'package:mardod/featurs/auth/screens/otp_screen.dart';
import 'package:mardod/featurs/widgets/app_button_widget.dart';
import 'package:mardod/featurs/widgets/app_padding_widget.dart';
import 'package:mardod/featurs/widgets/app_textfield_widget.dart';
import 'package:mardod/featurs/widgets/logo_widget.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: LogoWidget(
          width: 130.sp,
          height: 130.sp,
        ),
      ),
      body: AppPaddingWidget(
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.bottomCenter,
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 80.h,
                  ),
                  Text(
                    Strings.areYouForgetPasswordText,
                    style:
                    TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 30.sp),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    Strings.enterYourEmailText,
                    style: TextStyle(
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(
                    height: 80.h,
                  ),
                  Form(
                    key: _formKey,
                    child: AppTextField(
                      controller: _emailController,
                      hintText: Strings.emailText,
                      //ToDo : Check is real email
                      // validator: ,
                    ),
                  ),
                  SizedBox(
                    height: 34.h,
                  ),
                  AppAuthButtonWidget(
                    text: Strings.sendOTPText,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(context, MaterialPageRoute(builder:
                            (_) => OtpScreen()
                        ),);
                      }
                    },
                  )
                ],
              ),
            ),
            PositionedDirectional(
              bottom: 10.h,
              child: Text.rich(
                TextSpan(
                    children: [
                      TextSpan(
                          text: Strings.rememberPasswordText
                      ),
                      TextSpan(
                          text: Strings.loginText,
                          style: TextStyle(
                              color: ColorsManager.pinkColor
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(
                                      builder: (_) => LoginScreen()
                                  )
                              );
                            }
                      ),
                    ]
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
