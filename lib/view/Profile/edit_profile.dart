// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prompt_pay/view/Login/login.dart';
import 'package:prompt_pay/view/Onboarding/onboarding.dart';
import 'package:prompt_pay/viewModel/controllers/account_controller.dart';
import 'package:prompt_pay/viewModel/controllers/profile_controller.dart';
import 'package:prompt_pay/widgets/circle_with_icon.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final pc = Get.put(ProfileController());
  final accountController = Get.put(AccountController());
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    userNameController = TextEditingController(
      text: accountController.accountDetails['username'] ?? '',
    );
    emailController = TextEditingController(
      text: accountController.accountDetails['email'] ?? '',
    );
    phoneController = TextEditingController(
      text: accountController.accountDetails['phone_number'] ?? '',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            automaticallyImplyLeading: false,
            toolbarHeight: kTextTabBarHeight + 30.h,
            title: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: CircleWithIcon(
                    icon: const Icon(Icons.arrow_back_ios_new),
                    radius: 21.r,
                  ),
                ),
                const Spacer(),
                Text(
                  'Personal Information',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff1E1E2D),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 20.h,
                children: [
                  GetBuilder<ProfileController>(
                    builder: (pc) {
                      return Stack(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: pc.profileImage != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(100.r),
                                    child: Image.file(
                                      pc.profileImage!,
                                      width: 140.w,
                                      height: 140.h,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : SizedBox(
                                    width: 140.w,
                                    height: 140.h,
                                    child: CircleAvatar(
                                      radius: 50.sp,
                                      backgroundColor: const Color(0xffF4F4F4),
                                      child: Icon(
                                        Icons.person,
                                        color: const Color(0xff1E1E2D),
                                        size: 80.sp,
                                      ),
                                    ),
                                  ),
                          ),
                          // Positioned(
                          //   bottom: 0,
                          //   right: 0,
                          //   child: GestureDetector(
                          //     onTap: () {
                          //       pc.pickProfileImage();
                          //     },
                          //     child: Container(
                          //       decoration: BoxDecoration(
                          //         shape: BoxShape.circle,
                          //         boxShadow: [
                          //           BoxShadow(
                          //             color: Colors.black.withOpacity(0.2),
                          //             blurRadius: 5,
                          //             spreadRadius: 1,
                          //             offset: const Offset(0, -3),
                          //           ),
                          //         ],
                          //       ),
                          //       child: SvgPicture.asset(
                          //         'assets/svgs/camera.svg',
                          //       ),
                          //     ),
                          //   ),
                          // )
                        ],
                      );
                    },
                  ),
                  20.verticalSpace,
                  CustomTextFieldWithlabel(
                    label: 'Usrname',
                    hintText:
                        accountController.accountDetails['username'] ?? '',
                    obscureText: false,
                    controller: userNameController,
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  CustomTextFieldWithlabel(
                    label: 'Phone Number',
                    hintText:
                        accountController.accountDetails['phone_number'] ?? '',
                    obscureText: false,
                    controller: phoneController,
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  CustomTextFieldWithlabel(
                    label: 'Email Address',
                    hintText: accountController.accountDetails['email'] ?? '',
                    obscureText: false,
                    controller: emailController,
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  if (userNameController.text.trim() !=
                          accountController.accountDetails['name']
                              .toString()
                              .trim() ||
                      emailController.text.trim() !=
                          accountController.accountDetails['email']
                              .toString()
                              .trim() ||
                      phoneController.text.trim() !=
                          accountController.accountDetails['phone_number']
                              .toString()
                              .trim())
                    CustomButton(
                      onTap: () {
                        accountController.accountDetails['name'] =
                            userNameController.text.trim();
                        accountController.accountDetails['email'] =
                            emailController.text.trim();
                        accountController.accountDetails['phone_number'] =
                            phoneController.text.trim();

                        accountController.updateProfile(
                          body: {
                            'username': userNameController.text.trim(),
                            'email': emailController.text.trim(),
                            'phone number': phoneController.text.trim()
                          },
                          context: context,
                        );
                        // pc.updateProfile();
                      },
                      text: 'Save Changes',
                    ),
                  // CustomButton(
                  //   onTap: () {},
                  //   text: 'Edit Profile',
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
