import 'package:final_project/app/data/services/auth_service.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthService(), permanent: true);
    Get.put<HomeController>(HomeController()); // Ubah lazyPut menjadi put
  }
}
