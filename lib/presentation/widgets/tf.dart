import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tf extends StatelessWidget {
  const Tf(
      {Key? key,
      this.controller,
      required this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      this.bordercolor,
      this.fillcolor = Colors.black12})
      : super(key: key);

  final TextEditingController? controller;
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Color? bordercolor;
  final Color? fillcolor;

  @override
  Widget build(BuildContext context) {
    return (
        Padding(
      padding: const EdgeInsets.only(left: 19.0, right: 21),
      child: TextFormField(
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.name,
        controller: controller,
        decoration: InputDecoration(
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: Colors.white54,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: Colors.blue,
                width: 1.0,
              ),
            ),
            hintText: hintText,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 11),
            fillColor: fillcolor,
            filled: true),
      ),
    ));
  }
}
