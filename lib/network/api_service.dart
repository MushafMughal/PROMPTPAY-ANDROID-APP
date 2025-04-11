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

  Future<dynamic> multipartApi({
    required String url,
    required BuildContext context,
    dynamic body,
    bool showSnackbar = false,
    bool showLoader = false,
    bool sendHeaders = false,
    dynamic file,
  }) async {
    final token = await getDataFromStorage(StorageKey.token);
    dynamic responseJson;
    try {
      if (showLoader) {
        dialogApiLoader(context: context);
      }
      final headers = {
        if (sendHeaders) 'Authorization': 'Bearer ${token!}',
      };
      final request = http.MultipartRequest('PUT', Uri.parse(url));
      request.fields.addAll(body);
      if (file != null) {
        var multipartFile = await http.MultipartFile.fromPath(
          'image',
          file.path,
          filename: file.path.split('/').last,
          // contentType: MediaType(mimeType!.split('/')[0], "${file.path.split('.').last}"),
        );
        request.files.add(multipartFile);
      }
      request.headers.addAll(headers);
      var response = await request.send();
      var responsed = await http.Response.fromStream(response);
      if (showLoader) {
        Get.close(1);
      }
      responseJson =
          showSnackbar ? returnResponse(responsed) : jsonDecode(responsed.body);
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

  Future<dynamic> patchApi({
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
          ? await http.patch(
              Uri.parse(url),
              headers: headers,
              body: jsonEncode(body),
            )
          : await http.patch(
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
