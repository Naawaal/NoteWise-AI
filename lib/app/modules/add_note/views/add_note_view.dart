import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:note_wise_ai/app/modules/add_note/views/add_note_custom_bottom_view.dart';
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
            onPressed: () async => await controller.saveNote(),
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
                hintFontSize: 22,
                controller: controller.titleController,
              ),
            ),
            const Gap(15),
            Obx(
              () => TextFormFieldWidget(
                hintText: "Note",
                hintFontSize: 18,
                controller: controller.noteController,
                maxLength: null,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AddNoteCustomBottomView(),
    );
  }
}
