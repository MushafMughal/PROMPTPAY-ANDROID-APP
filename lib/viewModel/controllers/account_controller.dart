import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prompt_pay/respository/core_repository.dart';

class AccountController extends GetxController {
  RxMap<String, dynamic> accountDetails = <String, dynamic>{}.obs;

  saveAccountDate({required Map<String, dynamic> data}) {
    accountDetails.value = data;
    update();
  }

  getAccountDetails({required BuildContext context}) async {
    final res = await CoreRepositoryService().getAccountDetails(
      context: context,
    );
    if (res['status'] == true && res['data'] != null) {
      await saveAccountDate(data: res['data']);
      saveAccountDate(data: res['data']);
    }
  }
}
