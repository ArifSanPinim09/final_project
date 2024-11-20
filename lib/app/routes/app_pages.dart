import 'package:get/get.dart';

import '../modules/admin_add_field/bindings/admin_add_field_binding.dart';
import '../modules/admin_add_field/views/admin_add_field_view.dart';
import '../modules/admin_field/bindings/admin_field_binding.dart';
import '../modules/admin_field/views/admin_field_view.dart';
import '../modules/admin_home/bindings/admin_home_binding.dart';
import '../modules/admin_home/views/admin_home_view.dart';
import '../modules/admin_income/bindings/admin_income_binding.dart';
import '../modules/admin_income/views/admin_income_view.dart';
import '../modules/admin_navbar/bindings/admin_navbar_binding.dart';
import '../modules/admin_navbar/views/admin_navbar_view.dart';
import '../modules/admin_profile/bindings/admin_profile_binding.dart';
import '../modules/admin_profile/views/admin_profile_view.dart';
import '../modules/complete_profile/bindings/complete_profile_binding.dart';
import '../modules/complete_profile/views/complete_profile_view.dart';
import '../modules/field_detail/bindings/field_detail_binding.dart';
import '../modules/field_detail/views/field_detail_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/konfirmasi_pembayaran/bindings/konfirmasi_pembayaran_binding.dart';
import '../modules/konfirmasi_pembayaran/views/konfirmasi_pembayaran_view.dart';
import '../modules/lapangan/bindings/lapangan_binding.dart';
import '../modules/lapangan/views/lapangan_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/pembayaran_sukses/bindings/pembayaran_sukses_binding.dart';
import '../modules/pembayaran_sukses/views/pembayaran_sukses_view.dart';
import '../modules/pesanan/bindings/pesanan_binding.dart';
import '../modules/pesanan/views/pesanan_view.dart';
import '../modules/search_field/bindings/search_field_binding.dart';
import '../modules/search_field/views/search_field_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/tiket/bindings/tiket_binding.dart';
import '../modules/tiket/views/tiket_view.dart';
import '../modules/user_navbar/bindings/user_navbar_binding.dart';
import '../modules/user_navbar/views/user_navbar_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.COMPLETE_PROFILE,
      page: () => const CompleteProfileView(),
      binding: CompleteProfileBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_HOME,
      page: () => const AdminHomeView(),
      binding: AdminHomeBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_NAVBAR,
      page: () => const AdminNavbarView(),
      binding: AdminNavbarBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_FIELD,
      page: () => const AdminFieldView(),
      binding: AdminFieldBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_ADD_FIELD,
      page: () => const AdminAddFieldView(),
      binding: AdminAddFieldBinding(),
    ),
    GetPage(
      name: _Paths.USER_NAVBAR,
      page: () => const UserNavbarView(),
      binding: UserNavbarBinding(),
    ),
    GetPage(
      name: _Paths.LAPANGAN,
      page: () => const LapanganView(),
      binding: LapanganBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_INCOME,
      page: () => const AdminIncomeView(),
      binding: AdminIncomeBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_PROFILE,
      page: () => const AdminProfileView(),
      binding: AdminProfileBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_FIELD,
      page: () => const SearchFieldView(),
      binding: SearchFieldBinding(),
    ),
    GetPage(
      name: _Paths.FIELD_DETAIL,
      page: () => const FieldDetailView(),
      binding: FieldDetailBinding(),
    ),
    GetPage(
      name: _Paths.PESANAN,
      page: () => const PesananView(),
      binding: PesananBinding(),
    ),
    GetPage(
      name: _Paths.KONFIRMASI_PEMBAYARAN,
      page: () => const KonfirmasiPembayaranView(),
      binding: KonfirmasiPembayaranBinding(),
    ),
    GetPage(
      name: _Paths.PEMBAYARAN_SUKSES,
      page: () => const PembayaranSuksesView(),
      binding: PembayaranSuksesBinding(),
    ),
    GetPage(
      name: _Paths.TIKET,
      page: () => const TiketView(),
      binding: TiketBinding(),
    ),
  ];
}
