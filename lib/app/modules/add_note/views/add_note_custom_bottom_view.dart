import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNoteCustomBottomView extends GetView {
  const AddNoteCustomBottomView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(06),
      height: Get.height * 0.06,
      width: Get.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(08),
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: List.generate(
          08,
          (index) => Chip(
            elevation: 02,
            deleteIcon: const Icon(Icons.close, size: 30),
            deleteIconColor: Colors.red,
            backgroundColor:
                Color(math.Random().nextInt(0xffffff)).withOpacity(0.2),
            label: const Text("Journal"),
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5,
            ),
          ).marginAll(02),
        ),
      ),
    ).marginSymmetric(vertical: 05, horizontal: 05);
  }
}
