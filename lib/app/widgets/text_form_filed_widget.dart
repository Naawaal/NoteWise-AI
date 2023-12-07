import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final double? fontSize;
  final int? maxLength;
  const TextFormFieldWidget({
    super.key,
    required this.hintText,
    required this.controller,
    this.fontSize = 16,
    this.maxLength = 26,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: null,
      maxLength: maxLength,
      buildCounter: (BuildContext context,
              {int? currentLength, int? maxLength, bool? isFocused}) =>
          null,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
        ),
        enabled: true,
        border: InputBorder.none,
        fillColor: Colors.transparent,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
    );
  }
}
