import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/lapangan_controller.dart';

class LapanganView extends GetView<LapanganController> {
  const LapanganView({super.key});

  @override
  Widget build(BuildContext context) {
    // Daftar data dummy untuk kartu
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

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Text(
                    'Sedang promo nih',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount:
                    listLapangan.length + 1, // Tambahkan 1 untuk teks tambahan
                itemBuilder: (context, index) {
                  if (index == 2) {
                    // Tampilkan teks setelah kartu kedua
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Lapangan terdekat',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }

                  // Data kartu
                  final item = listLapangan[index > 2 ? index - 1 : index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: GestureDetector(
                      onTap: (){
                        Get.toNamed("field-detail");
                      },
                      child:
                        Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.network(
                                        item['foto'],
                                        height: 95,
                                        width: 95,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(width: 15),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // Nama lapangan
                                          Text(
                                            item['name'],
                                            style: const TextStyle(
                                              fontSize: 19,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          // Alamat
                                          Text(
                                            item['alamat'],
                                            style: const TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          // Bintang dan Harga
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              // Bintang
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                    size: 20,
                                                  ),
                                                  const SizedBox(width: 5),
                                                  Text(
                                                    item['bintang'],
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              // Harga
                                              Text(
                                                item['harga'],
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                // Divider
                                const Divider(
                                  color: Colors.grey,
                                  thickness: 1,
                                ),
                                const SizedBox(height: 0),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Availabe 10 Slot Today',
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.percent,
                                          size: 15,
                                          color: Colors.orange,
                                        ),
                                        Text(
                                          'Dapatkan Diskon 5%',
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
