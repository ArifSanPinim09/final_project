import 'package:final_project/app/materials/appcolors.dart';
import 'package:final_project/app/modules/widget/button_widget.dart';
import 'package:final_project/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/konfirmasi_pembayaran_controller.dart';

class KonfirmasiPembayaranView extends GetView<KonfirmasiPembayaranController> {
  const KonfirmasiPembayaranView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.dark,
      appBar: AppBar(
        titleSpacing: 0,
        toolbarHeight: 80,
        title:Row(mainAxisSize: MainAxisSize.min,children: [
          SvgPicture.asset('assets/icons/pesanan.svg'),
          const SizedBox(width: 10,),
          Text("Konfirmasi Pembayaran",style: TextStyle(color: Appcolors.white,fontFamily: 'Mulish',fontSize: 18,fontWeight: FontWeight.bold),),
        ],),
        centerTitle: true,
        backgroundColor: Appcolors.dark,
        scrolledUnderElevation: 0,
        leading: IconButton(onPressed: (){navigator?.pop(context);}, icon: SvgPicture.asset('assets/icons/arrow_left3.svg',colorFilter: ColorFilter.mode(Appcolors.yellow, BlendMode.srcIn),)),
        
      ),
      bottomNavigationBar: Container(
        child: 
          Column(mainAxisSize: MainAxisSize.min, children: [
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Color(0xfff7e8b8),
              ),
              child: 
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                  Row(
                    children: [
                      SvgPicture.asset("assets/icons/clock.svg"),
                      SizedBox(width: 5,),
                      Text("Lakukan pembayaran dalam",style: TextStyle(fontFamily: 'mulish'),),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Appcolors.dark,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: Text("01",style: TextStyle(color: Appcolors.white,),
                      )),
                      SizedBox(width: 2,),
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Appcolors.dark,
                          borderRadius: BorderRadius.all(Radius.circular(5))
                        ),
                        child: Text("23",style: TextStyle(color: Appcolors.white,),
                      )),
                      SizedBox(width: 2,),
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Appcolors.dark,
                          borderRadius: BorderRadius.all(Radius.circular(5))
                        ),
                        child: Text("01",style: TextStyle(color: Appcolors.white,),
                      )),
                    ],
                  )
                ],),
            ),
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
                Column(
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                      Text("Harga total",style: TextStyle(fontFamily: 'mulish',fontSize: 15),),
                      Text("Rp. "+"300.000",style: TextStyle(fontFamily: 'mulish',fontWeight: FontWeight.bold,fontSize: 20),),
                    ],),
                    SizedBox(height: 15),
                    Button(onPressed: (){
                      Get.toNamed(Routes.KONFIRMASI_PEMBAYARAN);
                    }, text: "Pembayaran"),
                  ],
                ),
                
            )
          ],),
      ),
      body: 
        Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft:Radius.circular(25),topRight: Radius.circular(25)),
            color: Appcolors.bgframe,
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                  color: Appcolors.yellow
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Appcolors.dark,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("CGV Sport Hall FX",style: TextStyle(color: Appcolors.white,fontSize: 20,fontFamily: 'mulish',fontWeight: FontWeight.bold),),
                        ],
                      )
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset("assets/icons/field.svg"),
                          SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Lapangan 2",style: TextStyle(color: Appcolors.dark,fontSize: 20,fontFamily: 'mulish',fontWeight: FontWeight.bold),),
                              Text("Sabtu, 3 Januari 2023 | 18.00",style: TextStyle(color: Appcolors.dark,fontSize: 14,fontFamily: 'mulish'),),
                            ],
                          )
                        ],
                      )
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                  color: Appcolors.white
                ),
                child:
                  Container(
                    padding: EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset("assets/images/logobca.png"),
                            SizedBox(width: 10,),
                            Text("Transfer BCA",style: TextStyle(color: Appcolors.dark,fontSize: 16,fontFamily: 'mulish',fontWeight: FontWeight.bold),),
                          ],
                        ),
                        ElevatedButton(onPressed: (){}, child: Text("Ubah",style: TextStyle(fontFamily: 'mulish',color: Appcolors.dark,fontWeight: FontWeight.bold),),style: ElevatedButton.styleFrom(
                        foregroundColor: Appcolors.dark,
                        backgroundColor: Appcolors.yellow,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        )),)
                      ],
                    )
                  ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: Appcolors.gray,width: 2)),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                  color: Appcolors.white
                ),
                child:
                  Container(
                    padding: EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            "0812345678910 a.n. SportCentre",
                            style: TextStyle(
                                color: Appcolors.dark,
                                fontSize: 14,
                                fontFamily: 'mulish',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        TextButton(onPressed: (){}, child: Text("Lihat QR Code",style: TextStyle(fontFamily: 'mulish',color: Colors.blue,fontWeight: FontWeight.bold),)
                        )
                      ],
                    )
                  ),
              )
            ],
          )
      ),
    );
  }
}
