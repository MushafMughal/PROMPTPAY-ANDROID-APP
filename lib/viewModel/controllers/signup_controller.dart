import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prompt_pay/respository/auth_repository.dart';
import 'package:prompt_pay/routes/routes.dart';
import 'package:prompt_pay/widgets/app_snackbar.dart';

class SignupController extends GetxController {
  final RxBool _showPassword = false.obs;
  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> phoneController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  Rx<TextEditingController> usernameController = TextEditingController().obs;
  Rx<TextEditingController> cnicController = TextEditingController().obs;
  Rx<TextEditingController> dobController = TextEditingController().obs;
  RxBool get showPassword => _showPassword;
  void toggleShowPassword() {
    _showPassword.value = !_showPassword.value;
  }

  onSignup({required BuildContext context}) async {
    final body = {
      'email': emailController.value.text,
      'username': usernameController.value.text,
      'password': passwordController.value.text,
      'phone_number': phoneController.value.text,
      'name': nameController.value.text,
      'cnic': cnicController.value.text,
      'dob': dobController.value.text,
    };
    if (emailController.value.text.isEmpty ||
        passwordController.value.text.isEmpty ||
        phoneController.value.text.isEmpty ||
        nameController.value.text.isEmpty ||
        usernameController.value.text.isEmpty ||
        cnicController.value.text.isEmpty ||
        dobController.value.text.isEmpty) {
      appSnackbar(
        'Error',
        'All fields are required',
      );
      return;
    }
    final res = await AuthRepository().signupApi(
      body: body,
      context: context,
    );
    if (res['status'] == true) {
      appSnackbar(
        'Success',
        res['message'],
      );
      Get.offAllNamed(Routes.login);
    } else {
      appSnackbar(
        'Error',
        res['message'],
      );
    }
  }
}
