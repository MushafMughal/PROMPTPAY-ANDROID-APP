import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prompt_pay/respository/auth_repository.dart';
import 'package:prompt_pay/routes/routes.dart';
import 'package:prompt_pay/storage/storage.dart';
import 'package:prompt_pay/widgets/app_snackbar.dart';

class LoginController extends GetxController {
  Rx<TextEditingController> usernameController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  final RxBool _showPassword = false.obs;
  RxBool get showPassword => _showPassword;
  void toggleShowPassword() {
    _showPassword.value = !_showPassword.value;
  }

  onLogin({required BuildContext context}) async {
    if (usernameController.value.text.isEmpty ||
        passwordController.value.text.isEmpty) {
      appSnackbar(
        'Error',
        'All fields are required',
      );
      return;
    } else {
      final body = {
        'username': usernameController.value.text,
        'password': passwordController.value.text,
        // 'deviceToken': GlobalVariable.deviceToken,
      };

      final res = await AuthRepository().loginApi(
        body: body,
        context: context,
      );
      if (res['status'] == true && res['data']['access'] != null) {
        await setDataToStorage(StorageKey.token, res['data']['access']);
        appSnackbar(
          'Success',
          res['message'],
        );
        Get.offAllNamed(Routes.dashboard);
      }
    }
  }
}
