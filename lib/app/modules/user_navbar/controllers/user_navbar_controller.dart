import 'package:final_project/app/modules/home/views/home_view.dart';
import 'package:final_project/app/modules/lapangan/views/lapangan_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserNavbarController extends GetxController {
  var tabIndex = 0.obs;

  static List<Widget> pages = [
    HomeView(),
    const LapanganView(),
    const Center(
      child: Text(
        'Pemesanan',
        style: TextStyle(fontSize: 24),
      ),
    ),
    const Center(
      child: Text(
        'Profil',
        style: TextStyle(fontSize: 24),
      ),
    ),
  ];

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }
}
