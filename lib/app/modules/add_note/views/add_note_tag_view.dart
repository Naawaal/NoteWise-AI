import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_wise_ai/app/modules/add_note/controllers/add_note_controller.dart';

class AddNoteTagView extends GetView<AddNoteController> {
  const AddNoteTagView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
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
            focusColor: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            hint: const Text("Select Tag"),
            icon: const Icon(Icons.arrow_drop_down),
            items: [
              const DropdownMenuItem(
                value: 'Custom',
                child: Text('Add Custom Tag'),
              ),
              ...controller.tags.map(
                (e) => DropdownMenuItem(
                  value: e,
                  child: Text(e),
                ),
              ),
            ],
            onChanged: (value) {
              controller.category = value.toString();
            },
          ),
        ),
      ],
    );
  }
}
