import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mardod/core/colors.dart';
import 'package:mardod/core/strings.dart';
import 'package:mardod/core/theme_manager.dart';
import 'package:mardod/featurs/widgets/dialog_with_shaddow_widget.dart';

class ShowThanksDialogWidget extends StatelessWidget {
  const ShowThanksDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DialogWithShadowWidget(
      text: Strings.thanksText,
    );
  }
}
