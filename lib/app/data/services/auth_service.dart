import 'package:appwrite/appwrite.dart';
import 'package:appwrite/enums.dart';
import 'package:final_project/app/data/config/appwrite_config.dart';
import 'package:final_project/app/modules/login/views/login_view.dart';
import 'package:get/get.dart';
import '../models/users_model.dart';

class AuthService extends GetxService {
  late final Client client;
  late final Account account;
  late final Databases databases;

  final Rx<UserModel?> currentUser = Rx<UserModel?>(null);

  @override
  void onInit() {
    super.onInit();

    client = Client()
        .setEndpoint(AppwriteConfig.endpoint)
        .setProject(AppwriteConfig.projectId);

    account = Account(client);
    databases = Databases(client);

    _checkCurrentUser();

    ever(currentUser, _handleUserChanged);
  }

  Future<void> _checkCurrentUser() async {
    try {
      final user = await account.get();
      await _loadUserData(user);
    } catch (e) {
      currentUser.value = null;
    }
  }

  Future<void> _loadUserData(dynamic user) async {
    try {
      // Coba ambil dokumen user
      final response = await databases.getDocument(
        databaseId: AppwriteConfig.databaseId,
        collectionId: '673b134400091f1fdd26',
        documentId: user.$id,
      );

      // Data ditemukan
      currentUser.value = UserModel.fromJson({
        ...response.data,
        'uid': response.$id,
      });
    } catch (e) {
      // Jika dokumen tidak ditemukan, buat dokumen baru
      final newUser = UserModel(
        uid: user.$id,
        email: user.email,
        phone: user.phone ?? '',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await databases.createDocument(
        databaseId: AppwriteConfig.databaseId,
        collectionId: '673b134400091f1fdd26',
        documentId: user.$id,
        data: newUser.toJson(),
      );

      currentUser.value = newUser;
    }
  }

  void _handleUserChanged(UserModel? user) {
    if (user != null && !user.isProfileComplete) {
      // Data user belum lengkap, arahkan ke halaman complete_profile
      Get.offAllNamed('/complete-profile');
    } else if (user != null && user.isProfileComplete) {
      // Data user lengkap, arahkan sesuai role
      switch (user.role) {
        case 'penyewa':
          Get.offAllNamed('/user-navbar');
          break;
        case 'pengelola':
          Get.offAllNamed('/admin-navbar');
          break;
        default:
          Get.snackbar('Error', 'Role tidak valid');
          Get.offAllNamed('/error-page'); // Redirect ke halaman error
      }
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      await account.createOAuth2Session(provider: OAuthProvider.google);
      await Future.delayed(const Duration(microseconds: 500));
      final user = await account.get();
      await _loadUserData(user);
    } on AppwriteException catch (e) {
      print(e);
      Get.snackbar('Error', 'Login gagal');
    }
  }

  Future<void> updateUserProfile({
    required String name,
    required String birthDate,
    required String address,
    required String role,
    required String phone,
  }) async {
    try {
      final user = currentUser.value;
      if (user != null) {
        // Perbarui data user
        final updatedUser = UserModel(
          uid: user.uid,
          name: name,
          email: user.email,
          phone: user.phone,
          birthDate: birthDate,
          address: address,
          role: role,
          createdAt: user.createdAt,
          updatedAt: DateTime.now(),
        );

        await databases.updateDocument(
          databaseId: AppwriteConfig.databaseId,
          collectionId: '673b134400091f1fdd26',
          documentId: user.uid,
          data: updatedUser.toJson(),
        );

        // Update state currentUser
        currentUser.value = updatedUser;
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to update profile');
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      // Hapus semua controller yang mungkin aktif
      Get.reset(); // Reset seluruh GetX state

      await account.deleteSession(sessionId: 'current');
      currentUser.value = null;

      // Navigasi ke login
      Get.offAll(() => const LoginView());
    } catch (e) {
      Get.snackbar('Error', 'Gagal logout: ${e.toString()}');
    }
  }
}
