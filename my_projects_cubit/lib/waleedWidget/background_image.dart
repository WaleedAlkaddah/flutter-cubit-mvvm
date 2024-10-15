import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackgroundImageWidget extends StatelessWidget {
  final String image;
  final Widget? child;
  final double? widthImage;
  final double? heightImage;
  const BackgroundImageWidget(
      {super.key,
      required this.image,
      this.child,
      this.widthImage,
      this.heightImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthImage ?? 758.06.w,
      height: heightImage ?? 870.88.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
