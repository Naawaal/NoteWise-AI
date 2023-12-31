import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:note_wise_ai/app/data/models/add_note_model.dart';
import 'package:note_wise_ai/app/data/services/db_services.dart';

import '../../../data/models/add_note_category_model.dart';
import '../../home/controllers/home_controller.dart';

class AddNoteController extends GetxController
    with StateMixin<List<AddNoteCategoryModel>> {
  // ----------------- Instance ----------------- //

  // ----------------- Rx Variables ----------------- //
  final _titleController = TextEditingController().obs;

  final _noteController = TextEditingController().obs;

  final _customCategoryController = TextEditingController().obs;

  final _selectedCategory = "Personal".obs;

  final RxList<String> _category = <String>[
    "Work",
    "Personal",
    "Important",
  ].obs;

  // ----------------- Getters ----------------- //

  TextEditingController get titleController => _titleController.value;

  TextEditingController get noteController => _noteController.value;

  TextEditingController get customCategoryController =>
      _customCategoryController.value;

  String get selectedCategory => _selectedCategory.value;

  List<String> get category => _category;

  // ----------------- Setters ----------------- //

  set noteController(TextEditingController value) =>
      _noteController.value = value;

  set titleController(TextEditingController value) =>
      _titleController.value = value;

  set customCategoryController(TextEditingController value) =>
      _customCategoryController.value = value;

  set selectedCategory(String value) => _selectedCategory.value = value;

  set category(List<String> value) => _category.value = value;

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
      category: selectedCategory,
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

  Future<void> saveCategory() async {
    // Create an instance of AddNoteCategoryModel
    final AddNoteCategoryModel addNoteCategoryModel = AddNoteCategoryModel(
      id: int.parse(DateTime.now().millisecondsSinceEpoch.toString()),
      name: customCategoryController.text,
    );
    DBServices.instance.insertCategory(addNoteCategoryModel);
    _customCategoryController.value.clear();
    Get.back();
  }

  Future<void> fetchCategories() async {
    change([], status: RxStatus.loading());
    await DBServices.instance.getCategories().then((value) {
      if (value.isEmpty) {
        change([], status: RxStatus.empty());
      } else if (value.isNotEmpty) {
        change(value, status: RxStatus.success());
      } else {
        change([], status: RxStatus.error("Error"));
      }
    });
    update();
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
