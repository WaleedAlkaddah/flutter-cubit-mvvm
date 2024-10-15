import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final String name;
  final VoidCallback? onPressedCall;
  final FontWeight? fontWeight;
  final Color? textColor;
  final Color? elevatedColor;
  final double? elevatedWidth;
  final double? elevatedHeight;
  final double? fontSize;
  final BorderRadiusGeometry? elevatedBorderRadius;
  const ElevatedButtonWidget({
    Key? key,
    required this.name,
    this.onPressedCall,
    this.fontWeight,
    this.textColor,
    this.elevatedColor,
    this.elevatedWidth,
    this.elevatedHeight,
    this.fontSize,
    this.elevatedBorderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: elevatedWidth!.w,
      height: elevatedHeight!.h,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xff86b43d),
            Color(0xff86b43d),
            Color(0xff6aac41),
            Color(0xff6aac41),
            Color(0xff4da244),
          ],
        ),
        borderRadius: elevatedBorderRadius ?? BorderRadius.circular(18.0).r,
      ),
      child: ElevatedButton(
        onPressed: onPressedCall,
        style: ElevatedButton.styleFrom(
          backgroundColor: elevatedColor ?? Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: elevatedBorderRadius ?? BorderRadius.circular(18.0).r,
          ),
        ),
        // This Down comments was in training
        // First build is Test1.apk using SizedBox with width:1.0.sw with TextAlign.center
        // Second build is Test2.apk using FittedBox with BoxFit.fitWidth
        child: SizedBox(
          width: 1.0.sw,
          child: Text(
            name,
            style: GoogleFonts.cairo(
              fontSize: fontSize!.sp,
              fontWeight: fontWeight ?? FontWeight.bold,
              color: textColor ?? Colors.white,
            ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
