import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mardod/core/assets_manager.dart';
import 'package:mardod/core/colors.dart';
import 'package:mardod/core/constants.dart';
import 'package:mardod/core/strings.dart';
import 'package:mardod/core/theme_manager.dart';
import 'package:mardod/featurs/chat/screens/chat_screen.dart';
import 'package:mardod/featurs/home/widgets/drawer_widget.dart';
import 'package:mardod/featurs/home/widgets/home_item_wiget.dart';
import 'package:mardod/featurs/widgets/app_padding_widget.dart';
import 'package:mardod/featurs/widgets/background_widget.dart';
import 'package:mardod/featurs/widgets/logo_widget.dart';

import '../../widgets/app_question_textfield_widget.dart';

final drawerKey = GlobalKey<ScaffoldState>();

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: drawerKey,
      drawer: DrawerWidget(),
      body: BackgroundHomeWidget(
        child: FadeInDown(
          child: Column(
            children: [
              InkWell(
                onTap: () => drawerKey.currentState!.openDrawer(),
                child: AppPaddingWidget(
                  child: Row(
                    children: [
                      Icon(
                        Icons.menu,
                        color: ColorsManager.menuColor,
                      ),
                      LogoWidget(
                        width: 80.w,
                        height: 80.h,
                      ),
                    ],
                  ),
                ),
              ),
              AppPaddingWidget(
                horizontalPadding: 30.w,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      Image.asset(
                        AssetsManager.homeQuestionIMG,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Container(
                        padding: EdgeInsets.all(4.sp),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: ColorsManager.menuColor.withOpacity(.9),
                                blurRadius: 54.sp,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(100.r),
                            gradient: LinearGradient(
                                colors: ColorsManager.gradientButtonColors,
                                stops: [0, 1, 1])),
                        child: AppQuestionTextfieldWidget(
                          textInputAction: TextInputAction.search,
                          hintText: Strings.typeYourQuestionHereText,
                          iconData: AssetsManager.searchIconIMG,
                          onFieldSubmitted: (value) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ChatScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            AssetsManager.starIconIMG,
                            width: 40.sp,
                            height: 40.sp,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            Strings.exploreText,
                            style: TextStyle(
                                fontSize: 18.sp, fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40.h,),
              Expanded(
                child: ListView.separated(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (_, __) => SizedBox(
                    width: 10.w,
                  ),
                  itemBuilder: (context, index) => HomeItemWiget(
                    icon: Constants.homeExploreItems[index].icon,
                    name: Constants.homeExploreItems[index].name,
                    route: Constants.homeExploreItems[index].route,
                  ),
                  itemCount: Constants.homeExploreItems.length,
                ),
              ),
              SizedBox(height: 40.h,),
            ],
          ),
        ),
      ),
    );
  }
}
