import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_wise_ai/app/data/models/add_note_model.dart';
import 'package:note_wise_ai/app/data/services/db_services.dart';

import '../../home/controllers/home_controller.dart';

class AddNoteController extends GetxController {
  // ----------------- Instance ----------------- //

  // ----------------- Rx Variables ----------------- //
  final _titleController = TextEditingController().obs;

  final _noteController = TextEditingController().obs;

  // ----------------- Getters ----------------- //

  TextEditingController get titleController => _titleController.value;

  TextEditingController get noteController => _noteController.value;

  // ----------------- Setters ----------------- //

  set noteController(TextEditingController value) =>
      _noteController.value = value;

  set titleController(TextEditingController value) =>
      _titleController.value = value;

  // ----------------- Method ----------------- //

  Future<void> saveNote() async {
    // Create an instance of AddNoteModel
    final AddNoteModel addNoteModel = AddNoteModel(
      id: int.parse(DateTime.now().millisecondsSinceEpoch.toString()),
      title: titleController.text,
      note: noteController.text,
      category: "General",
      date: DateTime.now().toString(),
    );
    DBServices.instance.insertNote(addNoteModel);
    _titleController.value.clear();
    _noteController.value.clear();
    // Get the instance of HomeController
    final homeController = Get.find<HomeController>();
    await homeController.fetchSavedNotes();
    Get.back();
  }

  Future<void> getNotes() async {}

  // ----------------- Life Cycle ----------------- //

  @override
  void onClose() {
    _titleController.close();
    _noteController.close();
    super.onClose();
  }
}
