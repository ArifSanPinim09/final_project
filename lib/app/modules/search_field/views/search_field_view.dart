import 'package:final_project/app/materials/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/search_field_controller.dart';

class SearchFieldView extends GetView<SearchFieldController> {
  const SearchFieldView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.dark,
      appBar: AppBar(
        titleSpacing: 0,
        toolbarHeight: 80,
        title:Row(mainAxisSize: MainAxisSize.min,children: [
          SvgPicture.asset('assets/icons/material-symbols_location-on.svg'),
          const SizedBox(width: 5,),
          Text("Jakarta Pusat",style: TextStyle(color: Appcolors.white,fontFamily: 'Mulish',fontSize: 18,fontWeight: FontWeight.bold),),
        ],),
        centerTitle: true,
        backgroundColor: Appcolors.dark,
        scrolledUnderElevation: 0,
        leading: IconButton(onPressed: (){navigator?.pop(context);}, icon: SvgPicture.asset('assets/icons/arrow_left3.svg',colorFilter: ColorFilter.mode(Appcolors.yellow, BlendMode.srcIn),)),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft:Radius.circular(25),topRight: Radius.circular(25)),
          color: Appcolors.gray,
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount:
                    controller.listLapangan.length + 1, // Tambahkan 1 untuk teks tambahan
                itemBuilder: (context, index) {
                  // Data kartu
                  final item = controller.listLapangan[index > 2 ? index - 1 : index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Card(
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
                  );
                },
              ),
            ),
          ],
        )
      )
    );
  }
}
