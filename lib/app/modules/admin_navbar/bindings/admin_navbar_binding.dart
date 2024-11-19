import 'package:final_project/app/modules/admin_profile/controllers/admin_profile_controller.dart';
import 'package:get/get.dart';

import '../controllers/admin_navbar_controller.dart';

class AdminNavbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminNavbarController>(
      () => AdminNavbarController(),
    );
     Get.lazyPut<AdminProfileController>(
      () => AdminProfileController(),
    );
  }
}
