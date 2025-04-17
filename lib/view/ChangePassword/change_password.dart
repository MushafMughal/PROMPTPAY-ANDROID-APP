import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prompt_pay/view/Login/login.dart';
import 'package:prompt_pay/view/Onboarding/onboarding.dart';
import 'package:prompt_pay/viewModel/controllers/login_controller.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final loginController = Get.put(LoginController());
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kTextTabBarHeight + 25.h,
        leadingWidth: 0.w,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        title: GestureDetector(
          onTap: () => Get.back(),
          child: Container(
            margin: EdgeInsets.only(left: 20.w, top: 20.h),
            child: CircleAvatar(
              radius: 21.h,
              backgroundColor: const Color(0xffF4F4F4),
              child: Icon(
                Icons.arrow_back_ios_new,
                size: 18.h,
                color: const Color(0xff1E1E2D),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 52.h),
            Text(
              'Change Password',
              style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 38.h),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Obx(
                      () => CustomTextFieldWithlabel(
                        label: 'Current Password',
                        hintText: 'Current Password',
                        obscureText: !loginController.showPassword.value,
                        prefixIconPath: 'assets/pngs/password_icon.png',
                        controller: currentPasswordController,
                        suffixIcon: IconButton(
                          onPressed: () {
                            loginController.toggleCurrentPassword();
                          },
                          icon: Icon(
                            loginController.currentPassword.value
                                ? Icons.remove_red_eye
                                : Icons.remove_red_eye_outlined,
                            color: const Color(0xffA2A2A7),
                            weight: 0.2,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40.h),
                    Obx(
                      () => CustomTextFieldWithlabel(
                        label: 'New Password',
                        hintText: 'New Password',
                        obscureText: !loginController.showPassword.value,
                        prefixIconPath: 'assets/pngs/password_icon.png',
                        controller: newPasswordController,
                        suffixIcon: IconButton(
                          onPressed: () {
                            loginController.toggleNewPassword1();
                          },
                          icon: Icon(
                            loginController.newPassword1.value
                                ? Icons.remove_red_eye
                                : Icons.remove_red_eye_outlined,
                            color: const Color(0xffA2A2A7),
                            weight: 0.2,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40.h),
                    Obx(
                      () => CustomTextFieldWithlabel(
                        label: 'Confirm Password',
                        hintText: 'Confirm Password',
                        obscureText: !loginController.showPassword.value,
                        prefixIconPath: 'assets/pngs/password_icon.png',
                        controller: confirmPasswordController,
                        suffixIcon: IconButton(
                          onPressed: () {
                            loginController.toggleNewPassword2();
                          },
                          icon: Icon(
                            loginController.newPassword2.value
                                ? Icons.remove_red_eye
                                : Icons.remove_red_eye_outlined,
                            color: const Color(0xffA2A2A7),
                            weight: 0.2,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40.h),
                    CustomButton(
                      onTap: () async {
                        final res = await loginController.updatePassword(
                          context: context,
                          body: {
                            'current password': currentPasswordController.text,
                            'new password': newPasswordController.text,
                            'confirm password': confirmPasswordController.text,
                          },
                        );
                        if (res?['status'] ?? false) {
                          currentPasswordController.clear();
                          newPasswordController.clear();
                          confirmPasswordController.clear();
                          setState(() {});
                        }
                      },
                      text: 'Change Password',
                    ),
                    SizedBox(height: 30.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
