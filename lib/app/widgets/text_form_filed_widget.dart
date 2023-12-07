import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final double? hintFontSize;
  final int? maxLength;
  const TextFormFieldWidget({
    super.key,
    required this.hintText,
    required this.controller,
    this.hintFontSize = 16,
    this.maxLength = 26,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: null,
      maxLength: maxLength,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.8,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: hintFontSize,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.8,
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
