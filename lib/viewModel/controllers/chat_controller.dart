import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prompt_pay/models/chat_model.dart';
import 'package:prompt_pay/respository/chat_repository.dart';

class ChatController extends GetxController {
  // Use RxList for observables in GetX
  final RxList<ChatModel> _messages = <ChatModel>[].obs;

  final RxBool _isPromptPay = false.obs;
  RxBool get isPromptPay => _isPromptPay;
  final RxString _route = ''.obs;
  RxString get route => _route;
  Map<String, dynamic> _data = <String, dynamic>{};
  Map<String, dynamic> get data => _data;
  //scrollController
  ScrollController scrollController = ScrollController();

  void togglePromptPay() {
    _isPromptPay.value = !_isPromptPay.value;
    update();
  }

  // Observables for FocusNode and TextEditingController

  final Rx<TextEditingController> _controller = TextEditingController().obs;
  Rx<TextEditingController> get controller => _controller;

  // Method to update text controller
  void updateController(String text) {
    _controller.value.text = text;
    update(); // Trigger a UI update
  }

  // Method to reset text controller
  void resetController() {
    _controller.value.clear();
    update(); // Trigger a UI update
  }

  // Method to add a message
  void addMessage(ChatModel message) {
    _messages.add(message);
    update();
  }

  // Method to get the list of messages
  List<ChatModel> get messages => _messages;

  // Method to clear all messages
  void clearMessages() {
    _messages.clear();
    update();
  }

  @override
  void onClose() {
    _controller.value.dispose();
    super.onClose();
  }

  onSendNormalMessage({
    required BuildContext context,
  }) async {
    if (_controller.value.text.isEmpty) return;
    final text = _controller.value.text.trim();
    addMessage(
      ChatModel(
        message: text,
        isSender: false,
      ),
    );

    _controller.value.clear();
    addMessage(
      const ChatModel(
        message: '...',
        isSender: true,
      ),
    );
    final res = await ChatRepository().sendNormalMessage(
      context: context,
      body: {
        'user_input': text,
      },
    );
    _messages.removeLast();
    if (res['status'] == true && res['message'] != null) {
      addMessage(
        ChatModel(
          message: res['message'],
          isSender: true,
        ),
      );
    }
  }

  onSendPromptPayMessage({
    required BuildContext context,
  }) async {
    if (_controller.value.text.isEmpty) return;
    final text = _controller.value.text.trim();
    addMessage(
      ChatModel(
        message: text,
        isSender: false,
      ),
    );

    _controller.value.clear();
    addMessage(
      const ChatModel(
        message: '...',
        isSender: true,
      ),
    );
    final res = await ChatRepository().sendPromptPayMessage(
      context: context,
      body: {
        'user_input': text,
      },
    );
    _messages.removeLast();
    if (res['status'] == true && res['message'] != null) {
      if (res['data'] != null && res['next'] != null) {
        _data = res['data'];
        _route.value = res['next'];
      }
      addMessage(
        ChatModel(
          message: res['message'],
          isSender: true,
        ),
      );
    }
  }

  onSendPromptPayMessageWithRoute({
    required BuildContext context,
  }) async {
    if (_controller.value.text.isEmpty) return;
    final text = _controller.value.text.trim();
    addMessage(
      ChatModel(
        message: text,
        isSender: false,
      ),
    );

    _controller.value.clear();
    addMessage(
      const ChatModel(
        message: '...',
        isSender: true,
      ),
    );
    final userInput = <String, dynamic>{'user_input': text};
    _data.removeWhere((key, value) => key == 'user_input');
    _data.addEntries(userInput.entries);
    final res = await ChatRepository().sendPromptPayMessage(
      context: context,
      route: _data['next'] == 'complete'
          ? _route.value.isEmpty
              ? null
              : _route.value
          : _data['next'],
      // body: {
      //   'user_input': text,
      // },
      body: _data,
    );
    _messages.removeLast();
    if (res['status'] == true && res['message'] != null) {
      _data = res;
      if (res['next'] != 'complete') {
        _route.value = res['next'] ?? '';
      }

      addMessage(
        ChatModel(
          message: res['message'],
          isSender: true,
        ),
      );
    }
  }
}
