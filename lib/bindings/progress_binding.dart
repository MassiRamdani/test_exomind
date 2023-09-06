import 'package:get/get.dart';
import 'package:test_exomind/controllers/progress_controller.dart';

// Cette classe `ProgressBinding` est responsable de la configuration des dépendances pour l'écran de progression.
// Elle utilise Get.lazyPut() pour enregistrer une instance de ProgressController pour une utilisation ultérieure.
class ProgressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProgressController());
  }
}
