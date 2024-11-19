import 'package:get/get.dart';

class SearchFieldController extends GetxController {
  final List<Map<String, dynamic>> listLapangan = List.generate(10, (index) {
      return {
        'foto':
            'https://i.pinimg.com/736x/83/dc/63/83dc631767dab6612d223b8a5f817549.jpg',
        'name': 'CGV Sport Hall FX', // Nama lapangan
        'alamat': 'Jln. Jend. Sudirman No.25', // Alamat
        'bintang': '4.2(40)', // Rating
        'harga': '300/jam', // Harga
      };
    });
}
