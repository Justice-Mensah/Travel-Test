import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:traveling/constants/app_colors.dart';
import 'package:traveling/constants/app_images.dart';
import 'package:cached_network_image/cached_network_image.dart';

Widget placeHolderWidget(
    {String? placeHolderImage,
    double? height,
    double? width,
    BoxFit? fit,
    AlignmentGeometry? alignment}) {
  return Container(
    color: secondaryPrimaryColor,
    child: Image.asset(
      placeHolderImage ?? placeholder2,
      height: height,
      width: width,
      alignment: alignment ?? Alignment.center,
    ),
  );
}

Widget cachedImage(
  String? url, {
  double? height,
  double? width,
  BoxFit? fit,
  Color? color,
  String? placeHolderImage,
  AlignmentGeometry? alignment,
  bool usePlaceholderIfUrlEmpty = true,
}) {
  if (url!.validate().isEmpty) {
    print("me");
    return placeHolderWidget(
        placeHolderImage: placeHolderImage,
        height: height,
        width: width,
        fit: fit,
        alignment: alignment);
  } else if (url.validate().startsWith('http')) {
    print("me 2");

    return CachedNetworkImage(
      imageUrl: url,
      height: height,
      width: width,
      fit: fit,
      color: color,
      alignment: alignment as Alignment? ?? Alignment.center,
      errorWidget: (_, s, d) {
        return placeHolderWidget(
            placeHolderImage: placeHolderImage,
            height: height,
            width: width,
            fit: fit,
            alignment: alignment);
      },
    );
  } else {
    print(url);

    return Image.asset(
      url,
      height: height,
      width: width,
      fit: fit,
      color: color,
      alignment: alignment ?? Alignment.center,
      errorBuilder: (_, s, d) {
        return placeHolderWidget(
            height: height, width: width, fit: fit, alignment: alignment);
      },
    );
  }
}
