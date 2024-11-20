import 'package:final_project/app/modules/lapangan/controllers/lapangan_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LapanganView extends GetView<LapanganController> {
  const LapanganView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Lapangan"),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            _buildHeader("Sedang Promo"),
            _buildFieldList(context, isPromo: true),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(String title) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Mulish',
          ),
        ),
      ),
    );
  }

  Widget _buildFieldList(BuildContext context, {required bool isPromo}) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => _buildFieldCard(context),
          childCount: isPromo ? 2 : 8,
        ),
      ),
    );
  }

  Widget _buildFieldCard(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 2,
      child: InkWell(
        onTap: () => Get.toNamed("field-detail"),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  'https://i.pinimg.com/736x/83/dc/63/83dc631767dab6612d223b8a5f817549.jpg',
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'CGV Sport Hall FX',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Mulish',
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Jln. Jend. Sudirman No.25',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                        fontFamily: 'Mulish',
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Row(
                      children: [
                        Icon(Icons.star, size: 16, color: Colors.amber),
                        SizedBox(width: 4),
                        Text(
                          '4.2 (40)',
                          style: TextStyle(fontSize: 12),
                        ),
                        Spacer(),
                        Text(
                          '300k/jam',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Divider(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '10 slot tersedia',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                        const Row(
                          children: [
                            Icon(Icons.percent, size: 14, color: Colors.orange),
                            SizedBox(width: 4),
                            Text(
                              'Diskon 5%',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.orange,
                              ),
                            ),
                          ],
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
  }
}
