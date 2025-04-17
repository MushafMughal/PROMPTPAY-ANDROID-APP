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

  final RxBool _currentPassword = false.obs;
  RxBool get currentPassword => _currentPassword;
  void toggleCurrentPassword() {
    _currentPassword.value = !_currentPassword.value;
  }

  final RxBool _newPassword1 = false.obs;
  RxBool get newPassword1 => _newPassword1;
  void toggleNewPassword1() {
    _newPassword1.value = !_newPassword1.value;
  }

  final RxBool _newPassword2 = false.obs;
  RxBool get newPassword2 => _newPassword2;
  void toggleNewPassword2() {
    _newPassword2.value = !_newPassword2.value;
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
      };

      final res = await AuthRepository().loginApi(
        body: body,
        context: context,
      );
      if (res['status'] == true && res['data']['access'] != null) {
        await setDataToStorage(StorageKey.token, res['data']['access']);
        await setDataToStorage(StorageKey.refreshToken, res['data']['refresh']);
        appSnackbar(
          'Success',
          res['message'],
        );
        Get.offAllNamed(Routes.dashboard);
      }
    }
  }

  updatePassword({
    required Map<String, dynamic> body,
    required BuildContext context,
  }) async {
    if (body['current password'].isEmpty ||
        body['new password'].isEmpty ||
        body['confirm password'].isEmpty) {
      appSnackbar(
        'Error',
        'All fields are required',
      );
      return;
    } else if (body['new password'] != body['confirm password']) {
      appSnackbar(
        'Error',
        'New password and confirm password do not match',
      );
      return;
    }
    final res = await AuthRepository().updatePassword(
      body: body,
      context: context,
    );
    if (res['status'] == true) {
      appSnackbar('Success', res['message']);
      return res;
    } else {
      appSnackbar(
        'Error',
        res['message'] ?? 'Profile update failed',
      );
    }
  }
}
