import 'package:animate_do/animate_do.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mardod/core/colors.dart';
import 'package:mardod/core/constants.dart';
import 'package:mardod/core/strings.dart';
import 'package:mardod/featurs/auth/screens/forget_password_screen.dart';
import 'package:mardod/featurs/auth/screens/signup_screen.dart';
import 'package:mardod/featurs/auth/widgets/social_media_widget.dart';
import 'package:mardod/featurs/home/screens/home_screen.dart';
import 'package:mardod/featurs/widgets/app_padding_widget.dart';
import 'package:mardod/featurs/widgets/app_textfield_widget.dart';
import 'package:mardod/featurs/widgets/logo_widget.dart';

import '../../widgets/app_button_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailOrUsernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailOrUsernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeInRight(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: ColorsManager.shadowLoginColor,
                        blurRadius: 30.sp,
                        offset: Offset(0, 4.sp)),
                  ],
                  color: ColorsManager.whiteColor,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(30.r),
                  ),
                ),
                child: AppPaddingWidget(
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      const LogoWidget(),
                      Text(
                        Strings.loginText,
                        style: TextStyle(
                          fontSize: 32.sp,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                sliver: Form(
                  key: _formKey,
                  child: SliverList.list(
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      AppTextField(
                        hintText: Strings.emailOrUsernameHintText,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      AppTextField(
                        hintText: Strings.passwordHintText,
                        obscureText: true,
                        suffixIcon: true,
                      ),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: TextButton(
                            style:
                                TextButton.styleFrom(padding: EdgeInsets.zero),
                            onPressed: () {
                              // TODO : Forget Password Screen
                              Navigator.push(context,
                                  MaterialPageRoute(
                                      builder: (_)=>ForgetPasswordScreen()
                                  ),
                              );

                            },
                            child: Text(
                              Strings.forgetPasswordText,
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  color: ColorsManager.forgetPasswordColor),
                            )),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      AppAuthButtonWidget(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => HomeScreen(),
                              ),
                            );
                          }
                        },
                        text: Strings.enterText,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text.rich(
                        textAlign: TextAlign.center,
                        TextSpan(
                          children: [
                            TextSpan(
                              text: Strings.doNotHaveAccountText,
                            ),
                            TextSpan(
                                text: Strings.createNewAccountText,
                                style: TextStyle(
                                  color: ColorsManager.pinkColor,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => SignupScreen(),
                                      ),
                                    );
                                  }),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Divider(
                            color: ColorsManager.blackColor,
                            thickness: 1.sp,
                          ),
                          CircleAvatar(
                            backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            child: Text(Strings.orText),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        Strings.loginByText,
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: ColorsManager.blackColor.withOpacity(.4)),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: Constants.socialMediaList
                            .map(
                              (item) => SocialMediaWidget(
                                image: item,
                              ),
                            )
                            .toList(),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
