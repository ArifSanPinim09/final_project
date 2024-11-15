import 'package:get/get.dart';

import '../controllers/admin_field_controller.dart';

class AdminFieldBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminFieldController>(
      () => AdminFieldController(),
    );
  }
}
