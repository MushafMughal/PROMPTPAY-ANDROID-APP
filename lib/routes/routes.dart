import 'package:get/get.dart';
import 'package:prompt_pay/view/ChangePassword/change_password.dart';
import 'package:prompt_pay/view/Chat/chat_screen.dart';
import 'package:prompt_pay/view/Dashboard/dashboard.dart';
import 'package:prompt_pay/view/Dashboard/widgets/settings.dart';
import 'package:prompt_pay/view/Login/login.dart';
import 'package:prompt_pay/view/Onboarding/onboarding.dart';
import 'package:prompt_pay/view/PrivacyPolicy/privacy_policy.dart';
import 'package:prompt_pay/view/Profile/edit_profile.dart';
import 'package:prompt_pay/view/Profile/profile.dart';
import 'package:prompt_pay/view/SendMoney/send_money.dart';
import 'package:prompt_pay/view/Signup/signup.dart';
import 'package:prompt_pay/view/Splash/splash_screen.dart';
import 'package:prompt_pay/view/TransactionDetails/transaction_details.dart';
import 'package:prompt_pay/view/TransactionHistory/transaction_history.dart';

/// Routes name to directly navigate the route by its name
class Routes {
  static String splash = '/';
  static String onboarding = '/onboarding';
  static String login = '/login';
  static String settings = '/settings';
  static String editProfile = '/edit-profile';
  static String profile = '/profile';
  static String signup = '/signup';
  static String dashboard = '/dashboard';
  static String transactionHistory = '/transaction-history';
  static String transactionDetails = '/transaction-details';
  static String chat = '/chat';
  static String sendMoney = '/send-money';
  static String changePassword = '/change-password';
  static String privacyPolicy = '/privacy-policy';
}

/// Add this list variable into your GetMaterialApp as the value of getPages parameter.
/// You can get the reference to the above GetMaterialApp code.
final getPages = [
  GetPage(
    name: Routes.splash,
    page: () => const SplashScreen(),
    transitionDuration: const Duration(milliseconds: 400),
  ),
  GetPage(
    name: Routes.profile,
    page: () => const ProfileScreen(),
    transitionDuration: const Duration(milliseconds: 400),
  ),
  GetPage(
    name: Routes.editProfile,
    page: () => const EditProfileScreen(),
    transitionDuration: const Duration(milliseconds: 400),
  ),
  GetPage(
    name: Routes.settings,
    page: () => const SettingsScreens(),
    transitionDuration: const Duration(milliseconds: 400),
  ),
  GetPage(
    name: Routes.onboarding,
    page: () => const Onboarding(),
    transitionDuration: const Duration(milliseconds: 400),
  ),
  GetPage(
    name: Routes.login,
    page: () => const LoginScreen(),
    transitionDuration: const Duration(milliseconds: 400),
  ),
  GetPage(
    name: Routes.signup,
    page: () => const SignupScreen(),
    transitionDuration: const Duration(milliseconds: 400),
  ),
  GetPage(
    name: Routes.dashboard,
    page: () => const Dashboard(),
    transitionDuration: const Duration(milliseconds: 400),
  ),
  GetPage(
    name: Routes.transactionHistory,
    page: () => const TransactionHistory(),
    transitionDuration: const Duration(milliseconds: 400),
  ),
  GetPage(
    name: Routes.transactionDetails,
    page: () => const TransactionDetails(),
    transitionDuration: const Duration(milliseconds: 400),
  ),
  GetPage(
    name: Routes.chat,
    page: () => const ChatScreen(),
    transitionDuration: const Duration(milliseconds: 400),
  ),
  GetPage(
    name: Routes.sendMoney,
    page: () => const SendMoney(),
    transitionDuration: const Duration(milliseconds: 400),
  ),
  GetPage(
    name: Routes.changePassword,
    page: () => const ChangePassword(),
    transitionDuration: const Duration(milliseconds: 400),
  ),
  GetPage(
    name: Routes.privacyPolicy,
    page: () => const PrivacyPolicyScreen(),
    transitionDuration: const Duration(milliseconds: 400),
  ),
];
