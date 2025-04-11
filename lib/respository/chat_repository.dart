import 'package:flutter/material.dart';
import 'package:prompt_pay/network/api_service.dart';
import 'package:prompt_pay/network/api_urls.dart';

class ChatRepository {
  final network = NetworkApiService();

  Future<dynamic> sendNormalMessage({
    required Map<String, dynamic> body,
    required BuildContext context,
  }) async {
    final res = await network.postApi(
      url: AppUrl.normalChatbot,
      context: context,
      body: body,
      sendHeaders: true,
      showLoader: false,
      showSnackbar: false,
    );
    if (res != null) {
      return res;
    }
  }

  Future<dynamic> sendPromptPayMessage({
    required Map<String, dynamic> body,
    required BuildContext context,
    String? route,
  }) async {
    if (route != null) {
      route = route.replaceAll(' ', '-');
    }
    final url = '${AppUrl.promptPayChatbot}${route ?? 'router'}/';
    final res = await network.postApi(
      url: url,
      context: context,
      body: body,
      sendHeaders: true,
      showLoader: false,
      showSnackbar: false,
    );
    if (res != null) {
      return res;
    }
  }
}
