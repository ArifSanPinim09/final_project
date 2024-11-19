import 'package:get/get.dart';

import '../controllers/lapangan_controller.dart';

class LapanganBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LapanganController>(
      () => LapanganController(),
    );
  }
}
