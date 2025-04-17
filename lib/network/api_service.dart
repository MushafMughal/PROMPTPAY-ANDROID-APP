// ignore_for_file: use_build_context_synchronously
import 'dart:async';
import 'dart:convert';
import 'package:prompt_pay/storage/storage.dart';
import 'package:prompt_pay/widgets/api_loader.dart';
import 'package:prompt_pay/widgets/app_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class NetworkApiService {
  Future<dynamic> postApi({
    required String url,
    required BuildContext context,
    Map<String, dynamic>? body,
    bool showSnackbar = false,
    bool showLoader = false,
    bool sendHeaders = false,
  }) async {
    final token = await getDataFromStorage(StorageKey.token);
    dynamic responseJson;
    try {
      if (showLoader) {
        dialogApiLoader(context: context);
      }
      final headers = {
        "Content-Type": "application/json",
        if (sendHeaders) 'Authorization': 'Bearer ${token!}',
      };
      final response = body != null
          ? await http.post(
              Uri.parse(url),
              headers: headers,
              body: jsonEncode(body),
            )
          : await http.post(
              Uri.parse(url),
              headers: headers,
            );
      if (showLoader) {
        Get.close(1);
      }
      responseJson =
          showSnackbar ? returnResponse(response) : jsonDecode(response.body);
    } catch (e) {
      if (showLoader) {
        Get.close(1);
      }
      appSnackbar(
        'Error',
        '$e',
      );
    }
    return responseJson;
  }

  Future<dynamic> getApi({
    required String url,
    required BuildContext context,
    bool showSnackbar = false,
    bool showLoader = false,
  }) async {
    final token = await getDataFromStorage(StorageKey.token);
    dynamic responseJson;
    try {
      if (showLoader) {
        dialogApiLoader(context: context);
      }
      final headers = {
        "Content-Type": "application/json",
        'Authorization': token != null ? 'Bearer $token' : '',
      };
      final response = token != null
          ? await http.get(
              Uri.parse(
                url,
              ),
              headers: headers,
            )
          : await http.get(
              Uri.parse(
                url,
              ),
            );
      if (showLoader) {
        Get.close(1);
      }
      responseJson =
          showSnackbar ? returnResponse(response) : jsonDecode(response.body);
    } catch (e) {
      if (showLoader) {
        Get.close(1);
      }
      appSnackbar(
        'Error',
        '$e',
      );
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      dynamic jsonResponse = jsonDecode(response.body);
      // appSnackbar(
      //   'Success',
      //   jsonResponse['message'],
      // );
      return jsonResponse;
    } else {
      dynamic jsonResponse = jsonDecode(response.body);
      appSnackbar(
        'Error',
        jsonResponse['message'],
      );
      return jsonResponse;
    }
  }
}
