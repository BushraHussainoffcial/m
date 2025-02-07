import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mardod/core/colors.dart';
import 'package:mardod/core/strings.dart';
import 'package:mardod/featurs/widgets/app_textfield_widget.dart';
import 'package:mardod/featurs/widgets/dialog_with_shaddow_widget.dart';

class ShowYourNotesDialogWidget extends StatefulWidget {
  const ShowYourNotesDialogWidget({super.key});

  @override
  State<ShowYourNotesDialogWidget> createState() =>
      _ShowYourNotesDialogWidgetState();
}

class _ShowYourNotesDialogWidgetState extends State<ShowYourNotesDialogWidget> {
  final _notesController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _notesController.dispose();
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
                child: SingleChildScrollView(
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
                            Strings.sorryForYouText,
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          Strings.yourNotesIsImportantText,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Form(
                          key: _formKey,
                          child: AppTextField(
                            minLine: 4,
                            maxLine: 8,
                            hintText: '...',
                            textInputAction: TextInputAction.newline,
                            keyboardType: TextInputType.multiline,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                showDialog(
                                    context: context,
                                    builder: (context) => DialogWithShadowWidget(
                                        text: Strings
                                            .reportWasReceivedSuccessfullyText));
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 50.w, vertical: 20.h),
                              decoration: BoxDecoration(
                                  color: ColorsManager.authButtonColor,
                                  borderRadius: BorderRadius.circular(
                                    8.r,
                                  )),
                              child: Text(
                                Strings.sendText,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
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
