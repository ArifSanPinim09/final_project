import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});

  final List<Map<String, dynamic>> kategori = [
    {'name': 'Terdekat'},
    {'name': 'Termurah'},
    {'name': 'Fasilitas Lengkap'},
  ];

  final List<Map<String, dynamic>> listLapangan = [
    {
      'foto':
          'https://i.pinimg.com/736x/83/dc/63/83dc631767dab6612d223b8a5f817549.jpg',
      'name': 'CGV Sport Hall FX',
      'alamat': 'Jln. jend. Sudirman No.25',
      'icon': Icons.star,
      'bintang': '4.2(40)',
      'harga': '300/jam'
    },
    {
      'foto':
          'https://i.pinimg.com/736x/9d/69/26/9d6926d71f88524d8341e9acc9393c5a.jpg',
      'name': 'Citra Pasuruan',
      'alamat': 'Jln. Petahunan No.7',
      'icon': Icons.star,
      'bintang': '4.8(50)',
      'harga': '300/jam'
    },
    {
      'foto':
          'https://i.pinimg.com/736x/b8/07/f6/b807f695899edf4f85977f99718b631d.jpg',
      'name': 'Futsal Cilacap',
      'alamat': 'Jln. Patiyunus No.66',
      'icon': Icons.star,
      'bintang': '3.8(41)',
      'harga': '150/jam'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header container
            Container(
              height: 330,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              decoration: const BoxDecoration(
                color: Color(0xFF211A2C),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0xFFC4CBDA),
                        ),
                        child: Image.asset(
                          'assets/images/profile.png',
                          height: 36,
                          width: 36,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'Halo, Alfan',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () async {
                            final shouldLogout = await showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Logout'),
                                content: const Text(
                                    'Are you sure you want to logout?'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, false),
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, true),
                                    child: const Text('Logout'),
                                  ),
                                ],
                              ),
                            );
                            if (shouldLogout ?? false) {
                              await controller.auth.signOut();
                            }
                          },
                          icon: const Icon(Icons.logout,color: Colors.white,)),
                    ],
                  ),
                  const SizedBox(height: 30),
                  const Center(
                    child: Text(
                      'Mau sewa lapangan dimana?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Cari lapangan',
                            hintStyle: TextStyle(color: Colors.grey[400]),
                            prefixIcon:
                                const Icon(Icons.search, color: Colors.grey),
                            filled: true,
                            fillColor: const Color(0xFF28293F),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 17, horizontal: 17),
                          ),
                          style: const TextStyle(color: Colors.white),
                          onSubmitted: (query) {
                            Get.toNamed("/search-field");
                          },
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        flex: 2,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 17),
                          decoration: BoxDecoration(
                            color: const Color(0xFF28293F),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: DropdownButton<String>(
                            value: 'Jakarta',
                            icon: const Icon(Icons.arrow_drop_down_rounded,
                                color: Colors.white),
                            dropdownColor: const Color(0xFF28293F),
                            style: const TextStyle(color: Colors.white),
                            underline: Container(),
                            isDense: true,
                            onChanged: (String? newValue) {},
                            items: ['Jakarta', 'Pasuruan']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Horizontal list of categories
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
              child: SizedBox(
                height: 50,
                child: ListView.builder(
                  itemCount: kategori.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final item = kategori[index];
                    final containerColor =
                        index == 0 ? Colors.amber : const Color(0xFFDFDFDF);
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        // width: 100,
                        decoration: BoxDecoration(
                            color: containerColor,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: const Color(0xFFDFDFDF))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Center(child: Text(item['name'])),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            // Recommendations
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Rekomendasi untuk kamu',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Lihat Semua',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 5),
                            Icon(
                              Icons.arrow_drop_down_circle,
                              size: 20,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 350,
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    scrollDirection: Axis.horizontal,
                    itemCount: listLapangan.length,
                    itemBuilder: (context, index) {
                      final item = listLapangan[index];
                      return Transform.translate(
                        offset: const Offset(0, -10), // Geser ke atas
                        child: SizedBox(
                          height: 230,
                          width: 260,
                          child: Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Container(
                                    height: 180,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(30),
                                      image: DecorationImage(
                                        image: NetworkImage(item['foto']),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          item['name'],
                                          style: const TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          item['alamat'],
                                          style: const TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                item['icon'], // Ikon bintang
                                                color: Colors.amber,
                                                size: 25,
                                              ),
                                              const SizedBox(width: 5),
                                              Text(
                                                item['bintang'],
                                                style: const TextStyle(
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ],
                                          ),
                                          // Harga
                                          RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: item['harga']
                                                      .split('/')[0],
                                                  style: const TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text:
                                                      '/${item['harga'].split('/')[1]}',
                                                  style: const TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 10),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
