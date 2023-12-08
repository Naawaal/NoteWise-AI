import 'package:flutter/material.dart';
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
            onPressed: () async => await controller.saveNote(),
            child: const Text("Save"),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  () => TextFormFieldWidget(
                    hintText: "Title",
                    hintFontSize: 22,
                    controller: controller.titleController,
                  ),
                ),
                Obx(
                  () => TextFormFieldWidget(
                    hintText: "Start typing here...",
                    hintFontSize: 18,
                    controller: controller.noteController,
                    maxLength: null,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // bottomSheet: const AddNoteCustomBottomView(),
    );
  }
}
