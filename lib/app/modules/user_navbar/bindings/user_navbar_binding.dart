import 'package:get/get.dart';

import '../controllers/user_navbar_controller.dart';

class UserNavbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserNavbarController>(
      () => UserNavbarController(),
    );
  }
}
