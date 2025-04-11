import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prompt_pay/respository/core_repository.dart';
import 'package:prompt_pay/widgets/app_snackbar.dart';

class MastercardController extends GetxController {
  Rx cardSpendingLimit = 0.0.obs;
  RxMap<String, dynamic> cardDetails = <String, dynamic>{}.obs;

  saveCardData({required Map<String, dynamic> data}) {
    cardDetails.value = data;
    update();
  }

  saveCardLimit({required dynamic data}) {
    cardSpendingLimit.value = double.parse(data.toString());
    update();
  }

  getCardDetails({required BuildContext context}) async {
    final res = await CoreRepositoryService().getCardDetails(
      context: context,
    );
    if (res['status'] == true && res['data'] != null) {
      saveCardLimit(data: res['data']['card_limit']);
      saveCardData(data: res['data']);
    }
  }

  updateCardLimit({required BuildContext context}) async {
    final res = await CoreRepositoryService().updateCardLimit(
      context: context,
      body: {
        "card_limit": cardSpendingLimit.value.round().toDouble(),
      },
    );
    if (res['status'] == true) {
      appSnackbar(
        'Success',
        'Card limit updated successfully',
      );
      getCardDetails(context: context);
    }
  }
}
