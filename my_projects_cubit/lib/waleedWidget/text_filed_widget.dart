import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utility/login_view_utils.dart';

class TextFiledWidget extends StatefulWidget {
  final double widthFiled;
  final double heightFiled;
  final String labelFiled;
  final double? widthLabel;
  final double? heightLabel;
  final double sizeFontLabel;
  final String countryCode;

  const TextFiledWidget({
    super.key,
    required this.widthFiled,
    required this.heightFiled,
    required this.labelFiled,
    required this.countryCode,
    this.widthLabel,
    this.heightLabel,
    required this.sizeFontLabel,
  });

  @override
  State<TextFiledWidget> createState() => _TextFiledWidgetState();
}

class _TextFiledWidgetState extends State<TextFiledWidget> {
  FocusNode myFocusNode = FocusNode();
  @override
  void initState() {
    myFocusNode.addListener(() {
      setState(() {});
    });
    super.initState();
    //ViewUtils.phoneNumberLoginController.clear();
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.widthFiled.w,
      height: widget.heightFiled.h,
      child: TextFormField(
        focusNode: myFocusNode,
        textAlign: TextAlign.right,
        showCursor: false,
        keyboardType: TextInputType.phone,
        controller: LoginViewUtils.phoneNumberLoginController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(bottom: 10.0.h, right: 0.0.w),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF4CA243)),
          ),
          label: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                widget.labelFiled,
                style: GoogleFonts.cairo(
                  fontSize: widget.sizeFontLabel.sp,
                  fontWeight: FontWeight.bold,
                  color: myFocusNode.hasFocus
                      ? const Color(0xFF4CA243)
                      : const Color(0xFF848484),
                ),
              ),
              2.0.horizontalSpace,
            ],
          ),
          prefixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CountryCodePicker(
                padding: const EdgeInsets.all(0.0),
                showFlag: false,
                onChanged: (countryCode) {},
                initialSelection: 'SY',
                showFlagDialog: true,
                showCountryOnly: false,
                showOnlyCountryWhenClosed: false,
                textStyle: GoogleFonts.cairo(
                  fontSize: 12.0.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF848484),
                ),
              ),
              SizedBox(
                height: 23.0.h,
                child: const VerticalDivider(
                  color: Color(0xFF848484),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
