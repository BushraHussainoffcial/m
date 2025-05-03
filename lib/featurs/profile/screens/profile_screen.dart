import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/assets_manager.dart';
import '../../../core/colors.dart';
import '../../widgets/app_padding_widget.dart';
import '../../widgets/app_textfield_profile_widget.dart';
import '../../widgets/background_widget.dart';

import '../../../core/strings.dart';
import '../../widgets/app_button_widget.dart';
import '../../widgets/image_user_provider.dart';
import '../controller/profile_controller.dart';
import '../widgets/current_password_dialog_widget.dart';
import '../widgets/delete_account_dialog_widget.dart';
import '../widgets/pick_source_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController(text: 'الاء عبدالله');
  final _userNameController = TextEditingController(text: '@AllaAbdullah1');
  final _emailController = TextEditingController(
      text: 'Allaabdullah@gmail.com');
  final _editPasswordController = TextEditingController(text: '12345678');

  final ImagePicker picker = ImagePicker();
  File? userImage;

  late  ProfileController profileController;
  @override
  void initState() {
    profileController = Get.put(ProfileController());
    profileController.refresh();
    super.initState();
  }
  Future _pickPhoto({required ImageSource source}) async {
    Navigator.pop(context);
    final result = await picker.pickImage(source: source);
    if (result != null) {
      setState(() {
        userImage = File(result.path);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('الرجاء اختيار صورة!!')),
      );
    }
  }

  _deletePhoto() {
    if (userImage != null) {
      userImage = null;
      setState(() {});
    }
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _userNameController.dispose();
    _emailController.dispose();
    _editPasswordController.dispose();
    super.dispose();
  }
  Future<void> _saveChanges() async {

    if (_formKey.currentState!.validate()) {
      await  profileController.updateUser();
      setState(() {});
    }
  }


  @override
  Widget build(BuildContext context) {
    print( profileController.profileImage== null|| (profileController.profileImage?.path.isEmpty??true)
    );
    return Scaffold(
      body: BackgroundHomeWidget(
        child: SafeArea(
          child: AppPaddingWidget(
            verticalPadding: 0,
            child: Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Align(
                  alignment: AlignmentDirectional.centerStart,
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
                        GetBuilder<ProfileController>(
                            init: Get.put(ProfileController()),
                            builder: (controller) {
                              return
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
                                                color: ColorsManager.blackColor
                                                    .withOpacity(.25),
                                                offset: const Offset(0, 4),
                                                blurRadius: 4.sp)
                                          ]),
                                      child: Hero(
                                          tag: AssetsManager.userAccountIMG,
                                          child:

                                          profileController.profileImage== null|| (profileController.profileImage?.path.isEmpty??true)?
                                          ImageUserProvider(
                                            url: profileController.imagePath,
                                            fit: BoxFit.cover,
                                            withHardEdge: false,
                                            // radius: 40.sp,
                                          ):
                                          profileController.profileImage!.path == null ? Image.asset(
                                          // userImage == null ? Image.asset(
                                            AssetsManager.userAccountIMG,
                                            fit: BoxFit.cover,
                                          ) : ClipRRect(
                                            clipBehavior: Clip.antiAlias,
                                            borderRadius: BorderRadius.circular(30.r),
                                            child: Image.file(
                                              File(profileController.profileImage!.path)??
                                              File(
                                                userImage!.path,
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          )),
                                    ),
                                    PositionedDirectional(
                                      bottom: -20.sp,
                                      start: -20.sp,
                                      child: FloatingActionButton(
                                        backgroundColor: ColorsManager
                                            .profileEditIconColor
                                            .withOpacity(.77),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(100.r)),
                                        onPressed: () {
                                          showModalBottomSheet(
                                            showDragHandle: true,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.vertical(
                                                    top: Radius.circular(14.r))),
                                            context: context,
                                            builder: (context) => PickSourceWidget(
                                              onPickCamera: () async {

                                                await profileController.pickPhoto(ImageSource.camera);
                                                setState(() {});
                                              },

                                              // _pickPhoto(source: ImageSource.camera),
                                              onPickGallery: ()  async {
                                                await profileController.pickPhoto(ImageSource.gallery);
                                                setState(() {});
                                              },
                                              // _pickPhoto(source: ImageSource.gallery),
                                              onDelete:
                                              profileController.profileImage==null&&(profileController.imagePath?.isEmpty??true)?null:
                                                  () async {
                                                profileController.deletePhoto();
                                                setState(() {});
                                              },
                                              // _deletePhoto,
                                            ),
                                          );
                                        },
                                        // {
                                        //   showModalBottomSheet(
                                        //     showDragHandle: true,
                                        //     shape: RoundedRectangleBorder(
                                        //         borderRadius: BorderRadius.vertical(
                                        //             top: Radius.circular(14.r))),
                                        //     context: context,
                                        //     builder: (context) =>
                                        //         PickSourceWidget(
                                        //           onPickCamera: () async {
                                        //             // await profileController.pickPhoto(ImageSource.camera);
                                        //             _pickPhoto(
                                        //                 source: ImageSource.camera);
                                        //             setState(() {});
                                        //           },
                                        //
                                        //           onPickGallery: () async {
                                        //             // await profileController.pickPhoto(ImageSource.gallery);
                                        //             _pickPhoto(
                                        //                 source: ImageSource.gallery);
                                        //             setState(() {});
                                        //           },
                                        //           onDelete:
                                        //           // profileController.profileImage==null&&(profileController.imagePath?.isEmpty??true)?null:
                                        //               () async {
                                        //             // profileController.deletePhoto();
                                        //             _deletePhoto();
                                        //             setState(() {});
                                        //           },
                                        //         ),
                                        //   );
                                        // },
                                        child: Icon(
                                          Icons.camera_alt_outlined,
                                          color: ColorsManager.whiteColor,
                                        ),
                                      ),
                                    )
                                  ],
                                );}),
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
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              AppTextFieldProfileWidget(
                                controller: profileController.nameController,
                                // controller: _fullNameController,
                                hintText: Strings.fullNameText,
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Text(
                                Strings.userNameText,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              AppTextFieldProfileWidget(
                                controller: profileController.userNameController,
                                // controller: _userNameController,
                                hintText: Strings.userNameText,
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Text(
                                Strings.emailText,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              AppTextFieldProfileWidget(
                                controller: profileController.emailController,
                                // controller: _emailController,
                                hintText: Strings.emailText,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              TextButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) =>
                                        CurrentPasswordDialogWidget(),
                                  );
                                },
                                child: Text(
                                  Strings.editPasswordHintText,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline),
                                ),
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              AppAuthButtonWidget(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    _saveChanges();
                                    // showDialog(
                                    //     context: context,
                                    //     builder: (context) =>
                                    //         DialogWithShadowWidget(
                                    //           text: Strings
                                    //               .saveInformationSuccessfulText,
                                    //         ));
                                  }
                                },
                                text: Strings.saveText,
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              AppAuthButtonWidget(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    barrierColor: ColorsManager.whiteColor
                                        .withOpacity(.5),
                                    builder: (context) =>
                                        DeleteAccountDialogWidget(),
                                  );
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
