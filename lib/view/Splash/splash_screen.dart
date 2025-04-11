import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prompt_pay/routes/routes.dart';
import 'package:prompt_pay/storage/storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> changeScreen() async {
    final token = await getDataFromStorage(StorageKey.token);
    await Future.delayed(const Duration(milliseconds: 500));
    await getDataFromStorage(StorageKey.onboardingDone).then(
      (value) async {
        if (value == 'true') {
          if (token != null) {
            // await pc.getAllProjects(context: context);
            Get.offAllNamed(Routes.dashboard);
          } else {
            Get.offAllNamed(Routes.login);
          }
        } else {
          Get.offAllNamed(Routes.onboarding);
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        await Future.delayed(const Duration(milliseconds: 500));
        await changeScreen();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'PromptPay',
          style: TextStyle(
            fontSize: 32.0.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xff1E1E2D),
          ),
          textAlign: TextAlign.center,
        )
            .animate(
              delay: const Duration(milliseconds: 400),
            )
            .flip(
              duration: const Duration(seconds: 1),
            ),
      ),
    );
  }
}
