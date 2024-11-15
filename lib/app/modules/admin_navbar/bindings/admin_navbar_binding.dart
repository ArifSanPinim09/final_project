import 'package:get/get.dart';

import '../controllers/admin_navbar_controller.dart';

class AdminNavbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminNavbarController>(
      () => AdminNavbarController(),
    );
  }
}
