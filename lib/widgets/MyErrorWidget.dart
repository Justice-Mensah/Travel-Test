import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:traveling/constants/app_images.dart';

import 'app_widgets.dart';

class MyErrorWidget extends StatelessWidget {
  final String msg;

  MyErrorWidget(this.msg);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        cachedImage(notDataFoundImg, height: 200, width: 200),
        8.height,
        Text('$msg', textAlign: TextAlign.center),
      ],
    );
  }
}
