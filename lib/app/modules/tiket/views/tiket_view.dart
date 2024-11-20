import 'package:final_project/app/materials/appcolors.dart';
import 'package:final_project/app/modules/widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/tiket_controller.dart';

class TiketView extends GetView<TiketController> {
  const TiketView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Appcolors.dark,
        appBar: AppBar(
          titleSpacing: 0,
          toolbarHeight: 80,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset('assets/icons/tiket.svg'),
              const SizedBox(
                width: 10,
              ),
              Text(
                "ETiket Anda",
                style: TextStyle(
                    color: Appcolors.white,
                    fontFamily: 'Mulish',
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          centerTitle: true,
          backgroundColor: Appcolors.dark,
          scrolledUnderElevation: 0,
          leading: IconButton(
              onPressed: () {
                navigator?.pop(context);
              },
              icon: SvgPicture.asset(
                'assets/icons/arrow_left3.svg',
                colorFilter:
                    ColorFilter.mode(Appcolors.yellow, BlendMode.srcIn),
              )),
        ),
        bottomNavigationBar: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Appcolors.bgframe,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {
                          navigator?.pop(context);
                        },
                        style: OutlinedButton.styleFrom(
                            foregroundColor: Appcolors.dark,
                            shadowColor: Colors.transparent,
                            side: const BorderSide(width: 2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            )),
                        child: const Text("Kembali"),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Button(onPressed: () {}, text: "Unduh E-Tiket"),
                  ],
                ),
              )
            ],
          ),
        ),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25)),
              color: Appcolors.bgframe,
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    color: Appcolors.yellow),
                child: Column(
                  children: [
                    Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Appcolors.dark,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "CGV Sport Hall FX",
                              style: TextStyle(
                                  color: Appcolors.white,
                                  fontSize: 20,
                                  fontFamily: 'mulish',
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )),
                    Container(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset("assets/icons/field.svg"),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Lapangan 2",
                                  style: TextStyle(
                                      color: Appcolors.dark,
                                      fontSize: 20,
                                      fontFamily: 'mulish',
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Sabtu, 3 Januari 2023 | 18.00",
                                  style: TextStyle(
                                      color: Appcolors.dark,
                                      fontSize: 14,
                                      fontFamily: 'mulish'),
                                ),
                              ],
                            )
                          ],
                        )),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Appcolors.white,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Booking Code",
                      style: TextStyle(
                          color: Appcolors.dark, fontFamily: 'mulish'),
                    ),
                    Text(
                      "3123182",
                      style: TextStyle(
                          color: Appcolors.dark,
                          fontFamily: 'mulish',
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Image.asset("assets/images/qrcode.png"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(
                        "Tunjukkan tiket ini ke pengelola lapangan",
                        style: TextStyle(
                            color: Appcolors.dark,
                            fontFamily: 'mulish',
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              )
            ])));
  }
}
