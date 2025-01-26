import 'package:flutter/cupertino.dart';
import 'package:mardod/core/assets_manager.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({super.key, this.child});
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          AssetsManager.backgroundIMG,
          width: double.maxFinite,
          height: double.maxFinite,
          fit: BoxFit.cover,
        ),
        child!
      ],
    );
  }
}


class BackgroundHomeWidget extends StatelessWidget {
  const BackgroundHomeWidget({super.key, this.child});
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          AssetsManager.backgroundHomeIMG,
          width: double.maxFinite,
          height: double.maxFinite,
          fit: BoxFit.cover,
        ),
        child!
      ],
    );
  }
}
