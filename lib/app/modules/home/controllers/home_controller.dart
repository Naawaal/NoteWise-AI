import 'package:get/get.dart';
import 'package:note_wise_ai/app/data/models/add_note_model.dart';
import 'package:note_wise_ai/app/data/services/db_services.dart';

class HomeController extends GetxController
    with StateMixin<List<AddNoteModel>> {
  // ----------------- Instance ----------------- //

  // ----------------- Rx Variables ----------------- //

  // ----------------- Getters ----------------- //

  // ----------------- Setters ----------------- //

  // ----------------- Method ----------------- //

  void fetchSavedNotes() async {
    await DBServices.instance.getNotes().then((value) {
      change(value, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error(error.toString()));
    });
  }

  // ----------------- Life Cycle ----------------- //
  @override
  void onInit() {
    fetchSavedNotes();
    super.onInit();
  }
}
