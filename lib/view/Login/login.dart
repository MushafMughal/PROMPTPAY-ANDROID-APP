import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prompt_pay/routes/routes.dart';
import 'package:prompt_pay/view/Onboarding/onboarding.dart';
import 'package:prompt_pay/viewModel/controllers/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginController = Get.put(LoginController());
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
              'Log In',
              style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 38.h),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomTextFieldWithlabel(
                      label: 'Username',
                      controller: loginController.usernameController.value,
                      hintText: 'Username',
                      obscureText: false,
                      prefixIconPath: 'assets/pngs/email_icon.png',
                    ),
                    SizedBox(height: 20.h),
                    Obx(
                      () => CustomTextFieldWithlabel(
                        label: 'Password',
                        hintText: 'Password',
                        controller: loginController.passwordController.value,
                        obscureText: loginController.showPassword.value,
                        prefixIconPath: 'assets/pngs/password_icon.png',
                        suffixIcon: IconButton(
                          onPressed: () {
                            loginController.toggleShowPassword();
                          },
                          icon: Icon(
                            loginController.showPassword.value
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
                        await loginController.onLogin(context: context);
                        // Get.offAllNamed(Routes.dashboard);
                      },
                      text: 'Login',
                    ),
                    SizedBox(height: 30.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Dont have an account?',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xffA2A2A7),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // Get.toNamed(Routes.signup);
                            Get.offNamed(Routes.signup);
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff0066FF),
                            ),
                          ),
                        ),
                      ],
                    ),
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

class CustomTextFieldWithlabel extends StatelessWidget {
  const CustomTextFieldWithlabel({
    super.key,
    required this.label,
    this.controller,
    required this.hintText,
    required this.obscureText,
    this.prefixIconPath = '',
    this.suffixIcon,
    this.ontap,
    this.isEnabled = true,
  });
  final String label;
  final TextEditingController? controller;
  final String hintText;
  final bool obscureText;
  final String prefixIconPath;
  final Widget? suffixIcon;
  final VoidCallback? ontap;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: const Color(0xffA2A2A7),
          ),
        ),
        SizedBox(
          height: 38.h,
          child: TextField(
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: isEnabled ? const Color(0xff1E1E2D) : Colors.black54,
            ),
            enabled: isEnabled,
            onTap: ontap,
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              suffixIcon: suffixIcon,
              contentPadding: EdgeInsets.only(top: 4.h),
              prefixIcon:
                  prefixIconPath == '' ? null : Image.asset(prefixIconPath),
              hintText: hintText,
              hintStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xffA2A2A7),
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xffA2A2A7),
                  width: 1.0,
                ),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xff0066FF),
                  width: 1.0,
                ),
              ),
              disabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xffA2A2A7),
                  width: 1.0,
                ),
              ),
            ),
            cursorColor: const Color(0xff0066FF),
            keyboardType: TextInputType.emailAddress,
          ),
        )
      ],
    );
  }
}
