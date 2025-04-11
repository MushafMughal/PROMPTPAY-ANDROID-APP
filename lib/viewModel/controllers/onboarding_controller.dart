import 'package:get/get.dart';
import 'package:prompt_pay/routes/routes.dart';
import 'package:prompt_pay/storage/storage.dart';

class OnboardingController extends GetxController {
  RxInt currentIndex = 0.obs;
  List<String> images = [
    'assets/pngs/onboardingFirst.png',
    'assets/pngs/onboardingSecond.png',
    'assets/pngs/onboardingThird.png',
  ];
  List<String> titles = [
    'Effortless Banking for Everyday Life',
    'Banking that grows with you',
    'Instant support for all your needs',
  ];
  List<String> descriptions = [
    'Seamless, smart banking that effortlessly enhances your daily experience',
    'From your first savings to major investments, our banking solutions evolve alongside your financial journey',
    'Get immediate assistance whenever you need it, with a dedicated team ready to resolve your banking inquiries',
  ];

  void nextPage() async {
    if (currentIndex.value == 2) {
      await setDataToStorage(StorageKey.onboardingDone, 'true');
      Get.toNamed(Routes.login);
    } else {
      currentIndex.value++;
    }
    ;
  }
}
