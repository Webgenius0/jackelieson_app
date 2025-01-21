import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jackelieson/networks/endpoints.dart';

import '../gen/assets.gen.dart';

class CustomNetworkImageWidget extends StatelessWidget {
  final String urls;
  final double? width;
  final double? height;
  const CustomNetworkImageWidget({
    super.key,
    required this.urls,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: CachedNetworkImage(
        imageUrl: "$imageUrl/$urls",
        // imageUrl: urls,
        width: width ?? 90.w,
        height: height ?? 70.h,
        fit: BoxFit.cover,
        placeholder: (context, url) => ClipOval(
          child: Image.asset(
            Assets.icons.placeholderImg.path,
            fit: BoxFit.fill,
          ),
        ),
        errorWidget: (context, string, url) => ClipOval(
          child: Image.asset(
            Assets.icons.placeholderImg.path,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
