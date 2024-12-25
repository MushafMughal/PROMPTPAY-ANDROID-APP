import 'package:flutter/material.dart';
import 'package:prompt_pay_fyp/features/Chat/model/chat_model.dart';

class ChatProvider extends ChangeNotifier {
  final List<ChatModel> _messages = List.empty(growable: true);

  final FocusNode _focusNode = FocusNode();
  get focusNode => _focusNode;

  final TextEditingController _controller = TextEditingController();
  get controller => _controller;
  void updateController(String text) {
    _controller.text = text;
    notifyListeners();
  }

  void resetController() {
    _controller.clear();
    notifyListeners();
  }

  void clearFocus() {
    _focusNode.unfocus();
    notifyListeners();
  }

  //request focus
  void requestFocus() {
    _focusNode.requestFocus();
    notifyListeners();
  }

  set addMessage(ChatModel message) {
    _messages.add(message);
    notifyListeners();
  }

  List<ChatModel> get messages => _messages;
  void clearMessages() {
    _messages.clear();
    notifyListeners();
  }
}
