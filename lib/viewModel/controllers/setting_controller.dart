import 'package:get/get.dart';

class SettingController extends GetxController {
  RxBool switchValue = false.obs;

  updateValue(newValue) {
    switchValue.value = newValue;
  }
}
