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
}
