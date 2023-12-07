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
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.palette),
          ),
        ],
      ),
    ).marginSymmetric(vertical: 05, horizontal: 05);
  }
}
