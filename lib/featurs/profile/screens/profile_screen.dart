import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mardod/core/assets_manager.dart';
import 'package:mardod/core/colors.dart';
import 'package:mardod/core/theme_manager.dart';
import 'package:mardod/featurs/widgets/app_padding_widget.dart';
import 'package:mardod/featurs/widgets/app_textfield_profile_widget.dart';
import 'package:mardod/featurs/widgets/background_widget.dart';

import '../../../core/strings.dart';
import '../../widgets/app_button_widget.dart';
import '../../widgets/app_textfield_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController(text: 'الاء عبدالله');
  final _userNameController = TextEditingController(text: '@AllaAbdullah1');
  final _emailController =
      TextEditingController(text: 'Allaabdullah@gmail.com');
  final _editPasswordController = TextEditingController(text: '12345678');

  @override
  void dispose() {
    _fullNameController.dispose();
    _userNameController.dispose();
    _emailController.dispose();
    _editPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundHomeWidget(
        child: SafeArea(
          child: AppPaddingWidget(
            verticalPadding: 0,
            child: Column(
              children: [
                SizedBox(height: 10.h,),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: InkWell(
                    onTap: () {
                      if (Navigator.canPop(context)) {
                        Navigator.pop(context);
                      }
                    },
                    child: Image.asset(
                      AssetsManager.backIconIMG,
                      width: 24.sp,
                      height: 24.sp,
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              width: 180.w,
                              height: 180.h,
                              decoration: BoxDecoration(
                                  color: ColorsManager.whiteColor,
                                  borderRadius: BorderRadius.circular(30.r),
                                  boxShadow: [
                                    BoxShadow(
                                        color:
                                            ColorsManager.blackColor.withOpacity(.25),
                                        offset: const Offset(0, 4),
                                        blurRadius: 4.sp)
                                  ]),
                              child: Hero(
                                tag: AssetsManager.userAccountIMG,
                                child: Image.asset(
                                  AssetsManager.userAccountIMG,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            PositionedDirectional(
                              bottom: -20.sp,
                              start: -20.sp,
                              child: FloatingActionButton(
                                backgroundColor:
                                    ColorsManager.profileEditIconColor.withOpacity(.77),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100.r)),
                                onPressed: () {},
                                child: Icon(
                                  Icons.camera_alt_outlined,
                                  color: ColorsManager.whiteColor,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                Strings.fullNameText,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              SizedBox(height: 10.h,),
                              AppTextFieldProfileWidget(
                                controller: _fullNameController,
                                hintText: Strings.fullNameText,
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Text(
                                Strings.userNameText,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              SizedBox(height: 10.h,),
                              AppTextFieldProfileWidget(
                                controller: _userNameController,
                                hintText: Strings.userNameText,
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Text(
                                Strings.emailText,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              SizedBox(height: 10.h,),
                              AppTextFieldProfileWidget(
                                controller: _emailController,
                                hintText: Strings.emailText,
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Text(
                                Strings.editPasswordHintText,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              SizedBox(height: 10.h,),
                              AppTextFieldProfileWidget(
                                controller: _editPasswordController,
                                hintText: Strings.editPasswordHintText,
                                obscureText: true,
                                suffixIcon: true,
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              AppAuthButtonWidget(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {}
                                },
                                text: Strings.saveText,
                              ),
                              SizedBox(height: 20.h,),
                              AppAuthButtonWidget(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {}
                                },
                                text: Strings.deleteAccountText,
                                color: ColorsManager.errorColor,
                              ),

                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
