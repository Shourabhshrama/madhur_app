import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constant/colors.dart';

titleText(String text) {
  return Padding(
    padding: const EdgeInsets.only(left: 24.0, bottom: 8),
    child: Text(
      text,
      style: TextStyle(
        color: tBlack,
        fontWeight: FontWeight.w600,
        fontSize: ScreenUtil().setSp(14),
      ),
    ),
  );
}

pageTitleText(String string){
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Text(
      "Forgot Password",
      textAlign: TextAlign.center,
      style: TextStyle(
          color: tBlack,
          fontSize: ScreenUtil().setSp(18),
          fontWeight: FontWeight.w600),
    ),
  );
}


errorText(String text){
  return Padding(
    padding: const EdgeInsets.only(left: 24.0, bottom: 8),
    child: Text(
      text,
      style: const TextStyle(color: Colors.red),
    ),
  );
}