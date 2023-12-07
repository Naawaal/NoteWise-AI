import 'package:get/get.dart';
import 'package:note_wise_ai/app/data/models/add_note_model.dart';
import 'package:note_wise_ai/app/data/services/db_services.dart';

class HomeController extends GetxController
    with StateMixin<List<AddNoteModel>> {
  // ----------------- Instance ----------------- //

  // ----------------- Rx Variables ----------------- //

  // ----------------- Getters ----------------- //

  // ----------------- Method ----------------- //

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
