import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_wise_ai/app/data/models/add_note_model.dart';
import 'package:note_wise_ai/app/data/services/db_services.dart';

class HomeController extends GetxController
    with StateMixin<List<AddNoteModel>> {
  // ----------------- Instance ----------------- //

  // ----------------- Rx Variables ----------------- //

  final RxList<MaterialColor> _notesColors = <MaterialColor>[
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
    Colors.pink,
    Colors.teal,
    Colors.cyan,
    Colors.brown,
    Colors.grey,
    Colors.indigo,
    Colors.lime,
  ].obs;

  // ----------------- Getters ----------------- //

  List<MaterialColor> get notesColors => _notesColors;

  // ----------------- Setters ----------------- //

  set notesColors(List<MaterialColor> value) => _notesColors.value = value;

  // ----------------- Method ----------------- //

  void randomColor() {
    final random = Random();
    final index = random.nextInt(_notesColors.length);
    Get.changeTheme(ThemeData(primarySwatch: _notesColors[index]));
  }

  Future<void> fetchSavedNotes() async {
    change(null, status: RxStatus.loading());
    await DBServices.instance.getNotes().then((value) {
      if (value.isEmpty) {
        change(null, status: RxStatus.empty());
      } else {
        change(value, status: RxStatus.success());
      }
    }, onError: (error) {
      change(null, status: RxStatus.error(error.toString()));
    });
    update();
  }

  Future<void> deleteNoteById(int id) async {
    await DBServices.instance.deleteNote(id);
    await fetchSavedNotes();
    update();
  }

  // ----------------- Life Cycle ----------------- //
  @override
  void onInit() {
    fetchSavedNotes();
    super.onInit();
  }
}
