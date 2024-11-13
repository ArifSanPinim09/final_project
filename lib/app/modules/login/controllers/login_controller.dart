import 'package:final_project/app/data/services/auth_service.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();
  RxBool isLoading = false.obs;

  Future<void> signInWithGoogle() async {
    isLoading.value = true;
    try {
      await _authService.signInWithGoogle();
    } finally {
      isLoading.value = false;
    }
  }
}
