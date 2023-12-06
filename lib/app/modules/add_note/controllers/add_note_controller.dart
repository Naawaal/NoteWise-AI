import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_wise_ai/app/data/models/add_note_model.dart';
import 'package:note_wise_ai/app/data/services/db_services.dart';

class AddNoteController extends GetxController {
  // ----------------- Instance ----------------- //

  final DBServices _dbServices = DBServices();

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

  Future<void> saveNote() async {
    await _dbServices.addNote(
      AddNoteModel(
        id: int.parse(DateTime.now().millisecondsSinceEpoch.toString()),
        title: titleController.text,
        note: noteController.text,
        category: 'General',
        date: DateTime.now().toString(),
      ),
    );
  }

  Future<void> getNotes() async {
    await _dbServices.getNotes();
  }

  // ----------------- Life Cycle ----------------- //

  @override
  void onClose() {
    _titleController.close();
    _noteController.close();
    super.onClose();
  }
}
