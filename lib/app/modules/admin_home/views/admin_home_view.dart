import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/admin_home_controller.dart';

class AdminHomeView extends GetView<AdminHomeController> {
  const AdminHomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AdminHomeView'),
        actions: [
          IconButton(
              onPressed: () async {
                final shouldLogout = await showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Logout'),
                    content: const Text('Are you sure you want to logout?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, false),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, true),
                        child: const Text('Logout'),
                      ),
                    ],
                  ),
                );
                if (shouldLogout ?? false) {
                  await controller.auth.signOut();
                }
              },
              icon: const Icon(Icons.logout)),
        ],
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'INI HALAMAN HOME PENGELOLA',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
