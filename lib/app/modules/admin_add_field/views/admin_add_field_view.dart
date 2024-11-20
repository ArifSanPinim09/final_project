import 'package:final_project/app/materials/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../controllers/admin_add_field_controller.dart';

class AdminAddFieldView extends GetView<AdminAddFieldController> {
  const AdminAddFieldView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: _buildAppBar(context),
      body: SafeArea(
        child: Obx(() => Column(
              children: [
                _buildStepper(),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: _buildCurrentStep(),
                  ),
                ),
                _buildNavigationButtons(),
              ],
            )),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: SvgPicture.asset('assets/icons/arrow_left3.svg'),
      ),
      title: const Text(
        "Mendaftarkan Lapangan",
        style: TextStyle(
          color: Color(0xff211A2C),
          fontWeight: FontWeight.w700,
          fontSize: 20,
          fontFamily: 'Mulish',
        ),
      ),
    );
  }

  Widget _buildStepper() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          4,
          (index) => _buildStepIndicator(index),
        ),
      ),
    );
  }

  Widget _buildStepIndicator(int index) {
    final isActive = index == controller.currentStep.value;
    final isCompleted = index < controller.currentStep.value;

    return Row(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActive
                ? Appcolors.yellow
                : isCompleted
                    ? Colors.green
                    : Colors.grey.shade300,
          ),
          child: Center(
            child: isCompleted
                ? const Icon(Icons.check, color: Colors.white, size: 16)
                : Text(
                    '${index + 1}',
                    style: TextStyle(
                      color: isActive ? Appcolors.dark2 : Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        ),
        if (index < 3)
          Container(
            width: 40,
            height: 2,
            color: isCompleted ? Colors.green : Colors.grey.shade300,
          ),
      ],
    );
  }

  Widget _buildCurrentStep() {
    switch (controller.currentStep.value) {
      case 0:
        return _buildBasicInfoStep();
      case 1:
        return _buildPricingStep();
      case 2:
        return _buildImagesStep();
      case 3:
        return _buildFacilitiesStep();
      default:
        return const SizedBox();
    }
  }

  Widget _buildBasicInfoStep() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Informasi Dasar",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          _buildTextField(
            controller: controller.namecontroller,
            hintText: "Nama Lapangan",
            prefixIcon: Icons.sports_soccer,
          ),
          const SizedBox(height: 16),
          _buildTextField(
            controller: controller.locationcontroller,
            hintText: "Lokasi",
            prefixIcon: Icons.location_on,
          ),
        ],
      ),
    );
  }

  Widget _buildPricingStep() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Harga dan Diskon",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          const Text("Harga lapangan per jam"),
          const SizedBox(height: 12),
          controller.priceselectbutton,
          const SizedBox(height: 24),
          const Text("Diskon"),
          const SizedBox(height: 12),
          controller.discountselectbutton,
        ],
      ),
    );
  }

  Widget _buildImagesStep() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Foto Lapangan",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          _buildImageGrid(),
        ],
      ),
    );
  }

  Widget _buildImageGrid() {
    return Obx(() => GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount:
              (controller.imagelist.where((img) => img != null).length) + 1,
          itemBuilder: (context, index) {
            if (index ==
                controller.imagelist.where((img) => img != null).length) {
              return _buildAddImageButton();
            }
            return _buildImageCard(
                controller.imagelist
                    .where((img) => img != null)
                    .toList()[index],
                index);
          },
        ));
  }

  Widget _buildAddImageButton() {
    return InkWell(
      onTap: controller.pickimagefromgallery,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Appcolors.yellow,
            width: 2,
            style: BorderStyle.solid,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add_photo_alternate,
              size: 40,
              color: Appcolors.yellow,
            ),
            const SizedBox(height: 8),
            Text(
              "Tambah Foto",
              style: TextStyle(
                color: Appcolors.dark2,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFacilitiesStep() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Fasilitas",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          _buildFacilitiesList(),
          const SizedBox(height: 16),
          _buildSelectedFacilities(),
        ],
      ),
    );
  }

  Widget _buildFacilitiesList() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ExpansionTile(
        title: const Text("Pilih Fasilitas"),
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _buildFacilityChips(),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildFacilityChips() {
    final facilities = [
      {'icon': Icons.shower, 'name': 'Kamar Mandi'},
      {'icon': Icons.local_parking, 'name': 'Parkir'},
      {'icon': Icons.water_drop, 'name': 'Air Minum'},
      {'icon': Icons.chair, 'name': 'Bangku Pemain'},
      {'icon': Icons.shopping_bag, 'name': 'Kantin'},
      {'icon': Icons.wifi, 'name': 'Wifi'},
      {'icon': Icons.medical_services_outlined, 'name': 'P3K'},
      {'icon': Icons.sports, 'name': 'Peralatan Olahraga'},
      {'icon': Icons.private_connectivity, 'name': 'CCTV'},
      {'icon': Icons.mosque, 'name': 'Mushola'},
      {'icon': Icons.wc, 'name': 'Toilet'},
      {'icon': Icons.local_drink, 'name': 'Vending Machine'},
      {'icon': Icons.storefront, 'name': 'Mini Market'},
      {'icon': Icons.local_laundry_service, 'name': 'Ruang Ganti'},
      {'icon': Icons.lock, 'name': 'Loker'},
      {'icon': Icons.lightbulb, 'name': 'Lampu'},
      {'icon': Icons.storefront_outlined, 'name': 'Toko Olahraga'},
      {'icon': Icons.person, 'name': 'Petugas Jaga'},
      {'icon': Icons.local_hospital, 'name': 'Klinik'},
      {'icon': Icons.meeting_room, 'name': 'Ruang Tunggu'}
    ];

    return facilities.map((facility) {
      final isSelected =
          controller.selectedFacilities.contains(facility['name']);
      return FilterChip(
        avatar: Icon(
          facility['icon'] as IconData,
          size: 18,
          color: isSelected ? Colors.white : Appcolors.dark2,
        ),
        label: Text(
          facility['name'] as String,
          style: TextStyle(
            color: isSelected ? Colors.white : Appcolors.dark2,
          ),
        ),
        selected: isSelected,
        selectedColor: Appcolors.yellow,
        onSelected: (bool selected) {
          controller.toggleFacility(facility['name'] as String);
        },
      );
    }).toList();
  }

  Widget _buildSelectedFacilities() {
    return Obx(() => Wrap(
          spacing: 8,
          runSpacing: 8,
          children: controller.selectedFacilities.map((facility) {
            return Chip(
              avatar: Icon(
                _getFacilityIcon(facility),
                size: 18,
                color: Appcolors.dark2,
              ),
              label: Text(facility),
              onDeleted: () => controller.toggleFacility(facility),
            );
          }).toList(),
        ));
  }

  IconData _getFacilityIcon(String facilityName) {
    final iconMap = {
      'Kamar Mandi': Icons.shower,
      'Parkir': Icons.local_parking,
      'Air Minum': Icons.water_drop,
      'Bangku Pemain': Icons.chair,
      'Kantin': Icons.shopping_bag,
      'Wifi': Icons.wifi,
      'P3K': Icons.medical_services_outlined,
      'Peralatan Olahraga': Icons.sports,
      'CCTV': Icons.private_connectivity,
      'Mushola': Icons.mosque,
      'Toilet': Icons.wc,
      'Vending Machine': Icons.local_drink,
      'Mini Market': Icons.storefront,
      'Ruang Ganti': Icons.local_laundry_service,
      'Loker': Icons.lock,
      'Lampu': Icons.lightbulb,
      'Toko Olahraga': Icons.storefront_outlined,
      'Petugas Jaga': Icons.person,
      'Klinik': Icons.local_hospital,
      'Ruang Tunggu': Icons.meeting_room
    };
    return iconMap[facilityName] ?? Icons.star;
  }

  Widget _buildImageCard(dynamic image, int index) {
    if (image == null) return const SizedBox();

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: FileImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: GestureDetector(
            onTap: () => controller.removeImage(index),
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.close,
                color: Colors.white,
                size: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData prefixIcon,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Icon(prefixIcon, color: Appcolors.dark2),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationButtons() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (controller.currentStep.value > 0)
            ElevatedButton(
              onPressed: controller.previousStep,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.shade200,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text("Kembali"),
            )
          else
            const SizedBox(),
          ElevatedButton(
            onPressed: controller.currentStep.value == 3
                ? () {
                    // Submit form logic here
                    print(controller.facility);
                  }
                : controller.nextStep,
            style: ElevatedButton.styleFrom(
              backgroundColor: Appcolors.yellow,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              controller.currentStep.value == 3 ? "Daftar" : "Lanjut",
              style: TextStyle(
                color: Appcolors.dark2,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
