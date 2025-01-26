import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mardod/core/assets_manager.dart';
import 'package:mardod/core/colors.dart';
import 'package:mardod/core/theme_manager.dart';
import 'package:mardod/featurs/widgets/app_padding_widget.dart';

class RecordItemWidget extends StatelessWidget {
  const RecordItemWidget({
    super.key,
    required this.title,
    required this.date,
  });

  final String title;
  final String date;

  @override
  Widget build(BuildContext context) {
    return AppPaddingWidget(
      verticalPadding: 12.h,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: ColorsManager.whiteColor,
            border: Border.all(
                color: ColorsManager.borderRecordItemColor.withOpacity(.6),
                width: 1)),
        child: ListTile(
          onTap: (){},
          dense: true,
          leading: Image.asset(AssetsManager.recordItemIconIMG),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 16.sp
            ),
          ),
          subtitle: Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: Text(
              date,
              style: TextStyle(
                  fontSize: 12.sp, color: ColorsManager.hintTextFieldColor),
            ),
          ),
        ),
      ),
    );
  }
}
