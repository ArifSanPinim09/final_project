import 'package:final_project/app/data/services/auth_service.dart';
import 'package:get/get.dart';

class AdminHomeController extends GetxController {
  final AuthService auth = Get.find<AuthService>();

  Future<void> logout() async {
    await auth.signOut();
  }
}
