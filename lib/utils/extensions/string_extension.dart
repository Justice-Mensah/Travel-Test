import 'package:flutter/material.dart';

import '../../widgets/app_widgets.dart';

extension intExt on String {
  Widget iconImage({double? size, Color? color, BoxFit? fit}) {
    return Image.asset(
      this,
      height: size ?? 24,
      width: size ?? 24,
      fit: fit ?? BoxFit.cover,
      color: color,
      errorBuilder: (context, error, stackTrace) => placeHolderWidget(
          height: size ?? 24, width: size ?? 24, fit: fit ?? BoxFit.cover),
    );
  }
}
