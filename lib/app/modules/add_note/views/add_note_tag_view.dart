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
            itemHeight: 50,
            value: controller.selectedCategory,
            isDense: true,
            focusColor: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            hint: const Text("Select Category"),
            icon: const Icon(Icons.arrow_drop_down),
            items: [
              DropdownMenuItem(
                value: 'Custom',
                child: const Text('Custom Category'),
                onTap: () async {},
              ),
              ...controller.category.map(
                (e) => DropdownMenuItem(
                  value: e,
                  child: Text(e),
                ),
              ),
            ],
            onChanged: (value) {
              if (value == "Custom") {
                Get.defaultDialog(
                  title: "Add category",
                  titleStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  content: TextField(
                    controller: controller.customCategoryController,
                    decoration: const InputDecoration(
                      hintText: "Enter Category Name",
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      border: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                    ),
                  ),
                  textConfirm: "Add",
                  onConfirm: () {
                    controller.category
                        .add(controller.customCategoryController.value.text);
                    controller.selectedCategory =
                        controller.customCategoryController.text;
                    Get.back();
                  },
                );
              } else {
                controller.selectedCategory = value.toString();
              }
            },
          ),
        ),
      ],
    );
  }
}
