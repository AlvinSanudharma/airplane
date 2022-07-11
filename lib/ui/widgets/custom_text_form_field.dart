import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:airplane/shared/theme.dart';

class CustomTextFormField extends StatelessWidget {
  final String title;
  final String hintText;
  final bool obscureText;
  final double margin;

  const CustomTextFormField(
      {Key? key,
      required this.title,
      required this.hintText,
      this.obscureText = false,
      this.margin = 20})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: margin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: blackTextStyle.copyWith(fontSize: 14, fontWeight: regular),
          ),
          SizedBox(
            height: 6,
          ),
          TextFormField(
            cursorColor: kPrimaryColor,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: regular),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(defaultRadius)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(defaultRadius),
                  borderSide: BorderSide(color: kPrimaryColor)),
            ),
            obscureText: obscureText,
          )
        ],
      ),
    );
  }
}
