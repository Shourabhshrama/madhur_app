

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Bttn extends StatelessWidget {
  const Bttn({
    Key? key,
    required this.btntext,
    this.btncolor = const Color(0xffF1B03C),
    this.callback,
    this.textcolor = const Color(0xffFDFDFD),
  }) : super(key: key);

  final String btntext;
  final Color? btncolor;
  final VoidCallback? callback;
  final Color? textcolor;
  @override
  Widget build(BuildContext context) {
    return    Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: btncolor,
            onPrimary: textcolor,
            // shadowColor: Colors.greenAccent,
            // elevation: 3,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            minimumSize: const Size(70, 30), //////// HERE
          ),
          onPressed: () {
            callback!();
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //       builder: (context) => const NewFormer()),
            // );
          },
          child:  Text(btntext)),
    )
     ;
  }
}