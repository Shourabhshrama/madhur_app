import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constant/colors.dart';

EditFieldDecoration(String hint) {
  InputDecoration(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)),
      hintText: hint,
      contentPadding: EdgeInsets.symmetric(
          horizontal: 27.w, vertical: 18.h),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0.r),
        borderSide: const BorderSide(
          color: Colors.white,
          width: 1.0,
        ),
      ),
      fillColor: TfFillColor,
      filled: true);
}

PassWordDecoration(String hint,bool passwordVisible){
  InputDecoration(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r)),
      hintText: 'Enter your password',
      suffixIcon: IconButton(
        icon: Icon(
          // Based on passwordVisible state choose the icon
          passwordVisible
              ? Icons.visibility
              : Icons.visibility_off,
          color: const Color(0xff303B91),
        ),
        onPressed: () {
          // setState(() {
          //   _passwordVisible = !_passwordVisible;
          // });
          // Update the state i.e. toogle the state of passwordVisible variable
        },
      ),
      contentPadding: EdgeInsets.symmetric(
          horizontal: 27.w, vertical: 18.h),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0.r),
        borderSide: const BorderSide(
          color: Colors.white,
          width: 1.0,
        ),
      ),
      fillColor: TfFillColor,
      filled: true);
}