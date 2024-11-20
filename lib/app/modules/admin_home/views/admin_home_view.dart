// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:final_project/app/modules/widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controllers/admin_home_controller.dart';

class AdminHomeView extends GetView<AdminHomeController> {
  const AdminHomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Color(0xff211A2C),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(25),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 22.0),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/profile.png',
                          height: 36,
                          width: 36,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        'Halo, Alfan',
                        style: TextStyle(
                          fontFamily: 'Mulish',
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {},
                        child: SvgPicture.asset(
                          'assets/icons/ic_notif.svg',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  const Text(
                    'Tambahkan lapangan dan dapatkan penghasilan',
                    style: TextStyle(
                      fontFamily: 'Mulish',
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 22.0),
                  Button(
                    onPressed: () {
                      Get.toNamed('admin-add-field');
                    },
                    text: "Tambahkan Lapangan",
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Riwayat Penyewaan',
                        style: TextStyle(
                            color: Color(0xff211A2C),
                            fontFamily: 'Mulish',
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            const Text(
                              'Lihat Semua',
                              style: TextStyle(
                                color: Color(0xff211A2C),
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            SvgPicture.asset(
                              'assets/icons/ic_arrow_right.svg',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff211A2C),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            'CGV Sport Hall FX',
                            style: TextStyle(
                                color: Color(0xffF5F5F5),
                                fontFamily: 'Mulish',
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: const BoxDecoration(
                            color: Color(0xffFDC300),
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(10),
                            ),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/field.svg',
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Lapangan 2',
                                    style: TextStyle(
                                        color: Color(0xff211A2C),
                                        fontFamily: 'Mulish',
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Sabtu, 3 Januari 2023 | 18.00',
                                    style: TextStyle(
                                      color: Color(0xff211A2C),
                                      fontFamily: 'Mulish',
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ringkasan Pendapatan',
                    style: TextStyle(
                        color: const Color(0xff211A2C),
                        fontFamily: 'Mulish',
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  const Row(
                    children: [
                      IncomeCard(
                        title: 'Pendapatan bulan ini',
                        desc: '7.200.000',
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: IncomeCard(
                          title: 'Transaksi Berhasil',
                          desc: '24',
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IncomeCard extends StatelessWidget {
  final String title;
  final String desc;
  const IncomeCard({
    super.key,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 4),
            blurRadius: 6,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: const Color(0xff211A2C),
              fontFamily: 'Mulish',
              fontSize: 12,
            ),
          ),
          Text(
            desc,
            style: TextStyle(
              color: const Color(0xff211A2C),
              fontFamily: 'Mulish',
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
