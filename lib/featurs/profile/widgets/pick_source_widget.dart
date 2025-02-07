import 'package:flutter/material.dart';
import 'package:mardod/core/colors.dart';

import '../../../core/strings.dart';

class PickSourceWidget extends StatelessWidget {
  const PickSourceWidget(
      {super.key, this.onPickCamera, this.onPickGallery, this.onDelete});

  final VoidCallback? onPickCamera;
  final VoidCallback? onPickGallery;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          onTap: onPickCamera,
          dense: true,
          title: Text(Strings.pickFromCameraText),
          leading: CircleAvatar(
            backgroundColor: ColorsManager.pinkColor.withOpacity(.5),
            child: Icon(Icons.camera_alt_outlined),
          ),
        ),
        Divider(),
        ListTile(
          onTap: onPickGallery,
          dense: true,
          title: Text(Strings.pickFromGalleryText),
          leading: CircleAvatar(
            backgroundColor: ColorsManager.pinkColor.withOpacity(.5),
            child: Icon(Icons.photo_outlined),
          ),
        ),
        if (onDelete != null) ...[
          Divider(),
          ListTile(
            onTap: onDelete,
            dense: true,
            title: Text(
              Strings.deletePhotoText,
              style: const TextStyle(color: ColorsManager.errorColor),
            ),
            leading: CircleAvatar(
              backgroundColor: ColorsManager.errorColor,
              child: Icon(
                Icons.delete_outline,
                color: ColorsManager.whiteColor,
              ),
            ),
          ),
        ]
      ],
    );
  }
}
