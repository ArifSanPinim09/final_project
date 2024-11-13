import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "ArenaKu",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline, color: Colors.black),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Aturan Penggunaan"),
                    content: const Text(
                      "Dengan menggunakan aplikasi ini, Anda harus mengikuti aturan yang berlaku:\n\n"
                      "1. Dilarang menyalahgunakan aplikasi.\n"
                      "2. Bersikap sopan dan tidak menyinggung pengguna lain.\n"
                      "3. Patuh terhadap kebijakan privasi dan syarat penggunaan aplikasi.",
                    ),
                    actions: [
                      TextButton(
                        child: const Text(
                          "Tutup",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/auth.png',
                    height: 150,
                    width: 150,
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    "Selamat datang di ArenaKu",
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  const Text(
                    "Main Tanpa Batas",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.grey,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40.0),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 5,
                ),
                onPressed: () {
                  controller.signInWithGoogle();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/google.png',
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Masuk dengan Google',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Text(
          "Dengan melanjutkan, Anda menyetujui syarat dan ketentuan kami.",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
