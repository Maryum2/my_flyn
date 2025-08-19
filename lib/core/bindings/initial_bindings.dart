import 'package:get/get.dart';
import 'package:my_flyn/controllers/profile/profile_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    // Because profile controller is used in multiple views, we can make it permanent
    Get.put(ProfileController(), permanent: true);
  }
}
