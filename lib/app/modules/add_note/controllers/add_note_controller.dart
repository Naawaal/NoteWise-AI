import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNoteController extends GetxController {
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

  // ----------------- Functions ----------------- //

  @override
  void onClose() {
    _titleController.close();
    _noteController.close();
    super.onClose();
  }
}
