import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prompt_pay/respository/core_repository.dart';
import 'package:prompt_pay/routes/routes.dart';
import 'package:prompt_pay/widgets/app_snackbar.dart';

class TransactionController extends GetxController {
  RxList<Map<String, dynamic>> transactionList = <Map<String, dynamic>>[].obs;
  RxMap<String, dynamic> transactionDetails = <String, dynamic>{}.obs;

  saveTransactionListData({required List<Map<String, dynamic>> data}) {
    transactionList.value = data;
    update();
  }

  saveTransactionDetailsData({required Map<String, dynamic> data}) {
    transactionDetails.value = data;
    update();
  }

  getTransactionList({required BuildContext context}) async {
    final res = await CoreRepositoryService().getTransactionList(
      context: context,
    );
    if (res['status'] == true && res['data'] != null) {
      await saveTransactionListData(
        data: List.from(res['data']),
      );
      update();
    } else {
      appSnackbar(
        'Error',
        'Failed to fetch transaction list',
      );
    }
  }

  getTransactionDetails({
    required BuildContext context,
    required String id,
  }) async {
    final res = await CoreRepositoryService().getTransactionDetailsById(
      context: context,
      id: id,
    );
    if (res['status'] == true && res['data'] != null) {
      await saveTransactionDetailsData(
        data: res['data'],
      );
      update();
      Get.toNamed(Routes.transactionDetails);
    } else {
      appSnackbar(
        'Error',
        'Failed to fetch transaction details',
      );
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
      // await getPayees(context: context);
    }
  }
}
