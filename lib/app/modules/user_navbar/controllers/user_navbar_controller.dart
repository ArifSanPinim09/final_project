import 'package:final_project/app/modules/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserNavbarController extends GetxController {
  var tabIndex = 0.obs;

  static const List<Widget> pages = [
    HomeView(),
    Center(
      child: Text(
        'Lapangan',
        style: TextStyle(fontSize: 24),
      ),
    ),
    Center(
      child: Text(
        'Pemesanan',
        style: TextStyle(fontSize: 24),
      ),
    ),
    Center(
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
