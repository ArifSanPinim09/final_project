import 'package:get/get.dart';

import '../controllers/admin_income_controller.dart';

class AdminIncomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminIncomeController>(
      () => AdminIncomeController(),
    );
  }
}
