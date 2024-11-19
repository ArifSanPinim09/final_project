import 'package:final_project/app/modules/admin_home/views/admin_home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../controllers/admin_income_controller.dart';

class AdminIncomeView extends GetView<AdminIncomeController> {
  const AdminIncomeView({super.key});
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 42.0),
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
                const Text(
                  'Halo, Alfan',
                  style: TextStyle(
                    color: Color(0xff28293F),
                    fontSize: 16,
                    fontFamily: 'Mulish',
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {

                  },
                  child: SvgPicture.asset(
                    'assets/icons/ic_notif.svg',
                    colorFilter: const ColorFilter.mode(
                      Color(0xff28293F),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 18.0,
            ),
            const Text(
              'Pendapatan anda',
              style: TextStyle(
                color: Color(0xff28293F),
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Mulish',
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ringkasan Pendapatan',
                  style: TextStyle(
                    color: Color(0xff211A2C),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Mulish',
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Row(
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
            const SizedBox(
              height: 30.0,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ringkasan Pendapatan',
                  style: TextStyle(
                    color: Color(0xff211A2C),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Mulish',
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Center(
                  child: Text(
                    'Tidak ada data sebelumnya',
                    style: TextStyle(
                      color: Color(0xff211A2C),
                      fontSize: 12,
                      fontFamily: 'Mulish',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
