import 'package:final_project/app/materials/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../controllers/pemesanan_controller.dart';

class PemesananView extends GetView<PemesananController> {
  const PemesananView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Pemesanan"),
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: TabBar(
            labelColor: const Color(0xff211A2C),
            unselectedLabelColor: Colors.grey,
            indicatorColor: Appcolors.yellow,
            labelStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              fontFamily: 'Mulish',
            ),
            tabs: const [
              Tab(text: 'Pemesanan Berlangsung'),
              Tab(text: 'Riwayat Pemesanan'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildActiveBookingsTab(),
            _buildBookingHistoryTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildActiveBookingsTab() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'Penyewaan Lapangan Anda',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _buildBookingCard(),
        ],
      ),
    );
  }

  Widget _buildBookingHistoryTab() {
    return const Center(
      child: Text('Riwayat Pemesanan'),
    );
  }

  Widget _buildBookingCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xff211A2C),
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            ),
            child: const Text(
              'CGV Sport Hall FX',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.amber.shade300,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: SvgPicture.asset(
                    'assets/icons/ic_field.svg',
                    width: 32,
                    height: 32,
                  ),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lapangan A',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Rabu, 20 November 2024',
                        style: TextStyle(fontSize: 13),
                      ),
                      Text(
                        'Pukul 12:00',
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                // TextButton(
                //   onPressed: () {},
                //   style: TextButton.styleFrom(
                //     backgroundColor: const Color(0xff211A2C),
                //     padding: const EdgeInsets.symmetric(
                //       horizontal: 12,
                //       vertical: 8,
                //     ),
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(8),
                //     ),
                //   ),
                //   child: const Text(
                //     'Chat',
                //     style: TextStyle(
                //       color: Colors.white,
                //       fontSize: 12,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'Lihat E-Tiket',
              style: TextStyle(
                fontSize: 14,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
