import 'dart:io';

import 'package:appwrite/appwrite.dart';
import 'package:final_project/app/data/config/appwrite_config.dart';
import 'package:final_project/app/data/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CompleteProfileController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();
  final Storage storage = Storage(Get.find<Client>());

  final nameController = TextEditingController();
  final birthDateController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();

  final isLoading = false.obs;
  final imageFile = Rx<File?>(null);
  final imageId = Rx<String?>(null);

  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFile.value = File(pickedFile.path);
      await uploadImage();
    }
  }

  Future<void> uploadImage() async {
    try {
      if (imageFile.value != null) {
        final file = await storage.createFile(
          bucketId: AppwriteConfig.bucketId,
          fileId: ID.unique(),
          file: InputFile.fromPath(path: imageFile.value!.path),
        );
        imageId.value = file.$id;
      }
    } catch (e) {
      print(e.toString());
      Get.snackbar('Error', 'Failed to upload image');
    }
  }

  Future<void> submitProfile() async {
    if (!_validateInputs()) return;

    isLoading.value = true;
    try {
      await _authService.updateUserProfile(
        name: nameController.text,
        birthDate: birthDateController.text,
        address: addressController.text,
        phone: phoneController.text,
        imageId: imageId.value,
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
    if (phoneController.text.isEmpty) {
      Get.snackbar('Error', 'Nomor HP yang terhubung WA harus diisi');
      return false;
    }
    if (!_isValidWhatsAppNumber(phoneController.text)) {
      Get.snackbar('Error', 'Masukkan nomor HP yang valid dan terhubung WA');
      return false;
    }

    return true;
  }

  bool _isValidWhatsAppNumber(String phone) {
    // Validasi panjang dan awalan nomor HP Indonesia
    return phone.length >= 10 &&
        (phone.startsWith('08') || phone.startsWith('+62'));
  }
}
