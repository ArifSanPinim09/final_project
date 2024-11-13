import 'package:final_project/app/data/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteProfileController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();

  final nameController = TextEditingController();
  final birthDateController = TextEditingController();
  final addressController = TextEditingController();

  final selectedRole = Rx<String?>(null);
  final isLoading = false.obs;

  void selectRole(String role) {
    selectedRole.value = role;
  }

  Future<void> submitProfile() async {
    if (!_validateInputs()) return;

    isLoading.value = true;
    try {
      await _authService.updateUserProfile(
        name: nameController.text,
        birthDate: birthDateController.text,
        address: addressController.text,
        role: selectedRole.value!,
      );
    } finally {
      isLoading.value = false;
    }
  }

  bool _validateInputs() {
    if (nameController.text.isEmpty) {
      Get.snackbar('Error', 'Nama harus diisi');
      return false;
    }
    if (birthDateController.text.isEmpty) {
      Get.snackbar('Error', 'Tanggal lahir harus diisi');
      return false;
    }
    if (addressController.text.isEmpty) {
      Get.snackbar('Error', 'Alamat harus diisi');
      return false;
    }
    if (selectedRole.value == null) {
      Get.snackbar('Error', 'Pilih role anda');
      return false;
    }
    return true;
  }
}
