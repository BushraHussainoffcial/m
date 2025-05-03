import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/colors.dart';
import '../../../core/strings.dart';
import 'login_screen.dart';
import '../../widgets/app_button_widget.dart';
import '../../widgets/app_padding_widget.dart';
import '../../widgets/app_textfield_widget.dart';
import '../../widgets/logo_widget.dart';

import '../controller/auth_controller.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  late AuthController authController;

  @override
  void initState() {
    authController = Get.put(AuthController());
    super.initState();
  }
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
                      validator: (value){
                        if(value!.trim().isEmpty){
                          return Strings.requiredFieldText;
                        }
                        if(!value.isEmail){
                          return Strings.enterYourEmailText;
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 34.h,
                  ),
                  AppAuthButtonWidget(
                    text: Strings.sendOTPText,
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await authController.checkEmailIsFound(context, email: _emailController.value.text);

                        // Navigator.push(context, MaterialPageRoute(builder:
                        //     (_) => OtpScreen()
                        // ),);
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
