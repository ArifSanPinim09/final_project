import 'package:get/get.dart';

import '../controllers/admin_add_field_controller.dart';

class AdminAddFieldBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminAddFieldController>(
      () => AdminAddFieldController(),
    );
  }
}
