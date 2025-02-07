
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/assets_manager.dart';
import '../../core/colors.dart';
class ImageUserProvider extends StatelessWidget {
  const ImageUserProvider({super.key, this.url, this.height, this.width,this.withHardEdge=true, this.fit, this.radius, this.errorBuilder, this.backgroundColor});
  final String? url;
  final double? height;
  final double? width;
  final double? radius;
  final BoxFit? fit;
  final Widget? errorBuilder;
  final Color? backgroundColor;
  final bool withHardEdge;
  @override
  Widget build(BuildContext context) {
    return
      Container(
        clipBehavior: withHardEdge?Clip.hardEdge:Clip.none,
        width:radius?? 60.sp,
        height: radius??60.sp,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: backgroundColor??ColorsManager.whiteColor,
            )),
      child:
      Image.network(
        url??'',fit:fit,// BoxFit.fitHeight,
        height: height,
        width: width,
        frameBuilder:(context,widget,i,a)=>i!=null?widget:
        errorBuilder??
            Image.asset(
                  AssetsManager.userAccountIMG,
                  fit:fit,
                )
        ??Icon(Icons.person,size: radius,),
        errorBuilder:(context,_,__)=>
        errorBuilder??
            Image.asset(
              AssetsManager.userAccountIMG,
              fit:fit,
            )??
            Icon(Icons.person,size: radius,),
      ));
  }
}
