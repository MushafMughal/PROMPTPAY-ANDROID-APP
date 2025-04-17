import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prompt_pay/routes/routes.dart';
import 'package:prompt_pay/view/Login/login.dart';
import 'package:prompt_pay/view/Onboarding/onboarding.dart';
import 'package:prompt_pay/viewModel/controllers/signup_controller.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final sc = Get.put(SignupController());
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
        // title: GestureDetector(
        //   onTap: () => Get.back(),
        //   child: Container(
        //     margin: EdgeInsets.only(left: 20.w, top: 20.h),
        //     child: CircleAvatar(
        //       radius: 21.h,
        //       backgroundColor: const Color(0xffF4F4F4),
        //       child: Icon(
        //         Icons.arrow_back_ios_new,
        //         size: 18.h,
        //         color: const Color(0xff1E1E2D),
        //       ),
        //     ),
        //   ),
        // ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Obx(
            //   () {
            //     return Animate(
            //       effects: [
            //         if (loginController.swipeUp.value)
            //           SlideEffect(
            //             duration: const Duration(milliseconds: 300),
            //             begin: const Offset(0, 0),
            //             end: Offset(0, -4.h),
            //             curve: Curves.easeOut,
            //           ),
            //         if (loginController.swipeUp.value)
            //           const FadeEffect(
            //             duration: Duration(milliseconds: 300),
            //             begin: 1,
            //             end: 0,
            //             curve: Curves.easeIn,
            //           ),
            //       ],
            //       child: Column(
            //         children: [
            //           Center(
            //             child: GestureDetector(
            //               onLongPressUp: () {
            //                 loginController.setSwipeUp(true);
            //               },
            //               child: Container(
            //                 height: 60.h,
            //                 width: 60.w,
            //                 decoration: BoxDecoration(
            //                   color: const Color(0xff0066FF),
            //                   shape: BoxShape.circle,
            //                   boxShadow: [
            //                     BoxShadow(
            //                       color: const Color(0xff000040)
            //                           .withValues(alpha: 0.25),
            //                       offset: const Offset(0, 4.0),
            //                       blurRadius: 7.0,
            //                     ),
            //                   ],
            //                 ),
            //                 child: Icon(
            //                   Icons.arrow_upward_rounded,
            //                   size: 34.sp,
            //                   color: Colors.white,
            //                 ),
            //               ),
            //             ),
            //           ),
            //           SizedBox(height: 36.h),
            //           Text(
            //             'Swipe up to Log In ',
            //             style: TextStyle(
            //               fontSize: 20.sp,
            //               fontWeight: FontWeight.w500,
            //               color: Colors.black,
            //             ),
            //           ),
            //         ],
            //       ),
            //     );
            //   },
            // ),
            SizedBox(height: 24.h),
            Text(
              'Sign Up',
              style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 18.h),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomTextFieldWithlabel(
                      label: 'Full Name',
                      controller: sc.nameController.value,
                      hintText: 'John Smith',
                      obscureText: false,
                      prefixIconPath: 'assets/pngs/email_icon.png',
                    ),
                    SizedBox(height: 20.h),
                    CustomTextFieldWithlabel(
                      label: 'Username',
                      controller: sc.usernameController.value,
                      hintText: 'johnsmith',
                      obscureText: false,
                      prefixIconPath: 'assets/pngs/email_icon.png',
                    ),
                    SizedBox(height: 20.h),
                    CustomTextFieldWithlabel(
                      label: 'Email Address',
                      controller: sc.emailController.value,
                      hintText: 'johnsmith@example.com',
                      obscureText: false,
                      prefixIconPath: 'assets/pngs/email_icon.png',
                    ),
                    SizedBox(height: 20.h),
                    CustomTextFieldWithlabel(
                      label: 'Cnic Number',
                      controller: sc.cnicController.value,
                      hintText: '1234512345671',
                      obscureText: false,
                      prefixIconPath: 'assets/pngs/email_icon.png',
                    ),
                    SizedBox(height: 20.h),
                    CustomTextFieldWithlabel(
                      label: 'Phone Number',
                      controller: sc.phoneController.value,
                      hintText: '+92xxxxxxxxxx',
                      obscureText: false,
                      prefixIconPath: 'assets/pngs/email_icon.png',
                    ),
                    SizedBox(height: 20.h),
                    CustomTextFieldWithlabel(
                      ontap: () {
                        DatePickerDialog(
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                      },
                      label: 'Date of Birth',
                      controller: sc.dobController.value,
                      hintText: 'yyyy-mm-dd',
                      obscureText: false,
                      prefixIconPath: 'assets/pngs/email_icon.png',
                    ),
                    SizedBox(height: 20.h),
                    Obx(
                      () => CustomTextFieldWithlabel(
                        label: 'Password',
                        hintText: 'Password',
                        controller: sc.passwordController.value,
                        obscureText: !sc.showPassword.value,
                        prefixIconPath: 'assets/pngs/password_icon.png',
                        suffixIcon: IconButton(
                          onPressed: () {
                            sc.toggleShowPassword();
                          },
                          icon: Icon(
                            sc.showPassword.value
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
                        await sc.onSignup(context: context);
                        // Get.offAllNamed(Routes.dashboard);
                      },
                      text: 'Sign Up',
                    ),
                    SizedBox(height: 30.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xffA2A2A7),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // Get.toNamed(Routes.login);
                            Get.offNamed(Routes.login);
                          },
                          child: Text(
                            'Log In',
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
