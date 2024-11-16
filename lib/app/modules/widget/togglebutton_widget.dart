import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TogglebuttonWidget extends StatelessWidget{
  List<String> items;
  var itemselected;
  var selections;

  TogglebuttonWidget(
    this.items
  );
  
  selectbutton(index,selections){
    if (selections[index]==false){
      selections[index]=true;
    }
    else{
      selections[index]=false;
    }
  }
  returnselectbuttonstyle(index,selections){
    return ElevatedButton.styleFrom(
      backgroundColor: selections[index]==false? Color(0xffDFDFDF):Color(0xffFDC300),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );
  }
  get getselections => selections;
  @override
  Widget build(BuildContext context) {
    selections=List.generate(items.length, (index)=>false).obs;
    return Container(
      height: 220,
      child: 
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 10,crossAxisSpacing: 10),
          itemCount: items.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context,int index){
            return Obx((){return 
              ElevatedButton(onPressed: (){selectbutton(index,selections);}, child: Text(items[index],style: TextStyle(color:Color(0xff28293F)),),style: returnselectbuttonstyle(index,selections));
            });
          }
        ),
    );
  }
}
