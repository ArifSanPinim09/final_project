import 'package:get/get.dart';

import '../controllers/pembayaran_sukses_controller.dart';

class PembayaranSuksesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PembayaranSuksesController>(
      () => PembayaranSuksesController(),
    );
  }
}
