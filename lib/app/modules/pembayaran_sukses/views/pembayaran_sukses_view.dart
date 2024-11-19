import 'package:final_project/app/materials/appcolors.dart';
import 'package:final_project/app/modules/widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/pembayaran_sukses_controller.dart';

class PembayaranSuksesView extends GetView<PembayaranSuksesController> {
  const PembayaranSuksesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.dark,
      appBar: AppBar(
        titleSpacing: 0,
        toolbarHeight: 80,
        title:Row(mainAxisSize: MainAxisSize.min,children: [
          SvgPicture.asset('assets/icons/centang.svg'),
          const SizedBox(width: 10,),
          Text("Pembayaran Berhasil",style: TextStyle(color: Appcolors.white,fontFamily: 'Mulish',fontSize: 18,fontWeight: FontWeight.bold),),
        ],),
        centerTitle: true,
        backgroundColor: Appcolors.dark,
        scrolledUnderElevation: 0,
        leading: IconButton(onPressed: (){navigator?.pop(context);}, icon: SvgPicture.asset('assets/icons/arrow_left3.svg',colorFilter: ColorFilter.mode(Appcolors.yellow, BlendMode.srcIn),)),
        
      ),
      bottomNavigationBar: Container(
        child: 
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Appcolors.white,
                boxShadow: [
                  BoxShadow
                  (color: Color.fromARGB(30, 0, 0, 0),
                  offset: Offset(0, 3,),
                  spreadRadius: 10,
                  blurRadius: 20)
                ]
              ),
              child:
                    Button(onPressed: (){
                    }, text: "Lihat E-Tiket "),
                
            )
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft:Radius.circular(25),topRight: Radius.circular(25)),
            color: Appcolors.bgframe,
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 40),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Appcolors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 30),
                        Center(
                          child: Text(
                            "Penyewaan Lapangan Berhasil",
                            style: TextStyle(
                              color: Appcolors.dark,
                              fontFamily: 'mulish',
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Tanggal",
                              style: TextStyle(
                                color: Appcolors.dark,
                                fontFamily: 'mulish',
                              ),
                            ),
                            Text(
                              "Sabtu, 3 Januari 2023",
                              style: TextStyle(
                                color: Appcolors.dark,
                                fontFamily: 'mulish',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Waktu",
                              style: TextStyle(
                                color: Appcolors.dark,
                                fontFamily: 'mulish',
                              ),
                            ),
                            Text(
                              "18:00",
                              style: TextStyle(
                                color: Appcolors.dark,
                                fontFamily: 'mulish',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Nomor Lapangan",
                              style: TextStyle(
                                color: Appcolors.dark,
                                fontFamily: 'mulish',
                              ),
                            ),
                            Text(
                              "2",
                              style: TextStyle(
                                color: Appcolors.dark,
                                fontFamily: 'mulish',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Appcolors.yellow,
                    child: CircleAvatar(
                      radius: 20,
                      child: Icon(Icons.check, size: 30, color: Appcolors.yellow),
                      backgroundColor: Appcolors.white,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Appcolors.white,
                    border: Border(
                        top: BorderSide(
                  color: Appcolors.gray,
                  width: 2,
                ))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Metode Pembayaran",
                      style: TextStyle(
                        color: Appcolors.dark,
                        fontFamily: 'mulish',
                      ),
                    ),
                    Text(
                      "Transfer BCA",
                      style: TextStyle(
                          color: Appcolors.dark,
                          fontFamily: 'mulish',
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color(0xfffee180),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Biaya",
                      style: TextStyle(
                          color: Appcolors.dark,
                          fontFamily: 'mulish',
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Text(
                      "300.000",
                      style: TextStyle(
                          color: Appcolors.dark,
                          fontFamily: 'mulish',
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ],
                ),
              ),
            ],
          )
      ),
    );
  }
}
