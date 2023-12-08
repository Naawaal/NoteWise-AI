import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:note_wise_ai/app/modules/add_note/controllers/add_note_controller.dart';

class AddNoteCustomBottomView extends GetView<AddNoteController> {
  const AddNoteCustomBottomView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
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
