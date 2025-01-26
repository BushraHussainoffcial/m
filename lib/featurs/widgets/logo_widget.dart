import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mardod/featurs/app.dart';

import '../../core/assets_manager.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key, this.width, this.height});

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AssetsManager.logoIMG,
      width: width,
      height: height,
    );
  }
}
