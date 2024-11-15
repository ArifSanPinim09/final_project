import 'package:final_project/app/modules/admin_home/views/admin_home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminNavbarController extends GetxController {
  var tabIndex = 0.obs;

  static const List<Widget> pages = [
    AdminHomeView(),
    Center(
      child: Text(
        'Lapangan',
        style: TextStyle(fontSize: 24),
      ),
    ),
    Center(
      child: Text(
        'Pendapatan',
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
