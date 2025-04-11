import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prompt_pay/respository/core_repository.dart';

class DashboardController extends GetxController {
  RxMap<String, dynamic> cardDetails = <String, dynamic>{}.obs;
  final Rx<int> _selectedIndex = 0.obs;
  int get selectedIndex => _selectedIndex.value;
  set selectedIndex(int index) {
    _selectedIndex.value = index;
  }

  void changeIndex(int index) {
    _selectedIndex.value = index;
  }

  void resetIndex() {
    _selectedIndex.value = 0;
    update();
  }

  saveCardDate({required Map<String, dynamic> data}) {
    cardDetails.value = data;
    update();
  }

  getCardDetails({required BuildContext context}) async {
    final res = await CoreRepositoryService().getCardDetails(
      context: context,
    );
    if (res['status'] == true && res['data'] != null) {
      await saveCardDate(data: res['data']);
      saveCardDate(data: res['data']);
      // await setDataToStorage(StorageKey.token, res['data']['access']);
      // appSnackbar(
      //   'Success',
      //   res['message'],
      // );
      // Get.offAllNamed(Routes.dashboard);
    }
  }
}
