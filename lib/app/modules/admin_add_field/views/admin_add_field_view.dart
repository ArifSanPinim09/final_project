import 'package:final_project/app/materials/appcolors.dart';
import 'package:final_project/app/modules/widget/button_widget.dart';
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
      appBar: AppBar(
        backgroundColor: const Color(0xffF5F5F5),
        scrolledUnderElevation: 0,
        leading: IconButton(
            onPressed: () {
              navigator?.pop(context);
            },
            icon: SvgPicture.asset('assets/icons/arrow_left3.svg')),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Mendaftarkan Lapangan",
                style: TextStyle(
                  color: Color(0xff211A2C),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: 'Mulish',
                ),
              ),
              const SizedBox(height: 20.0),
              TextField(
                controller: controller.namecontroller,
                decoration: InputDecoration(
                  hintText: "Nama Lapangan",
                  filled: true,
                  fillColor: const Color(0xffDFDFDF),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide:
                          const BorderSide(width: 0, style: BorderStyle.none)),
                ),
                style: const TextStyle(
                  color: Color(0xff211A2C),
                  fontFamily: 'Mulish',
                ),
              ),
              const SizedBox(height: 20.0),
              TextField(
                controller: controller.locationcontroller,
                decoration: InputDecoration(
                  hintText: "Lokasi",
                  filled: true,
                  fillColor: const Color(0xffDFDFDF),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide:
                          const BorderSide(width: 0, style: BorderStyle.none)),
                ),
                style: const TextStyle(
                  color: Color(0xff211A2C),
                  fontFamily: 'Mulish',
                ),
              ),
              const SizedBox(height: 20.0),
              const Text(
                "Harga lapangan per jam",
                style: TextStyle(
                  color: Color(0xff211A2C),
                  fontSize: 15,
                  fontFamily: 'Mulish',
                ),
              ),
              const SizedBox(height: 10.0),
              controller.priceselectbutton,
              const SizedBox(height: 20.0),
              const Text(
                "Diskon",
                style: TextStyle(
                  color: Color(0xff211A2C),
                  fontSize: 15,
                  fontFamily: 'Mulish',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: controller.discountselectbutton,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  "Foto Lapangan (minimal 3)",
                  style: TextStyle(
                    color: Color(0xff211A2C),
                    fontSize: 15,
                    fontFamily: 'Mulish',
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  backgroundColor: Appcolors.yellow,
                ),
                onPressed: () {
                  controller.pickimagefromgallery();
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Upload",
                      style: TextStyle(
                          fontSize: 15,
                          color: Appcolors.dark2,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    SvgPicture.asset(
                      'assets/icons/material_symbols_upload.svg',
                      height: 15,
                      width: 15,
                      colorFilter: const ColorFilter.mode(
                        Color(0xff28293F),
                        BlendMode.srcIn,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Obx(() {
                if (controller.imageview.isenoughimage()) {
                  return const Text("Gambar sudah ada 3 atau lebih");
                } else {
                  return const Text("Gambar belum cukup");
                }
              }),
              Obx(() {
                return controller.imagelist[0] == null
                    ? Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Appcolors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                        ),
                        padding: const EdgeInsets.all(20),
                        child: SvgPicture.asset(
                          'assets/icons/ic_baseline_image.svg',
                          colorFilter: const ColorFilter.mode(
                            Color(0xff28293F),
                            BlendMode.srcIn,
                          ),
                        ),
                      )
                    : controller.imageview;
              }),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Jenis Lapangan",
                style: TextStyle(
                  color: Color(0xff211A2C),
                  fontSize: 15,
                  fontFamily: 'Mulish',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Obx(() {
                return Container(
                  padding: const EdgeInsets.only(left: 10, right: 20),
                  decoration: BoxDecoration(
                    color: Appcolors.gray,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: DropdownButton<String>(
                    dropdownColor: Appcolors.gray,
                    focusColor: Appcolors.yellow,
                    value: controller.category.value,
                    items: <String>[
                      "Basket",
                      "Baseball",
                      "Bulutangkis",
                      "Cricket",
                      "Futsal",
                      "Golf",
                      "Hoki",
                      "Sepak Bola",
                      "Sepak Takraw",
                      "Softball",
                      "Tenis",
                      "Tenis Meja",
                      "Voli"
                    ].map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(color: Color(0xff211A2C)),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      controller.category.value = value!;
                    },
                  ),
                );
              }),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Fasilitas",
                style: TextStyle(
                  color: Color(0xff211A2C),
                  fontSize: 15,
                  fontFamily: 'Mulish',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Ukuran Lapangan",
                style: TextStyle(
                  color: Color(0xff211A2C),
                  fontSize: 15,
                  fontFamily: 'Mulish',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Panjang (Meter)",
                        filled: true,
                        fillColor: const Color(0xffDFDFDF),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                                width: 0, style: BorderStyle.none)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Lebar (Meter)",
                        filled: true,
                        fillColor: const Color(0xffDFDFDF),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                                width: 0, style: BorderStyle.none)),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Kapasitas",
                  filled: true,
                  fillColor: const Color(0xffDFDFDF),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide:
                          const BorderSide(width: 0, style: BorderStyle.none)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              controller.facilitytogglebutton,
              const SizedBox(height: 20.0),
              Button(
                  onPressed: () {
                    print(controller.facility);
                  },
                  text: "Daftar")
            ],
          ),
        ),
      ),
    );
  }
}
