import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:note_wise_ai/app/widgets/text_form_filed_widget.dart';

import '../controllers/add_note_controller.dart';

class AddNoteView extends GetView<AddNoteController> {
  const AddNoteView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              await controller.getNotes();
              Get.back();
            },
            child: const Text("Save"),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Obx(
              () => TextFormFieldWidget(
                hintText: "Title",
                fontSize: 20,
                controller: controller.titleController,
              ),
            ),
            const Gap(15),
            Obx(
              () => TextFormFieldWidget(
                hintText: "Note",
                controller: controller.noteController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
