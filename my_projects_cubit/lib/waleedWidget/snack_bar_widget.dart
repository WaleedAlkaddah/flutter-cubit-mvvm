import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toastification/toastification.dart';

class SnackBarWidget {
  static void showCustomSnackBar(
      {required String message, required String title}) {
    toastification.show(
      title: Text(
        title,
        style: GoogleFonts.cairo(
          fontSize: 12.sp,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF848484),
        ),
      ),
      autoCloseDuration: const Duration(seconds: 8),
      animationDuration: const Duration(milliseconds: 300),
      primaryColor: Colors.green,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      borderRadius: BorderRadius.circular(20),
      type: ToastificationType.success,
      style: ToastificationStyle.flat,
      description: Text(
        message,
        style: GoogleFonts.cairo(
          fontSize: 12.sp,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF848484),
        ),
      ),
      alignment: Alignment.topRight,
      direction: TextDirection.rtl,
    );
  }
}
