import 'package:animate_do/animate_do.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mardod/featurs/auth/screens/login_screen.dart';

import '../../../core/colors.dart';
import '../../../core/constants.dart';
import '../../../core/strings.dart';
import '../../home/screens/home_screen.dart';
import '../../widgets/app_button_widget.dart';
import '../../widgets/app_padding_widget.dart';
import '../../widgets/app_textfield_widget.dart';
import '../../widgets/logo_widget.dart';
import '../widgets/show_terms_and_conditions_dialog_widget.dart';
import '../widgets/social_media_widget.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _userNameController = TextEditingController();
  final _emailOrUsernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _acceptTermsAndConditions = false;

  @override
  void dispose() {
    _fullNameController.dispose();
    _userNameController.dispose();
    _emailOrUsernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeInLeft(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: AppPaddingWidget(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    LogoWidget(
                      width: 200.w,
                      height: 200.h,
                    ),
                    Text(
                      Strings.createNewAccountText,
                      style: TextStyle(
                        fontSize: 32.sp,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              sliver: Form(
                key: _formKey,
                child: SliverList.list(
                  children: [
                    AppTextField(
                      hintText: Strings.fullNameText,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    AppTextField(
                      hintText: Strings.userNameText,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    AppTextField(
                      hintText: Strings.emailText,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    AppTextField(
                      hintText: Strings.passwordHintText,
                      obscureText: true,
                      suffixIcon: true,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    AppTextField(
                      hintText: Strings.confirmPasswordText,
                      obscureText: true,
                      suffixIcon: true,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Checkbox(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          value: _acceptTermsAndConditions,
                          activeColor: ColorsManager.pinkColor,
                          materialTapTargetSize:
                          MaterialTapTargetSize.shrinkWrap,
                          side: BorderSide(
                              color: ColorsManager.borderCheckBoxColor,
                              width: 1.5.sp),
                          onChanged: (value) {
                            _acceptTermsAndConditions = value!;
                            setState(() {});
                          },
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Flexible(
                          child: Text.rich(TextSpan(
                              style: TextStyle(fontSize: 14.sp),
                              children: [
                                TextSpan(text: Strings.termsAndCondition1Text),
                                TextSpan(
                                  text: Strings.termsAndCondition2Text,
                                  style: TextStyle(
                                    color: ColorsManager.pinkColor,
                                    fontSize: 14.sp,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      showDialog(
                                        context: context,
                                        barrierColor: ColorsManager.whiteColor
                                            .withOpacity(.5),
                                        builder: (context) =>
                                            ShowTermsAndConditionsDialogWidget(),
                                      );
                                    },
                                ),
                                TextSpan(text: Strings.termsAndCondition3Text),
                              ])),
                        )
                      ],
                    ),

                    SizedBox(
                      height: 20.h,
                    ),
                    AppAuthButtonWidget(
                      onPressed:
                      (!_acceptTermsAndConditions)
                          ? null
                          : () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => HomeScreen(),
                            ),
                          );
                        }
                      },
                      text: Strings.createNewAccountText,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(
                        children: [
                          TextSpan(
                            text: Strings.alreadyHaveAccountText,
                          ),
                          TextSpan(
                              text: Strings.loginText,
                              style: TextStyle(
                                color: ColorsManager.pinkColor,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => LoginScreen(),
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
                          Theme
                              .of(context)
                              .scaffoldBackgroundColor,
                          child: Text(Strings.orText),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      Strings.enterByText,
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
                            (item) =>
                            SocialMediaWidget(
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
