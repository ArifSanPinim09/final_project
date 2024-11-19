import 'package:get/get.dart';

import '../controllers/search_field_controller.dart';

class SearchFieldBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchFieldController>(
      () => SearchFieldController(),
    );
  }
}
