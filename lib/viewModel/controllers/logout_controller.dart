import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prompt_pay/respository/auth_repository.dart';
import 'package:prompt_pay/routes/routes.dart';
import 'package:prompt_pay/storage/storage.dart';
import 'package:prompt_pay/widgets/app_snackbar.dart';

class LogoutController extends GetxController {
  onLogout({required BuildContext context}) async {
    final body = {
      "refresh": await getDataFromStorage(StorageKey.refreshToken),
    };
    final res = await AuthRepository().logoutApi(
      body: body,
      context: context,
    );
    if (res['status'] == true) {
      await deleteDataFromStorage(StorageKey.token);
      await deleteDataFromStorage(StorageKey.refreshToken);
      appSnackbar(
        'Success',
        'Logged out successfully',
      );
      Get.offAllNamed(Routes.login);
    } else {
      appSnackbar(
        'Error',
        res['message'] ?? 'Logout failed',
      );
    }
  }
}
