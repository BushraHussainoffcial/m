import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/helper/validator/validator_helper.dart';
import '../../../core/strings.dart';
import '../../profile/controller/profile_controller.dart';
import '../../widgets/app_button_widget.dart';
import '../../widgets/app_padding_widget.dart';
import '../../widgets/app_textfield_widget.dart';
import '../../widgets/logo_widget.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _newPasswordController = TextEditingController();
  final _confirmNewPasswordController = TextEditingController();

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmNewPasswordController.dispose();
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
                Strings.changePasswordText,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 30.sp,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                Strings.pleaseEnterNewPasswordText,
                style: TextStyle(fontSize: 14.sp),
              ),
              SizedBox(
                height: 80.h,
              ),
              //TODO: Add pinput package
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    AppTextField(
                      controller: _newPasswordController,
                      hintText: Strings.newPasswordText,
                      suffixIcon: true,
                      obscureText: true,
                        validator: (value){
                          return FieldValidator([
                            RequiredValidator(),
                            PasswordValidator(),
                          ]).validate(value ?? "");
                        }
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    AppTextField(
                      controller: _confirmNewPasswordController,
                      hintText: Strings.confirmNewPasswordText,
                      suffixIcon: true,
                      obscureText: true,
                        validator: (value) {
                          return FieldValidator([
                            RequiredValidator(),
                            ConfirmPasswordValidator(
                              password: _confirmNewPasswordController.text,
                            ),
                          ]).validate(value ?? "");
                        }
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 34.h,
              ),
              AppAuthButtonWidget(
                text: Strings.changePasswordText,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Get.put(ProfileController()).changePassword(_newPasswordController.value.text);

                    // Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (_) => SuccessfulChangedPasswordScreen(),
                    //   ),
                    // );
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
