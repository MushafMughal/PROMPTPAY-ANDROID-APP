import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prompt_pay/viewModel/controllers/account_controller.dart';
import 'package:prompt_pay/viewModel/controllers/mastercard_controller.dart';
import 'package:prompt_pay/viewModel/controllers/payees_controller.dart';
import 'package:prompt_pay/viewModel/controllers/transaction_controller.dart';

class Helper {
  static void onRefresh({required BuildContext context}) {
    final accountController = Get.find<AccountController>();
    final cardController = Get.find<MastercardController>();
    final transactionController = Get.find<TransactionController>();
    final payeeController = Get.find<PayeesController>();
    accountController.getAccountDetails(context: context);
    cardController.getCardDetails(context: context);
    transactionController.getTransactionList(context: context);
    payeeController.getPayees(context: context);
  }
}
