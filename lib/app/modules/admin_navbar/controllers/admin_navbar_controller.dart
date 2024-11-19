import 'package:final_project/app/modules/admin_field/views/admin_field_view.dart';
import 'package:final_project/app/modules/admin_home/views/admin_home_view.dart';
import 'package:final_project/app/modules/admin_income/views/admin_income_view.dart';
import 'package:final_project/app/modules/admin_profile/views/admin_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminNavbarController extends GetxController {
  var tabIndex = 0.obs;

  static const List<Widget> pages = [
    AdminHomeView(),
    AdminFieldView(),
    AdminIncomeView(),
    AdminProfileView(),
  ];

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }
}
