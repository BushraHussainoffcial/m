import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mardod/core/assets_manager.dart';
import 'package:mardod/core/colors.dart';

class PopularTitlesItemWidget extends StatelessWidget {
  const PopularTitlesItemWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10.h
      ),
      decoration: BoxDecoration(
        color: ColorsManager.pinkColor,
      ),
      child: ListTile(
        leading: Image.asset(
          AssetsManager.starIcon2IMG,
        ),
        title: Text(
          textAlign: TextAlign.center,
          text,
          style: TextStyle(
            fontSize: 18.sp,
          ),
        ),
      ),
    );
  }
}
