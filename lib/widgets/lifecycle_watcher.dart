import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prompt_pay/routes/routes.dart';
import 'package:prompt_pay/storage/storage.dart';

class LifecycleWatcher extends StatefulWidget {
  final Widget child;

  const LifecycleWatcher({super.key, required this.child});

  @override
  State<LifecycleWatcher> createState() => _LifecycleWatcherState();
}

class _LifecycleWatcherState extends State<LifecycleWatcher>
    with WidgetsBindingObserver {
  Timer? _backgroundTimer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _backgroundTimer?.cancel();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.inactive) {
      await setDataToStorage(
          'last_active_time', DateTime.now().millisecondsSinceEpoch.toString());

      // Cancel any existing timer first
      _backgroundTimer?.cancel();

      // Start a new timer
      _backgroundTimer = Timer(
        const Duration(minutes: 5),
        () async {
          debugPrint("App in background for 5 minutes, logging out.");
          await deleteDataFromStorage(StorageKey.token);
          await deleteDataFromStorage(StorageKey.refreshToken);
          Get.offAllNamed(Routes.login);
        },
      );
    } else if (state == AppLifecycleState.resumed) {
      // App is back in foreground, cancel timer
      if (_backgroundTimer != null && _backgroundTimer!.isActive) {
        _backgroundTimer?.cancel();
        debugPrint("App resumed, background timer cancelled.");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
