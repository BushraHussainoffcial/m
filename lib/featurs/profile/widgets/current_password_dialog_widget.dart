import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../auth/screens/change_password_screen.dart';
import '../../widgets/app_textfield_profile_widget.dart';

import '../../../core/colors.dart';
import '../../../core/strings.dart';
import '../controller/profile_controller.dart';

class CurrentPasswordDialogWidget extends StatefulWidget {
  const CurrentPasswordDialogWidget({super.key});

  @override
  State<CurrentPasswordDialogWidget> createState() =>
      _CurrentPasswordDialogWidgetState();
}

class _CurrentPasswordDialogWidgetState
    extends State<CurrentPasswordDialogWidget> {
  final _formKey = GlobalKey<FormState>();
  final _currentPasswordController = TextEditingController();

  @override
  void dispose() {
    _currentPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ZoomIn(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: ColorsManager.homeItemColor,
                  border: Border.all(
                      color: ColorsManager.blackColor, width: 1.5.sp),
                  borderRadius: BorderRadius.circular(
                    20.r,
                  ),
                ),
                child: Material(
                  color: ColorsManager.transparentColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 16.h,
                      ),
                      Center(
                        child: Text(
                          Strings.changePasswordText,
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Strings.currentPasswordText,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            AppTextFieldProfileWidget(
                              controller: _currentPasswordController,
                              suffixIcon: true,
                              obscureText: true,
                              validator: (val){

                                if (val!.trim().isEmpty) return Strings.requiredFieldText;
                                if ( !(Get.put(ProfileController()).currentUser.value?.checkPassword(val)??false))
                                  return Strings.unCorrectPasswordFieldText;
                                return null;

                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Align(
                        alignment: AlignmentDirectional.center,
                        child: TextButton(
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
                            child: Text(
                              Strings.validateText,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              PositionedDirectional(
                end: 20.w,
                child: IconButton(
                  onPressed: () {
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                  icon: Icon(
                    Icons.close,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
