import 'package:final_project/app/modules/widget/imagelistview_widget.dart';
import 'package:final_project/app/modules/widget/togglebutton_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:final_project/app/modules/widget/selectbutton_widget.dart';

class AdminAddFieldController extends GetxController {
  TextEditingController namecontroller=TextEditingController();
  TextEditingController locationcontroller=TextEditingController();
  TextEditingController heightcontroller=TextEditingController();
  TextEditingController widthcontroller=TextEditingController();
  TextEditingController capacitycontroller=TextEditingController();

  var returnedimage=Rx<XFile?>(null);

  var discountselectbutton=SelectbuttonWidget([0,25,50,75,100]);
  var priceselectbutton=SelectbuttonWidget([100000,150000,200000,250000,300000,35000]);
  var facilitytogglebutton=TogglebuttonWidget(["Tempat Parkir","Mushola","Full CCTV","Ruang Tunggu","Ruang Ganti"]);

  var imageview=ImagelistviewWidget();

  Future pickimagefromgallery() async{
    var returnedimage = await ImagePicker().pickImage(source: ImageSource.gallery);
    for (var i=0;i<imageview.listimage.length;i++){
      if(imageview.listimage[i]==null){
        imageview.updatelistimage(returnedimage, i);
        break;
      }
    }
  }

  Future pickimagefromcamera() async{
    var returnedimage = await ImagePicker().pickImage(source: ImageSource.camera);
    this.returnedimage.value=returnedimage;
  }

  get discount=>discountselectbutton.getitemselected;
  get price=>priceselectbutton.getitemselected;
  get imagelist=>imageview.listimage;
  get facility=>facilitytogglebutton.getselections;

  @override
  void dispose(){
    namecontroller.dispose();
    locationcontroller.dispose();
    heightcontroller.dispose();
    widthcontroller.dispose();
    capacitycontroller.dispose();
    super.dispose();
  }
}
