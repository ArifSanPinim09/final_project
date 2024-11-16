import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectbuttonWidget extends StatelessWidget{
  List<int> items;
  var itemselected;

  SelectbuttonWidget(
    this.items
  );
  
  selectbutton(index,selections){
    selections.value=List.filled(selections.length, false);
    selections[index]=true;
    itemselected.value=items[index];
  }
  returnselectbuttonstyle(index,selections){
    return ElevatedButton.styleFrom(
      backgroundColor: selections[index]==false? Color(0xffDFDFDF):Color(0xffFDC300),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );
  }
  get getitemselected => itemselected;
  @override
  Widget build(BuildContext context) {
    var selections=List.generate(items.length, (index)=>index==0).obs;
    itemselected=items[0].obs;
    return Container(
      height: 40,
      child: 
        ListView.builder(
          itemCount: items.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context,int index){
            return Obx((){return Padding(
              padding: EdgeInsets.only(right: 10),
              child: SizedBox(child: ElevatedButton(onPressed: (){selectbutton(index,selections);}, child: Text(items[index].toString(),style: TextStyle(color:Color(0xff28293F)),),style: returnselectbuttonstyle(index,selections))),
            );});
          }
        ),
    );
  }
}
