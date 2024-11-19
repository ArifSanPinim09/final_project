import 'package:final_project/app/modules/widget/selectbuttonstr_widget.dart';
import 'package:get/get.dart';

class FieldDetailController extends GetxController {
  final listLapangan = 
      {
        'foto':
            'https://i.pinimg.com/736x/83/dc/63/83dc631767dab6612d223b8a5f817549.jpg',
        'name': 'CGV Sport Hall FX', // Nama lapangan
        'alamat': 'Jl. Jenderal Sudirman No.25, RT.1/RW.3, Gelora, Kecamatan Tanah Abang, Kota Jakarta Pusat, Daerah Khusus Ibukota Jakarta 10270', // Alamat
        'bintang': '4.2(40)', // Rating
        'harga': '300.000', // Harga
        'jarak': '1,6',
        'diskon':'10',
  };

  final List<Map<String, dynamic>> listreview = List.generate(10, (index) {
  return {
    'photo':'assets/images/profile.png',
    'username':'Andi',
    'rating':5,
    'review':'Lapangannya bagus dan worth it sama harganya, fasilitasnya juga lengkap.',
    };
    }
  );

  final facility={
    'Ukuran':'16.8m x 24.95m',
    'Kapasitas':14,
    'Tempat Parkir':true,
    'Mushola':true,
    'Full CCTV':true,
    'Ruang Tunggu':true,
    'Ruang Ganti':true,
  };

  final facilitylogo=[
    "assets/icons/icon-park-outline_court.svg",
    "assets/icons/Group.svg",
    "assets/icons/parkir.svg",
    "assets/icons/fa6-solid_mosque.svg",
    "assets/icons/bxs_cctv.svg",
    "assets/icons/material-symbols_chair.svg",
    "assets/icons/mdi_clothes-hanger.svg",
  ];

  get facilitylist=>facility.entries.toList();

  List truefacility() {
    var truefacility;
    for (int i=0;i<facilitylist.length;i++){
      if(i>=0 && i<=1){
        truefacility.add(facilitylist[i].value);
      }
      if(facilitylist[i].value==true){
        truefacility.add(facilitylist[i].value);
      }
    }
    print(truefacility);
    return truefacility;
  }

  int countfacility() {
    int count = 0;
    facility.forEach((key, value) {
      if (value == true) {
        count++;
      }
    });
    return count+2;
  }

  final facilityreviewbutton=SelectbuttonWidgetStr(["Fasilitas","Review"]);
  get facilityreviewvalue =>facilityreviewbutton.getitemselected;
}
