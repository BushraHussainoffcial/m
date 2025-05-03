import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/colors.dart';
import '../../../core/strings.dart';
import '../controller/auth_controller.dart';
import 'change_password_screen.dart';
import '../../widgets/app_button_widget.dart';
import '../../widgets/app_padding_widget.dart';
import 'package:pinput/pinput.dart';

import '../../core/controllers/smtp_service.dart';
import '../../widgets/logo_widget.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _otpController = TextEditingController();
  String? code;
  String? email;

  setupCode(){
    email=Get
        .put(AuthController())
        .emailController
        .value.text;
    Future.delayed(Duration(seconds: 1),() async {
      // ConstantsWidgets.showLoading();
      print(code);
      print( Get
          .put(AuthController())
          .emailController
          .value.text ?? "");
     await SmtpService.sendCode(code: code ?? "", name: "", email: Get
          .put(AuthController())
          .emailController
          .text ?? "");
      // ConstantsWidgets.closeDialog();
    });
  }
  String generateRandomCode() {
    final random = Random();
    code = "${random.nextInt(9000) + 1000}"; // يولد أرقام بين 100 و 999
    return code.toString();
  }
  @override
  void initState() {
    generateRandomCode();
    setupCode();
    super.initState();
  }
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
                    TextSpan(text: '${((email??"")+"--").substring(0,2)}*****@gmail.com'),
                    // TextSpan(text: 'ma*****@gmail.com'),
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
                      if (value !=(code??"000")) {
                        return "الرمزالمدخل غير صحيح، حاول مرة أخرى";
                      }
                      return null;
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
