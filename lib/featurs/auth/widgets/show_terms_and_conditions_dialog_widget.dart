import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:mardod/core/colors.dart';
import 'package:mardod/core/constants.dart';
import 'package:mardod/core/strings.dart';
import 'package:mardod/featurs/app.dart';
import 'package:mardod/featurs/widgets/app_textfield_widget.dart';

class ShowTermsAndConditionsDialogWidget extends StatefulWidget {
  const ShowTermsAndConditionsDialogWidget({super.key});

  @override
  State<ShowTermsAndConditionsDialogWidget> createState() =>
      _ShowTermsAndConditionsDialogWidgetState();
}

class _ShowTermsAndConditionsDialogWidgetState extends State<ShowTermsAndConditionsDialogWidget> {
  final _notesController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            Container(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.sizeOf(context).height / 1.3
              ),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: ColorsManager.homeItemColor,
                border:
                    Border.all(color: ColorsManager.blackColor, width: 1.5.sp),
                borderRadius: BorderRadius.circular(
                  20.r,
                ),
              ),
              child: Material(
                color: ColorsManager.transparentColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16.h,),
                    Center(
                      child: Text(
                        Strings.termsAndConditionsText,
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          padding: EdgeInsets.all(10.sp),
                          decoration: BoxDecoration(
                            color: ColorsManager.whiteColor,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: const HtmlWidget(
                             Constants.termsAndConditionsText,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            PositionedDirectional(
              end: 20.w,
              child: IconButton(
                onPressed: () {
                  if(Navigator.canPop(context)){
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
    );
  }
}
