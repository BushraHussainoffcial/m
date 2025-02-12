import 'package:flutter/material.dart';
import '../../featurs/widgets/general_dialog_shape_widget.dart';

abstract class GeneralDialog {
  show(BuildContext context);
}

class BotDialog extends GeneralDialog {
  @override
  show(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => GeneralDialogShapeWidget()
    );
  }
}
