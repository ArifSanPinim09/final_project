import 'package:get/get.dart';
import 'package:final_project/app/data/services/auth_service.dart';

class HomeController extends GetxController {
  final AuthService auth = Get.find<AuthService>();

  Future<void> logout() async {
    await auth.signOut();
  }
}
