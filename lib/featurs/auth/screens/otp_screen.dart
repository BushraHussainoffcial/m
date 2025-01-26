import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mardod/core/colors.dart';
import 'package:mardod/core/strings.dart';
import 'package:mardod/featurs/auth/screens/change_password_screen.dart';
import 'package:mardod/featurs/widgets/app_button_widget.dart';
import 'package:mardod/featurs/widgets/app_padding_widget.dart';
import 'package:mardod/featurs/widgets/app_textfield_widget.dart';
import 'package:pinput/pinput.dart';

import '../../widgets/logo_widget.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _otpController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: LogoWidget(
          width: 130.sp,
          height: 130.sp,
        ),
      ),
      body: AppPaddingWidget(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 80.h,
              ),
              Text(
                Strings.pleaseVerifyEmailText,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 30.sp,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text.rich(
                  style: TextStyle(fontSize: 14.sp),
                  TextSpan(children: [
                    TextSpan(
                      text: Strings.weWillSentCodeText,
                    ),
                    TextSpan(text: 'ma*****@gmail.com'),
                  ])),
              SizedBox(
                height: 80.h,
              ),
              //TODO: Add pinput package
              Form(
                key: _formKey,
                child: Center(
                  child: Pinput(
                    validator: (value){
                      if(value!.isEmpty){
                        return Strings.requiredFieldText;
                      }
                    },
                    defaultPinTheme: PinTheme(
                        width: 50.w,
                        height: 50.h,
                        margin: EdgeInsets.symmetric(
                            horizontal: 4.w,),
                        decoration: BoxDecoration(
                            color: ColorsManager.whiteColor,
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                              color: ColorsManager.blackColor.withOpacity(
                                .5,
                              ),
                            ))),
                    autofocus: true,
                    controller: _otpController,
                    closeKeyboardWhenCompleted: true,
                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  ),
                ),
              ),
              SizedBox(
                height: 34.h,
              ),
              AppAuthButtonWidget(
                text: Strings.validateText,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ChangePasswordScreen(),
                      ),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
