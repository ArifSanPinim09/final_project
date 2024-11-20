import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/complete_profile_controller.dart';

class CompleteProfileView extends GetView<CompleteProfileController> {
  const CompleteProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Lengkapi Profil',
          style: TextStyle(color: Color(0xFF1C1326)),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Silakan lengkapi data diri Anda',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 24),
            _buildTextField(
              controller: controller.nameController,
              label: 'Nama Lengkap',
              icon: Icons.person_outline,
            ),
            const SizedBox(height: 16),
            _buildDateField(context),
            const SizedBox(height: 16),
            _buildTextField(
              controller: controller.addressController,
              label: 'Alamat',
              icon: Icons.location_history_outlined,
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            _buildTextField(
              controller: controller.phoneController,
              label: 'Nomor WhatsApp',
              icon: Icons.phone_outlined,
              keyboardType: TextInputType.phone,
              prefix: '+62 ',
            ),
            const SizedBox(height: 32),
            Obx(() => SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1C1326),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: controller.isLoading.value
                        ? null
                        : controller.submitProfile,
                    child: controller.isLoading.value
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : const Text(
                            'Simpan',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    int maxLines = 1,
    TextInputType? keyboardType,
    String? prefix,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        floatingLabelStyle: const TextStyle(
          color: Color(0xFF1C1326),
          fontWeight: FontWeight.w500,
        ),
        helperStyle: const TextStyle(
          color: Colors.black,
        ),
        labelText: label,
        prefixText: prefix,
        prefixIcon: Icon(icon),
        border: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF1C1326),
            width: 2,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
    );
  }

  Widget _buildDateField(BuildContext context) {
    return TextField(
      controller: controller.birthDateController,
      readOnly: true,
      decoration: const InputDecoration(
        floatingLabelStyle: TextStyle(
          color: Color(0xFF1C1326),
          fontWeight: FontWeight.w500,
        ),
        labelText: 'Tanggal Lahir',
        prefixIcon: Icon(Icons.calendar_today_outlined),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF1C1326),
            width: 2,
          ),
        ),
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
      onTap: () async {
        final date = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );
        if (date != null) {
          controller.birthDateController.text =
              DateFormat('dd/MM/yyyy').format(date);
        }
      },
    );
  }
}
