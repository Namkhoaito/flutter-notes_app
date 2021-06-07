import 'package:get/get.dart';
import 'package:note_app/app/modules/creatnotes/creatnotes_controller.dart';

class CreatNotesBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => CreatNotesController());
  }
}
