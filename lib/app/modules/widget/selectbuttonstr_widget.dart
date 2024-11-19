import 'package:final_project/app/materials/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectbuttonWidgetStr extends StatelessWidget{
  List<String> items;
  var itemselected;

  SelectbuttonWidgetStr(
    this.items
  );
  
  selectbutton(index,selections){
    selections.value=List.filled(selections.length, false);
    selections[index]=true;
    itemselected.value=items[index];
  }

  returncontainerboxdecoration(index,selections){
    return BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: selections[index] == false ? Colors.transparent : Appcolors.yellow,
          width: 2,
        )
      )
    );
  }

  returnselectbuttonstyle(index,selections){
    return ElevatedButton.styleFrom(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        side: BorderSide(
          color: Colors.transparent,
          width: 0,
        )
        ),
    );
  }
  get getitemselected => itemselected;
  @override
  Widget build(BuildContext context) {
    var selections=List.generate(items.length, (index)=>index==0).obs;
    itemselected=items[0].obs;
    return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: items.asMap().entries.map((entry) {
        final index = entry.key;
        final item = entry.value;
        return Obx(() {
          return Container(
            decoration: returncontainerboxdecoration(index, selections),
            child:
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: ElevatedButton(
                  onPressed: () {
                    selectbutton(index, selections);
                  },
                  child: Text(
                    item.toString(),
                    style: TextStyle(color: Color(0xff28293F)),
                  ),
                  style: returnselectbuttonstyle(index, selections),
                ),
              ),
          );
        });
      }).toList(),
    ),
  );

  }
}
