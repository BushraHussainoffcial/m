import 'package:flutter/cupertino.dart';
import '../../../core/strings.dart';
import '../../widgets/dialog_with_shaddow_widget.dart';

class ShowThanksDialogWidget extends StatelessWidget {
  const ShowThanksDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DialogWithShadowWidget(
      text: Strings.thanksText,
    );
  }
}
