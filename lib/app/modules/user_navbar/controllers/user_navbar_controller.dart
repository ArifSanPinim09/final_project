import 'package:final_project/app/modules/home/views/home_view.dart';
import 'package:final_project/app/modules/lapangan/views/lapangan_view.dart';
import 'package:final_project/app/modules/pemesanan/views/pemesanan_view.dart';
import 'package:final_project/app/modules/user_profile/views/user_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserNavbarController extends GetxController {
  var tabIndex = 0.obs;

  static List<Widget> pages = [
    HomeView(),
    const LapanganView(),
    const PemesananView(),
    const UserProfileView(),
  ];

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }
}
