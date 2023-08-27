
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedButton extends StatelessWidget {
  final String btname;
  final Color? bgcolor;
  final Color ?textcolor;
  //final TextButton?color;
  //final TextStyle? textStyle;
  final VoidCallback? callback;
  // final FontWeight fontWeight;
  // final double fontSize;
  const RoundedButton({
    Key? key,
    required this.btname,
    this.bgcolor = const Color(0xff178E6A),
    //  this.color=  const Color(0xffFFFFFF),
    // this.textStyle,
    this.textcolor= const Color(0xffFDFDFD),
    this.callback,
    //  required this.fontWeight, required this.fontSize
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(24),
          right: ScreenUtil().setWidth(24),
        ),
        child: Container(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              callback!();
            },

            style: ElevatedButton.styleFrom(
              primary: bgcolor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),

            child: Padding(
              padding: EdgeInsets.only(
                  bottom: ScreenUtil().setHeight(17),
                  top: ScreenUtil().setHeight(16)),
              child: Text(
                btname,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: ScreenUtil().setSp(16),color: textcolor
                ),
              ),
            ),
          ),
        ));
  }
}
