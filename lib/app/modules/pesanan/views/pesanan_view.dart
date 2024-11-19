import 'package:final_project/app/materials/appcolors.dart';
import 'package:final_project/app/modules/widget/button_widget.dart';
import 'package:final_project/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/pesanan_controller.dart';

class PesananView extends GetView<PesananController> {
  const PesananView({super.key});
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
          Text("Pesanan Anda",style: TextStyle(color: Appcolors.white,fontFamily: 'Mulish',fontSize: 18,fontWeight: FontWeight.bold),),
        ],),
        centerTitle: true,
        backgroundColor: Appcolors.dark,
        scrolledUnderElevation: 0,
        leading: IconButton(onPressed: (){navigator?.pop(context);}, icon: SvgPicture.asset('assets/icons/arrow_left3.svg',colorFilter: ColorFilter.mode(Appcolors.yellow, BlendMode.srcIn),)),
        
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Appcolors.white,
          boxShadow: [
            BoxShadow
            (color: Appcolors.gray,
            offset: Offset(0, 10,),
            spreadRadius: 15,
            blurRadius: 20)
          ]
        ),
        child: 
          Column(mainAxisSize: MainAxisSize.min, children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
              Text("Harga total",style: TextStyle(fontFamily: 'mulish',fontSize: 15),),
              Text("Rp. "+"300.000",style: TextStyle(fontFamily: 'mulish',fontWeight: FontWeight.bold,fontSize: 20),),
            ],),
            SizedBox(height: 15,),
            Button(onPressed: (){
              Get.toNamed(Routes.KONFIRMASI_PEMBAYARAN);
            }, text: "Pembayaran")
          ],),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft:Radius.circular(25),topRight: Radius.circular(25)),
            color: Appcolors.bgframe,
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Data Pesanan",style: TextStyle(fontFamily: 'mulish',color: Color(0xff3F414E),fontSize: 20,fontWeight: FontWeight.bold),),
              SizedBox(height: 5,),
              Text("Ringkasan pesanan lapangan anda",style: TextStyle(fontFamily: 'mulish',color: Color(0xff3F414E)),),
              SizedBox(height: 5,),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Appcolors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Appcolors.gray,width: 1),
                ),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                    Text("Sabtu 3 Januari 2023",style: TextStyle(fontFamily: 'mulish',color: Appcolors.dark,fontSize: 16,fontWeight: FontWeight.bold),),
                    Text("Lapangan 2"),
                  ],),
                  ElevatedButton(onPressed: (){}, child: Text("Ubah",style: TextStyle(fontFamily: 'mulish',color: Appcolors.dark,fontWeight: FontWeight.bold),),style: ElevatedButton.styleFrom(
                    foregroundColor: Appcolors.dark,
                    backgroundColor: Appcolors.yellow,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    )),)
                ],),
              ),
              SizedBox(height: 20,),
              Text("Pemesan",style: TextStyle(fontFamily: 'mulish',color: Color(0xff3F414E),fontSize: 20,fontWeight: FontWeight.bold),),
              SizedBox(height: 5,),
              Text("Kami akan mengirimkan semua e-tiket/voucher dari pesanan ini kepada kontak yang diisi di profil kamu",style: TextStyle(fontFamily: 'mulish',color: Color(0xff3F414E)),),
              SizedBox(height: 5,),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Appcolors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Appcolors.gray,width: 1),
                ),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                    Text("Alfan",style: TextStyle(fontFamily: 'mulish',color: Appcolors.dark,fontSize: 16,fontWeight: FontWeight.bold),),
                    Text("+62812345678"),
                  ],),
                  ElevatedButton(onPressed: (){}, child: Text("Ubah",style: TextStyle(fontFamily: 'mulish',color: Appcolors.dark,fontWeight: FontWeight.bold),),style: ElevatedButton.styleFrom(
                    foregroundColor: Appcolors.dark,
                    backgroundColor: Appcolors.yellow,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    )),)
                ],),
              ),
              SizedBox(height: 20,),
              Text("Pembayaran",style: TextStyle(fontFamily: 'mulish',color: Color(0xff3F414E),fontSize: 20,fontWeight: FontWeight.bold),),
              SizedBox(height: 5,),
              Text("Lakukan pembayaran anda dengan mudah",style: TextStyle(fontFamily: 'mulish',color: Color(0xff3F414E)),),
              SizedBox(height: 5,),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Appcolors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Appcolors.gray,width: 1),
                ),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                    Text("Pilih metode pembayaran",style: TextStyle(fontFamily: 'mulish',color: Appcolors.dark,fontSize: 16,fontWeight: FontWeight.bold),),
                  ],),
                  ElevatedButton(onPressed: (){}, child: Text("Ubah",style: TextStyle(fontFamily: 'mulish',color: Appcolors.dark,fontWeight: FontWeight.bold),),style: ElevatedButton.styleFrom(
                    foregroundColor: Appcolors.dark,
                    backgroundColor: Appcolors.yellow,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    )),)
                ],),
              ),
            ],
          )
        ),
      )
    );
  }
}
