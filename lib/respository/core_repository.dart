import 'package:flutter/material.dart';
import 'package:prompt_pay/network/api_service.dart';
import 'package:prompt_pay/network/api_urls.dart';

class CoreRepositoryService {
  final network = NetworkApiService();

  Future<dynamic> getCardDetails({
    required BuildContext context,
  }) async {
    final res = await network.getApi(
      url: AppUrl.cardDetails,
      context: context,
      showLoader: false,
      showSnackbar: false,
    );
    if (res != null) {
      return res;
    }
    return null;
  }

  Future<dynamic> getAccountDetails({
    required BuildContext context,
  }) async {
    final res = await network.getApi(
      url: AppUrl.accountDetails,
      context: context,
      showLoader: false,
      showSnackbar: false,
    );
    if (res != null) {
      return res;
    }
    return null;
  }

  Future<dynamic> getPayeesList({
    required BuildContext context,
  }) async {
    final res = await network.getApi(
      url: AppUrl.payeeList,
      context: context,
      showLoader: true,
      showSnackbar: false,
    );
    if (res != null) {
      return res;
    }
    return null;
  }

  Future<dynamic> addPayee({
    required Map<String, dynamic> body,
    required BuildContext context,
  }) async {
    final res = await network.postApi(
      url: AppUrl.addPayee,
      context: context,
      body: body,
      sendHeaders: true,
      showLoader: true,
      showSnackbar: true,
    );
    if (res != null) {
      return res;
    }
  }

  Future<dynamic> updateProfile({
    required Map<String, dynamic> body,
    required BuildContext context,
  }) async {
    final res = await network.postApi(
      url: AppUrl.updateAccount,
      context: context,
      body: body,
      sendHeaders: true,
      showLoader: true,
      showSnackbar: true,
    );
    if (res != null) {
      return res;
    }
  }

  Future<dynamic> sendMoney({
    required Map<String, dynamic> body,
    required BuildContext context,
  }) async {
    final res = await network.postApi(
      url: AppUrl.sendMoney,
      context: context,
      body: body,
      sendHeaders: true,
      showLoader: true,
      showSnackbar: true,
    );
    if (res != null) {
      return res;
    }
  }

  Future<dynamic> verifyOtp({
    required Map<String, dynamic> body,
    required BuildContext context,
  }) async {
    final res = await network.postApi(
      url: AppUrl.verifyOtp,
      context: context,
      body: body,
      sendHeaders: true,
      showLoader: true,
      showSnackbar: true,
    );
    if (res != null) {
      return res;
    }
  }

  Future<dynamic> resendOtp({
    required BuildContext context,
  }) async {
    final res = await network.postApi(
      url: AppUrl.resendOtp,
      context: context,
      sendHeaders: true,
      showLoader: true,
      showSnackbar: true,
    );
    if (res != null) {
      return res;
    }
  }

  Future<dynamic> updateCardLimit({
    required Map<String, dynamic> body,
    required BuildContext context,
  }) async {
    final res = await network.postApi(
      url: AppUrl.updateCard,
      context: context,
      body: body,
      sendHeaders: true,
      showLoader: true,
      showSnackbar: true,
    );
    if (res != null) {
      return res;
    }
  }

  Future<dynamic> getTransactionList({
    required BuildContext context,
  }) async {
    final res = await network.getApi(
      url: AppUrl.transactions,
      context: context,
      showLoader: true,
      showSnackbar: false,
    );
    if (res != null) {
      return res;
    }
    return null;
  }

  Future<dynamic> getTransactionDetailsById({
    required BuildContext context,
    required String id,
  }) async {
    final url = '${AppUrl.transactions}$id';
    final res = await network.getApi(
      url: url,
      context: context,
      showLoader: true,
      showSnackbar: false,
    );
    if (res != null) {
      return res;
    }
    return null;
  }
}
