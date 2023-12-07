import 'package:get/get.dart';
import 'package:note_wise_ai/app/data/models/add_note_model.dart';
import 'package:note_wise_ai/app/data/services/db_services.dart';

class HomeController extends GetxController
    with StateMixin<List<AddNoteModel>> {
  // ----------------- Instance ----------------- //

  // ----------------- Rx Variables ----------------- //

  // ----------------- Getters ----------------- //

  // ----------------- Method ----------------- //

  void fetchSavedNotes() async {
    change(null, status: RxStatus.loading());
    await DBServices.instance.getNotes().then((value) {
      if (value.isEmpty) {
        change(null, status: RxStatus.empty());
        update();
      } else {
        change(value, status: RxStatus.success());
        update();
      }
    }, onError: (error) {
      change(null, status: RxStatus.error(error.toString()));
      update();
    });
  }

  // ----------------- Life Cycle ----------------- //
  @override
  void onInit() {
    fetchSavedNotes();
    super.onInit();
  }
}
