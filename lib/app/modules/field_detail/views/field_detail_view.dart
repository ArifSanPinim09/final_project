import 'package:final_project/app/materials/appcolors.dart';
import 'package:final_project/app/modules/widget/button_widget.dart';
import 'package:final_project/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/field_detail_controller.dart';

class FieldDetailView extends GetView<FieldDetailController> {
  const FieldDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      toolbarHeight: 200,
      flexibleSpace: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  "https://i.pinimg.com/736x/83/dc/63/83dc631767dab6612d223b8a5f817549.jpg",
                ),
              ),
            ),
          ),
          Positioned(
            top: 50,
            child: IconButton(
              onPressed: () {
                navigator?.pop(context);
              },
              icon: SvgPicture.asset(
                'assets/icons/arrow_left3.svg',
                colorFilter: ColorFilter.mode(Appcolors.white, BlendMode.srcIn),
              ),
            ),
          ),
          Positioned(
            right: 10,
            bottom: 0,
            height: 100,
            width: 230,
            child: ListView.builder(scrollDirection: Axis.horizontal,itemCount: 3, itemBuilder: (context,index){
              return Row(mainAxisSize: MainAxisSize.min,children: [
                Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Appcolors.white,width: 1),
                ),
                child:ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: index!=2? Image.network(
                    "https://i.pinimg.com/736x/83/dc/63/83dc631767dab6612d223b8a5f817549.jpg",
                    fit: BoxFit.cover,
                  )
                  :Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                    "https://i.pinimg.com/736x/83/dc/63/83dc631767dab6612d223b8a5f817549.jpg",
                    fit: BoxFit.cover,
                    ),Center(child: Text("+6",style: TextStyle(color: Appcolors.white,fontFamily: 'mulish',fontWeight: FontWeight.bold,fontSize: 20),),),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 10,),
              ],);
            })
          ),
        ],
      ),
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,),
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
              Text("Harga lapangan perjam",style: TextStyle(fontFamily: 'mulish',fontSize: 15),),
              Text("Rp. "+controller.listLapangan["harga"]!,style: TextStyle(fontFamily: 'mulish',fontWeight: FontWeight.bold,fontSize: 20),),
            ],),
            SizedBox(height: 15,),
            Button(onPressed: (){
              Get.toNamed("/pesanan");
            }, text: "Sewa Sekarang")
          ],),
      ),
      body: Container(
        color: Appcolors.dark,
        child:
          Column(children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Appcolors.white,
                  
                ),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(controller.listLapangan["name"]!,style: TextStyle(fontFamily: 'mulish',fontWeight: FontWeight.bold,fontSize: 20),),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Appcolors.yellow,
                          borderRadius: BorderRadius.all(Radius.circular(25))
                        ),
                        child: Text("${controller.listLapangan["jarak"]!} km",style: TextStyle(fontFamily: 'mulish',fontWeight: FontWeight.bold,fontSize: 15)),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment:MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 20,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        controller.listLapangan["bintang"]!,
                        style: const TextStyle(
                          fontSize: 14,
                          fontFamily: 'mulish',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 5),
                      SvgPicture.asset("assets/icons/Discount.svg",height: 20,width: 20,),
                      Text(
                        controller.listLapangan['diskon']!+"% Discount area",
                        style: TextStyle(
                          fontFamily: 'mulish',
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ]),
                    SizedBox(height: 10,),
                    Container(
                      padding: EdgeInsets.only(top: 15,bottom: 15),
                      decoration: BoxDecoration(
                        border: Border(top:BorderSide(color:Appcolors.gray,width: 2),bottom:BorderSide(color:Appcolors.gray,width: 2))
                      ),
                      child: Row(
                      children: [
                        Image.asset("assets/images/maps.png"),
                        SizedBox(width: 10),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.listLapangan['alamat']!,
                                style: TextStyle(
                                  fontFamily: 'mulish',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(bottom:BorderSide(color:Appcolors.gray,width: 2))
                      ),
                      child: controller.facilityreviewbutton,
                    ),
                    SizedBox(height: 10,),
                    Obx((){
                      if(controller.facilityreviewvalue=="Fasilitas"){
                        return Flexible(
                          child: (
                            Center(
                              child:
                                GridView.builder(
                                  itemCount: controller.countfacility(),
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: 40),
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context,index){
                                    return Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        index>=0 && index<=1 ||controller.facilitylist[index].value==true? 
                                        SvgPicture.asset(controller.facilitylogo[index])
                                        :Container(),
                                        SizedBox(width: 10,),
                                        Flexible(
                                          child: index>=0 && index<=1? Text(controller.facilitylist[index].key+" : "+controller.facilitylist[index].value.toString())
                                          : controller.facilitylist[index].value==true? 
                                          Text(controller.facilitylist[index].key.toString())
                                          :Container(),
                                        ),
                                      ],
                                    );
                                }
                              ),
                            )
                          ),
                        );
                      }
                      else{
                        return Flexible(
                          child: (
                            Center(
                              child:
                                GridView.builder(
                                  itemCount: 10,
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,mainAxisExtent: 100),
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context,index){
                                    final item = controller.listreview[index > 2 ? index - 1 : index];
                                    return ListTile(
                                      leading: CircleAvatar(
                                        backgroundImage: AssetImage(item['photo']),
                                      ),
                                      titleAlignment: ListTileTitleAlignment.top,
                                      title: Row(children: [
                                        Text(item["username"],style: TextStyle(fontFamily: 'mulish',fontWeight: FontWeight.bold),),
                                        SizedBox(width: 5,),
                                        SvgPicture.asset("assets/icons/yellowlike.svg",width: 15,),
                                        SizedBox(width: 5,),
                                        Container(
                                          padding: EdgeInsets.only(left: 8,right: 8),
                                          decoration: BoxDecoration(
                                            color: Appcolors.yellow,
                                            borderRadius: BorderRadius.all(Radius.circular(8))
                                          ),
                                          child: Text(item["rating"].toString()+"/5",style: TextStyle(fontFamily: 'mulish',fontWeight: FontWeight.bold),),
                                        )
                                      ],
                                    ),
                                    subtitle: Text(item["review"]),
                                  );
                                }
                              ),
                            )
                          ),
                        );
                      }
                    })
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
