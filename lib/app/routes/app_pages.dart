import 'package:get/get.dart';
import 'package:my_daily/modules/target/views/target_page.dart';

import '../../modules/home/bindings/home_binding.dart';
import '../../modules/home/views/home_page.dart';
import '../../modules/history/views/history_page.dart';
import '../../modules/history/bindings/history_binding.dart';
import '../../modules/splash/bindings/splash_binding.dart';
import '../../modules/splash/views/splash_page.dart';
import '../../modules/add_note/views/add_note_page.dart';
import '../../modules/add_note/bindings/add_note_binding.dart';
import '../../modules/main/views/main_page.dart';
import '../../modules/login/views/login_page.dart';
import '../../modules/register/views/register_page.dart';
import '../../modules/main/bindings/main_binding.dart';
import '../../modules/login/bindings/login_binding.dart';
import '../../modules/register/bindings/register_binding.dart';
import '../../modules/settings/views/edit_username_page.dart';
import '../../modules/settings/views/username_success_page.dart';
import '../../modules/settings/bindings/edit_username_binding.dart';
import '../../modules/target/bindings/target_binding.dart';
import '../../modules/target/views/add_target_page.dart';
import '../../modules/target/bindings/add_target_binding.dart';
import '../../modules/target/views/target_success_page.dart';
import '../../modules/target/bindings/target_success_binding.dart';
import '../../modules/forgot_password/views/forgot_password_page.dart';
import '../../modules/forgot_password/views/password_success_page.dart';
import '../../modules/forgot_password/bindings/forgot_password_binding.dart';

import 'app_routes.dart';

class AppPages {
  static final pages = [

    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),

    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),

    GetPage(
      name: AppRoutes.addNote,
      page: () => const AddNotePage(),
      binding: AddNoteBinding(),
    ),

    GetPage(
      name: AppRoutes.history,
      page: () => const HistoryPage(),
      binding: HistoryBinding(),
    ),

    GetPage(
      name: AppRoutes.main,
      page: () => const MainPage(),
      binding: MainBinding(),
    ),

    GetPage(
      name: AppRoutes.statistics,
      page: () => const MainPage(),
      binding: MainBinding(),
    ),

    GetPage(
      name: AppRoutes.settings,
      page: () => const MainPage(),
      binding: MainBinding(),
    ),

    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),

    GetPage(
      name: AppRoutes.register,
      page: () => const RegisterPage(),
      binding: RegisterBinding(),
    ),

    GetPage(
      name: AppRoutes.target,
      page: () => const TargetPage(),
      binding: TargetBinding(),
    ),

    GetPage(
      name: AppRoutes.editUsername,
      page: () => const EditUsernamePage(),
      binding: EditUsernameBinding(),
    ),

    GetPage(
      name: AppRoutes.usernameSuccess,
      page: () => const UsernameSuccessPage(),
    ),

    GetPage(
      name: AppRoutes.addTarget,
      page: () => const AddTargetPage(),
      binding: AddTargetBinding(),
    ),

    GetPage(
      name: AppRoutes.targetSuccess,
      page: () => const TargetSuccessPage(),
      binding: TargetSuccessBinding(),
    ),

    GetPage(
      name: AppRoutes.forgotPassword,
      page: () => const ForgotPasswordPage(),
      binding: ForgotPasswordBinding(),
    ),

    GetPage(
      name: AppRoutes.passwordSuccess,
      page: () => const PasswordSuccessPage(),
      
    ),

  ];
}