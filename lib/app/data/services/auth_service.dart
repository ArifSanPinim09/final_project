import 'package:final_project/app/data/models/users_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService extends GetxService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  final Rx<UserModel?> currentUser = Rx<UserModel?>(null);

  @override
  void onInit() {
    super.onInit();

    ever(currentUser, _handleUserChanged);
    _auth.authStateChanges().listen(_handleAuthChanged);
  }

  void _handleAuthChanged(User? firebaseUser) async {
    if (firebaseUser != null) {
      final userData =
          await _db.collection('users').doc(firebaseUser.uid).get();
      if (userData.exists) {
        currentUser.value = UserModel.fromJson(userData.data()!);
      } else {
        final newUser = UserModel(
          uid: firebaseUser.uid,
          email: firebaseUser.email,
          phone: firebaseUser.phoneNumber,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
        await _db
            .collection('users')
            .doc(firebaseUser.uid)
            .set(newUser.toJson());
        currentUser.value = newUser;
      }
    } else {
      currentUser.value = null;
    }
  }

  void _handleUserChanged(UserModel? user) {
    if (user != null && !user.isProfileComplete) {
      Get.offAllNamed('/complete-profile');
    } else if (user != null && user.isProfileComplete) {
      if (user.role == 'penyewa') {
        Get.offAllNamed('/home');
      } else if (user.role == 'pengelola') {
        Get.offAllNamed('/admin-navbar');
      } else {
        Get.snackbar('Error', 'Role tidak valid');
      }
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _auth.signInWithCredential(credential);
    } catch (e) {
      Get.snackbar('Error', 'Failed to sign in with Google');
      rethrow;
    }
  }

  Future<void> updateUserProfile({
    required String name,
    required String birthDate,
    required String address,
    required String role,
  }) async {
    try {
      final user = currentUser.value;
      if (user != null) {
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

        await _db
            .collection('users')
            .doc(user.uid)
            .update(updatedUser.toJson());

        currentUser.value = updatedUser;
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to update profile');
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      await _googleSignIn.signOut();
      currentUser.value = null;
      Get.offAllNamed('/login');
    } catch (e) {
      Get.snackbar('Error', 'Failed to sign out');
      rethrow;
    }
  }
}
