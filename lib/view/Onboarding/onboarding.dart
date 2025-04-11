import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prompt_pay/viewModel/controllers/onboarding_controller.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  // @override
  // void dispose() {
  //   SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
  //       overlays: SystemUiOverlay.values);
  //   super.dispose();
  // }

  final onboardingController = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Obx(() {
          return Column(
            children: [
              SizedBox(height: 70.h),
              Image.asset(
                onboardingController
                    .images[onboardingController.currentIndex.value],
                height: 340.h,
              ),
              SizedBox(
                height: 26.h,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  3,
                  (index) => CustomDotIndicator(
                      isSelected:
                          index == onboardingController.currentIndex.value),
                ),
              ),
              SizedBox(
                height: 36.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Column(
                  children: [
                    Text(
                      onboardingController
                          .titles[onboardingController.currentIndex.value],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 26.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff1E1E2D),
                      ),
                    ),
                    SizedBox(height: 14.h),
                    SizedBox(
                      height: 60.h,
                      child: Text(
                        textAlign: TextAlign.center,
                        onboardingController.descriptions[
                            onboardingController.currentIndex.value],
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff7E848D),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 48.h),
              CustomButton(
                onTap: () {
                  onboardingController.nextPage();
                },
                text: 'Next',
              ),

              // Image.asset(
              //   'assets/pngs/onboardingSecond.png',
              // ),
              // Image.asset(
              //   'assets/pngs/onboardingThird.png',
              // )
            ],
          );
        }),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.text,
    this.isDisabled = false,
  });

  final VoidCallback onTap;
  final String text;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isDisabled ? null : onTap,
      child: Container(
        height: 50.h,
        width: double.maxFinite,
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
          color: isDisabled
              ? const Color.fromARGB(255, 233, 228, 228)
              : const Color(0xff0066FF),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomDotIndicator extends StatelessWidget {
  const CustomDotIndicator({
    super.key,
    required this.isSelected,
  });
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8.w),
      height: 6.h,
      width: isSelected ? 19.w : 6.h,
      decoration: BoxDecoration(
        shape: isSelected ? BoxShape.rectangle : BoxShape.circle,
        borderRadius: isSelected ? BorderRadius.circular(10.r) : null,
        color:
            const Color(0xff0066FF).withValues(alpha: isSelected ? 1.0 : 0.2),
      ),
    );
  }
}
