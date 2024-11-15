import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../controllers/admin_navbar_controller.dart';

class AdminNavbarView extends GetView<AdminNavbarController> {
  const AdminNavbarView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => AdminNavbarController.pages[controller.tabIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: [
             bottomNavbarItem(
              icon: 'assets/icons/ic_home.svg',
              label: 'Home',
            ),
            bottomNavbarItem(
              icon: 'assets/icons/ic_field.svg',
              label: 'Lapangan',
            ),
            bottomNavbarItem(
              icon: 'assets/icons/ic_income.svg',
              label: 'Pendapatan',
            ),
            bottomNavbarItem(
              icon: 'assets/icons/ic_profile.svg',
              label: 'Profil',
            ),
          ],
          currentIndex: controller.tabIndex.value,
          selectedItemColor: const Color(0xff211A2C),
          unselectedItemColor: const Color(0xff211A2C).withOpacity(0.5),
          onTap: controller.changeTabIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }

 BottomNavigationBarItem bottomNavbarItem({
    required String icon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        icon,
        colorFilter: ColorFilter.mode(
          const Color(0xff211A2C).withOpacity(0.5),
          BlendMode.srcIn,
        ),
      ),
      activeIcon: SvgPicture.asset(
        icon,
        colorFilter: const ColorFilter.mode(
          Color(0xff211A2C),
          BlendMode.srcIn,
        ),
      ),
      label: label,
    );
  }


}
