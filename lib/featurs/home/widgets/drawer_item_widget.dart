import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerItemWidget extends StatelessWidget {
  const DrawerItemWidget({
    super.key,
    required this.name,
    required this.icon,
    this.onTap,
    this.textColor,
  });

  final String name;
  final String icon;
  final VoidCallback? onTap;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      dense: true,
      leading: Image.asset(
        icon,
        width: 26.sp,
        height: 26.sp,
      ),
      title: Padding(
        padding: EdgeInsets.only(top: 8.h),
        child: Text(
          name,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: textColor
          ),
        ),
      ),
    );
  }
}
