import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Btn extends StatelessWidget {
  const Btn({
    Key? key,
    required this.btntext,
    this.btncolor = const Color(0xff178E6A),
    this.callback,
    this.textcolor = const Color(0xffFDFDFD),
  }) : super(key: key);

  final String btntext;
  final Color? btncolor;
  final VoidCallback? callback;
  final Color? textcolor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Padding(
        padding: EdgeInsets.only(
            left: ScreenUtil().setHeight(30),
            right: ScreenUtil().setHeight(30),
            bottom: ScreenUtil().setHeight(12),
            top: ScreenUtil().setHeight(12)),
        child: Text(
          btntext,
          style: TextStyle(
            color: textcolor,
            fontWeight: FontWeight.w500,
            fontSize: ScreenUtil().setSp(16),
          ),
        ),
      ),
      onPressed: () async {
        callback!();
      },
      style: ElevatedButton.styleFrom(
        primary: btncolor,
        onPrimary: textcolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
