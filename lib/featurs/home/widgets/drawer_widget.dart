import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/assets_manager.dart';
import '../../../core/colors.dart';
import '../../../core/strings.dart';
import 'helper_dialog_widget.dart';
import 'logout_dialog_widget.dart';
import '../../profile/screens/profile_screen.dart';
import '../../widgets/app_padding_widget.dart';
import '../../widgets/background_widget.dart';
import '../../widgets/logo_widget.dart';

import '../../chat/controller/chat_controller.dart';
import '../../profile/controller/profile_controller.dart';
import '../../widgets/image_user_provider.dart';
import 'drawer_item_widget.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.horizontal(
          end: Radius.circular(8.r),
        ),
      ),
      child: BackgroundHomeWidget(
        child: FadeInRight(
          child: Column(
            children: [
              Stack(
                children: [
                  LogoWidget(),
                  PositionedDirectional(
                    bottom: 0,
                    child: InkWell(
                      onTap: () {
                        // Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ProfileScreen(),
                          ),
                        );
                      },
                      child: AppPaddingWidget(
                        verticalPadding: 0,
                        horizontalPadding: 10.w,
                        child:
                        GetBuilder<ProfileController>(
                            init: Get.put(ProfileController()),
                            // init: Get.put(ProfileController()),
                            builder: (controller) {
                              return
                                Row(
                                  children: [
                                    Container(
                                      clipBehavior: Clip.hardEdge,
                                      width: 60.sp,
                                      height: 60.sp,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: ColorsManager.whiteColor,
                                          )),
                                      child:
                                      Hero(
                                        tag: AssetsManager.userAccountIMG,
                                        child:
                                        ImageUserProvider(
                                          url: controller.currentUser.value?.photoUrl,
                                            fit: BoxFit.cover
                                        )

                                      ),
                                      // Hero(
                                      //   tag: AssetsManager.userAccountIMG,
                                      //   child: Image.asset(
                                      //     AssetsManager.userAccountIMG,
                                      //     fit: BoxFit.cover,
                                      //   ),
                                      // ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    SizedBox(
                                      width: 200.w,
                                      child: Text(
                                        controller.currentUser.value?.name?? 'آلاء عبدالله',
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                            }),


                      ),
                    ),
                  ),
                  PositionedDirectional(
                      end: 10.w,
                      top: 10.h,
                      child: SafeArea(
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                            AssetsManager.drawerCloseIconIMG,
                            width: 30.sp,
                            height: 30.sp,
                          ),
                        ),
                      )),
                  PositionedDirectional(
                      bottom: 16.h,
                      end: 10.w,
                      child: Image.asset(
                        AssetsManager.drawerNavigateIconIMG,
                        width: 30.sp,
                        height: 30.sp,
                      )),
                ],
              ),
              Divider(
                color: ColorsManager.whiteColor,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      DrawerItemWidget(
                        name: Strings.homePageText,
                        icon: AssetsManager.homeIconIMG,
                        onTap: (){
                          Navigator.pop(context);
                        },),
                      DrawerItemWidget(
                        name: Strings.logText,
                        icon: AssetsManager.logIconIMG,
                        onTap: (){
                          Navigator.pushNamed(context,
                              '/recordRoute'
                          );
                        },),
                      DrawerItemWidget(
                        name: Strings.clearLogText,
                        icon: AssetsManager.clearLogIconIMG,
                        onTap: (){
                          Get.put(ChatController()).deleteChatsByIdUser(context, listIdUser: [
                            Get.put(ProfileController()).currentUser.value?.uid

                          ]);
                          // showDialog(
                          //   context: context,
                          //   builder: (context) =>
                          //       DialogWithShadowWidget(
                          //           text: Strings.clearLogDoneText
                          //       ),
                          // );
                        },
                      ),
                      // DrawerItemWidget(
                      //   name: Strings.freeSpaceText,
                      //   icon: AssetsManager.freeSpaceIconIMG,
                      //   onTap: (){
                      //     showDialog(
                      //       context: context,
                      //       builder: (context) =>
                      //           DialogWithShadowWidget(
                      //               text: Strings.freeSpaceDoneText
                      //           ),
                      //     );
                      //   },
                      // ),
                    ],

                  ),
                ),
              ),
              DrawerItemWidget(
                name: Strings.helpText,
                icon: AssetsManager.helpIconIMG,
                onTap: (){
                  showDialog(
                    context: context,
                    barrierColor: ColorsManager.whiteColor
                        .withOpacity(.5),
                    builder: (context) =>
                        HelperDialogWidget(),
                  );
                },

              ),
              DrawerItemWidget(
                onTap: (){
                  showDialog(
                    context: context,
                    barrierColor: ColorsManager.whiteColor
                        .withOpacity(.5),
                    builder: (context) =>
                        LogoutDialogWidget(),
                  );
                },
                name: Strings.logoutText,
                icon: AssetsManager.logoutIconIMG,
                textColor: ColorsManager.errorColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
