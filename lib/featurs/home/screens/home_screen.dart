import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/assets_manager.dart';
import '../../../core/colors.dart';
import '../../../core/constants.dart';
import '../../../core/strings.dart';
import '../widgets/drawer_widget.dart';
import '../widgets/home_item_wiget.dart';
import '../../widgets/app_padding_widget.dart';
import '../../widgets/background_widget.dart';
import '../../widgets/logo_widget.dart';

import '../../chat/controller/chat_controller.dart';
import '../../widgets/app_question_textfield_widget.dart';

final drawerKey = GlobalKey<ScaffoldState>();

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _messageController = TextEditingController();
  final _scrollController = ScrollController();

  @override
  void initState() {
    _messageController.addListener(() {
      setState(() {

      });
    });
    super.initState();
  }
  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: drawerKey,
      drawer: const DrawerWidget(),
      body: BackgroundHomeWidget(
        child: FadeInDown(
          child: PrimaryScrollController(
            controller: _scrollController,
            child: CupertinoScrollbar(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: InkWell(
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

                  ),
                  SliverToBoxAdapter(
                    child: AppPaddingWidget(
                      horizontalPadding: 30.w,
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
                                    color: ColorsManager.menuColor
                                        .withOpacity(.9),
                                    blurRadius: 54.sp,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(100.r),
                                gradient: LinearGradient(
                                    colors:
                                        ColorsManager.gradientButtonColors,
                                    stops: [0, 1, 1])),
                            child: AppQuestionTextfieldWidget(
                              controller: _messageController,
                              autofocus: false,
                              textInputAction: TextInputAction.search,
                              hintText: Strings.typeYourQuestionHereText,
                              iconData: AssetsManager.searchIconIMG,
                              showSendButton: _messageController.value.text.trim().isNotEmpty,
                              onTapSendButton: () async {

                              await  Get.put(ChatController()).connectionPerson(context, _messageController.value.text.trim(), _messageController.value.text.trim()
                                    ,message: _messageController.value.text.trim()
                                );
                                _messageController.clear();
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (_) => ChatScreen(),
                                //   ),
                                // );
                              },
                              onFieldSubmitted: (value) async {
                                await  Get.put(ChatController()).connectionPerson(context, _messageController.value.text.trim(), _messageController.value.text.trim()
                                    ,message: _messageController.value.text.trim()
                                );
                                _messageController.clear();
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (_) => ChatScreen(),
                                //   ),
                                // );
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
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30.w,
                    ),
                    sliver: SliverGrid.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 30.w,
                        mainAxisSpacing: 20.h,
                      ),
                      itemBuilder: (context, index) => HomeItemWidget(
                        icon: Constants.homeExploreItems[index].icon,
                        name: Constants.homeExploreItems[index].name,
                        route: Constants.homeExploreItems[index].route,
                      ),
                      itemCount: Constants.homeExploreItems.length,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
