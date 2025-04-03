import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CacheNetworkImage extends StatelessWidget {
  final String photoUrl;
  final double? width;
  final double? height;
  final Widget? waitWidget;
  final Widget? errorWidget;
  final BoxFit? fit;
  CacheNetworkImage({
    required this.photoUrl,
    this.width,
    this.height,
    this.waitWidget,
    this.errorWidget,
    this.fit,
    // this.fit=BoxFit.fill
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: fit,
      width: width,
      height: height,
      imageUrl: "${photoUrl}",
      //"https://static.remove.bg/remove-bg-web/c05ac62d076574fad1fbc81404cd6083e9a4152b/assets/start_remove-c851bdf8d3127a24e2d137a55b1b427378cd17385b01aec6e59d5d4b5f39d2ec.png",
      imageBuilder: (context, imageProvider) =>
          // Image(image: imageProvider),
          Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
            //    colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn)
          ),
        ),
      ),
      placeholder: waitWidget == null ? null : (context, url) => waitWidget!,
      errorWidget:
          errorWidget == null ? null : (context, url, error) => errorWidget!,
    );
  }
}
