import 'package:get/get.dart';
import '../../../data/services/auth_service.dart';

class LoginController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();
  RxBool isLoading = false.obs;

  Future<void> loginWithGoogle() async {
    isLoading.value = true;
    try {
      await _authService.signInWithGoogle();
    } finally {
      isLoading.value = false;
    }
  }
}
