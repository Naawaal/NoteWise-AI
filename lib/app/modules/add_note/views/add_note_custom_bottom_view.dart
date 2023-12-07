import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AddNoteCustomBottomView extends GetView {
  const AddNoteCustomBottomView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.06,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(08),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () async {},
            icon: const Icon(Iconsax.microphone),
          ),
          IconButton(
            onPressed: () async {},
            icon: const Icon(Iconsax.attach_circle),
          ),
          IconButton(
            onPressed: () async {},
            icon: const Icon(Iconsax.color_swatch),
          ),
          IconButton(
            onPressed: () async {},
            icon: const Icon(Iconsax.tag),
          ),
          const Expanded(child: SizedBox.shrink()),
          IconButton(
            onPressed: () async {},
            icon: const Icon(Iconsax.magicpen),
          ),
        ],
      ),
    );
  }
}
