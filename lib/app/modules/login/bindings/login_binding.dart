import 'package:final_project/app/data/services/auth_service.dart';

import 'package:final_project/app/modules/login/controllers/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthService(), permanent: true);
    Get.put(LoginController());
  }
}
