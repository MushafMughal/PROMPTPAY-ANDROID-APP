import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prompt_pay/respository/core_repository.dart';
import 'package:prompt_pay/widgets/app_snackbar.dart';

class PayeesController extends GetxController {
  RxList<Map<String, dynamic>> payeesList = <Map<String, dynamic>>[].obs;

  savePayeesData({required List<Map<String, dynamic>> data}) {
    payeesList.value = data;
    update();
  }

  getPayees({required BuildContext context}) async {
    final res = await CoreRepositoryService().getPayeesList(
      context: context,
    );
    if (res['status'] == true && res['data'] != null) {
      await savePayeesData(data: List.from(res['data']));
      savePayeesData(data: List.from(res['data']));
    }
  }

  final TextEditingController payeeNameController = TextEditingController();
  void clearPayeeName() {
    payeeNameController.clear();
  }

  final TextEditingController accountNumberController = TextEditingController();
  void clearAccountNumber() {
    accountNumberController.clear();
  }

  addPayee({required BuildContext context}) async {
    if (payeeNameController.text.isEmpty) {
      appSnackbar(
        'Error',
        'Payee name cannot be empty',
      );
      return;
    }
    if (accountNumberController.text.isEmpty) {
      appSnackbar(
        'Error',
        'Account number cannot be empty',
      );
      return;
    }
    final res = await CoreRepositoryService().addPayee(
      context: context,
      body: {
        'payee_name': payeeNameController.text,
        'account_number': int.parse(accountNumberController.text),
        'bank_name': 'PromptPay',
      },
    );
    if (res['status'] == true) {
      clearAccountNumber();
      clearPayeeName();
      Get.back();
      await getPayees(context: context);
    }
  }

  sendMoney(
      {required BuildContext context,
      required Map<String, dynamic> body}) async {
    if (body['account_number'].isEmpty) {
      appSnackbar(
        'Error',
        'Account number cannot be empty',
      );
      return;
    }
    if (body['amount'].isEmpty) {
      appSnackbar(
        'Error',
        'Amount cannot be empty',
      );
      return;
    }
    body['amount'] = double.parse(body['amount'].toString()).toStringAsFixed(2);
    final res = await CoreRepositoryService().sendMoney(
      context: context,
      body: body,
    );
    if (res['status'] == true) {
      return res;
    } else {
      appSnackbar('Error', res['message']);
    }
  }

  verifyOtp(
      {required BuildContext context,
      required Map<String, dynamic> body}) async {
    if (body['otp'].isEmpty) {
      appSnackbar(
        'Error',
        'OTP cannot be empty',
      );
      return;
    }

    body['amount'] = double.parse(body['amount'].toString()).toStringAsFixed(2);
    final res = await CoreRepositoryService().verifyOtp(
      context: context,
      body: body,
    );
    if (res['status'] == true) {
      Get.back();
      appSnackbar('Success', res['message']);
      return res;
    } else {
      appSnackbar('Error', res['message']);
    }
  }

  resendOtp({required BuildContext context}) async {
    final res = await CoreRepositoryService().resendOtp(
      context: context,
    );
    if (res['status'] == true) {
      appSnackbar('Success', res['message']);
      return res;
    } else {
      appSnackbar('Error', res['message']);
    }
  }
}
