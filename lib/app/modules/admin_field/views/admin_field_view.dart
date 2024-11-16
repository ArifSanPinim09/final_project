import 'package:final_project/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:final_project/app/modules/widget/button_widget.dart';

import '../controllers/admin_field_controller.dart';

class AdminFieldView extends GetView<AdminFieldController> {
  const AdminFieldView({super.key});
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
                      fontFamily: 'Mulish'),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {},
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
              'Lapangan yang dikelola',
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
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
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
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/lapangan.png',
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'CGV Sport Hall FX',
                                style: TextStyle(
                                  color: Color(0xff211A2C),
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Mulish',
                                ),
                              ),
                              const Text(
                                'Jln. Jend. Sudirman No.25',
                                style: TextStyle(
                                  color: Color(0xff211A2C),
                                  fontSize: 10,
                                  fontFamily: 'Mulish',
                                ),
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/ic_star.svg',
                                  ),
                                  const SizedBox(width: 4.0),
                                  RichText(
                                    text: const TextSpan(
                                      children: [
                                        TextSpan(
                                          text: '4.2',
                                          style: TextStyle(
                                            color: Color(0xff211A2C),
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Mulish',
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' (40)',
                                          style: TextStyle(
                                            color: Color(0xff211A2C),
                                            fontSize: 10,
                                            fontFamily: 'Mulish',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  RichText(
                                    text: const TextSpan(
                                      children: [
                                        TextSpan(
                                          text: '300k',
                                          style: TextStyle(
                                            color: Color(0xff211A2C),
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Mulish',
                                          ),
                                        ),
                                        TextSpan(
                                          text: '/jam',
                                          style: TextStyle(
                                            color: Color(0xff211A2C),
                                            fontSize: 10,
                                            fontFamily: 'Mulish',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    height: 1,
                    color: Color(0xffDFDFDF),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Edit',
                        style: TextStyle(
                          color: Color(0xff0068E1),
                          fontSize: 12,
                          fontFamily: 'Mulish',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            ButtonIcon(
              onPressed: () {
                Get.toNamed(Routes.ADMIN_ADD_FIELD);
              },
              text: 'Tambahkan  Lapangan',
              icon: Icons.add_circle_rounded,
            ),
          ],
        ),
      ),
    );
  }
}
