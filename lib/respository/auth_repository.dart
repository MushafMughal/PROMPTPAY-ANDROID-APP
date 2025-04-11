import 'package:flutter/material.dart';
import 'package:prompt_pay/network/api_service.dart';
import 'package:prompt_pay/network/api_urls.dart';

class AuthRepository {
  final network = NetworkApiService();

  Future<dynamic> signupApi({
    required Map<String, dynamic> body,
    required BuildContext context,
  }) async {
    final res = await network.postApi(
      url: AppUrl.signup,
      context: context,
      body: body,
      sendHeaders: false,
      showLoader: true,
      showSnackbar: true,
    );
    if (res != null) {
      return res;
    }
  }

  Future<dynamic> loginApi({
    required Map<String, dynamic> body,
    required BuildContext context,
  }) async {
    final res = await network.postApi(
      url: AppUrl.login,
      context: context,
      body: body,
      sendHeaders: false,
      showLoader: true,
      showSnackbar: true,
    );
    if (res != null) {
      return res;
    }
  }
}
