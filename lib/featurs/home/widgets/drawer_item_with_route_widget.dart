import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerItemWithRouteWidget extends StatelessWidget {
  const DrawerItemWithRouteWidget({
    super.key,
    required this.name,
    required this.icon,
    this.route,
    this.textColor,
  });

  final String name;
  final String icon;
  final String? route;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, route!);
      },
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
