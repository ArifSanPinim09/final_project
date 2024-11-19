import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagelistviewWidget extends StatelessWidget {
  RxList<XFile?> listimage = RxList<XFile?>(
      [null, null, null, null, null, null, null, null, null].obs);

  ImagelistviewWidget({super.key});

  void updatelistimage(returnedimage, index) {
    for (var i = 0; i < listimage.length; i++) {
      if (listimage[i] == null) {
        listimage[i] = returnedimage;
        break;
      }
    }
  }

  bool isenoughimage() {
    var count = 0;
    for (var i = 0; i < listimage.length; i++) {
      if (listimage[i] != null) {
        count++;
      }
    }
    if (count >= 3) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.builder(
          itemCount: listimage.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Obx(() {
              print(listimage);
              var image = listimage[index];
              if (image != null) {
                return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        child: Image.file(
                          File(listimage[index]!.path),
                          fit: BoxFit.cover,
                          width: 130,
                          height: 130,
                        )));
              } else {
                return const SizedBox();
              }
            });
          }),
    );
  }
}
