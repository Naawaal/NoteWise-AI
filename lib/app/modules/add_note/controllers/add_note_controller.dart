import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:note_wise_ai/app/data/models/add_note_model.dart';
import 'package:note_wise_ai/app/data/services/db_services.dart';

import '../../home/controllers/home_controller.dart';

class AddNoteController extends GetxController {
  // ----------------- Instance ----------------- //

  // ----------------- Rx Variables ----------------- //
  final _titleController = TextEditingController().obs;

  final _noteController = TextEditingController().obs;

  final _category = "Work".obs;

  final RxList<String> _tags = <String>["Work", "Personal", "Important"].obs;

  // ----------------- Getters ----------------- //

  TextEditingController get titleController => _titleController.value;

  TextEditingController get noteController => _noteController.value;

  String get category => _category.value;

  List<String> get tags => _tags;

  // ----------------- Setters ----------------- //

  set noteController(TextEditingController value) =>
      _noteController.value = value;

  set titleController(TextEditingController value) =>
      _titleController.value = value;

  set category(String value) => _category.value = value;

  set tags(List<String> value) => _tags.value = value;

  // ----------------- Method ----------------- //

  void transparentStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      // Set status bar color to transparent
      statusBarColor: Colors.transparent,
      // Set status bar icons to dark
      statusBarIconBrightness: Brightness.dark,
    ));
  }

  void changeStatusBarTextColor(Brightness brightness) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: brightness,
    ));
  }

  Future<void> saveNote() async {
    // Create an instance of AddNoteModel
    final AddNoteModel addNoteModel = AddNoteModel(
      id: int.parse(DateTime.now().millisecondsSinceEpoch.toString()),
      title: titleController.text,
      note: noteController.text,
      category: "Others",
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

  // ----------------- Life Cycle ----------------- //

  @override
  void onInit() {
    super.onInit();
    transparentStatusBar();
    changeStatusBarTextColor(Brightness.dark);
  }

  @override
  void onClose() {
    _titleController.close();
    _noteController.close();
    transparentStatusBar();
    super.onClose();
  }
}
