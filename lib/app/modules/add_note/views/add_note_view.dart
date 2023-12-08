import 'package:flutter/material.dart';
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Dec 12, 2021 at 12:00 PM",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.blueGrey,
                      ),
                    ),
                    Obx(
                      () => DropdownButton(
                        underline: const SizedBox(),
                        isExpanded: false,
                        value: controller.category,
                        isDense: true,
                        borderRadius: BorderRadius.circular(10),
                        hint: const Text("Select Tag"),
                        icon: const Icon(Icons.arrow_drop_down),
                        items: controller.tags
                            .map(
                              (e) => DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              ),
                            )
                            .toList(),
                        focusColor: Colors.transparent,
                        onChanged: (value) {
                          controller.category = value.toString();
                        },
                      ),
                    ),
                  ],
                ),
                const Divider(),
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
      bottomSheet: const AddNoteCustomBottomView(),
    );
  }
}
