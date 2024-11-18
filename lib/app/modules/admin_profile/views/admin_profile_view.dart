// ignore_for_file: prefer_const_constructors

import 'package:final_project/app/modules/widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/admin_profile_controller.dart';

class AdminProfileView extends GetView<AdminProfileController> {
  const AdminProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff211A2C),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 42.0),
            Center(
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xffFDC300),
                    width: 5.0,
                  ),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 75,
                      backgroundImage: AssetImage('assets/images/profiles.png'),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: const Icon(
                            Icons.camera_alt,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 18.0,
            ),
            Text(
              'Alfan',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Mulish',
              ),
            ),
            Text(
              '08434283489',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: 'Mulish',
              ),
            ),
            const SizedBox(
              height: 18.0,
            ),
            ProfileMenu(
              icon: 'assets/icons/ic_person.svg',
              title: 'Ubah Profil',
              onTap: () {},
            ),
            ProfileMenu(
              icon: 'assets/icons/ic_unlock.svg',
              title: 'Ganti Password',
              onTap: () {},
            ),
            ProfileMenu(
              icon: 'assets/icons/ic_Calendar1.svg',
              title: 'Riwayat Pendapatan',
              onTap: () {},
            ),
            const SizedBox(
              height: 28.0,
            ),
            ProfileMenu(
              icon: 'assets/icons/ic_logout.svg',
              title: 'Keluar',
              showArrow: false,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  final String icon;
  final String title;
  final bool showArrow;
  final VoidCallback onTap;
  const ProfileMenu({
    super.key,
    required this.icon,
    required this.title,
    this.showArrow = true,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 10,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFF28293F),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            SvgPicture.asset(icon),
            const SizedBox(
              width: 8.0,
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: 'Mulish',
              ),
            ),
            const Spacer(),
            if (showArrow) SvgPicture.asset('assets/icons/ic_arrow.svg'),
          ],
        ),
      ),
    );
  }
}