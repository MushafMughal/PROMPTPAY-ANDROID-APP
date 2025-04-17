import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prompt_pay/routes/routes.dart';
import 'package:prompt_pay/storage/storage.dart';
import 'package:prompt_pay/viewModel/controllers/dashboard_controller.dart';
import 'package:prompt_pay/viewModel/controllers/logout_controller.dart';
import 'package:prompt_pay/viewModel/controllers/setting_controller.dart';
import 'package:prompt_pay/widgets/circle_with_icon.dart';

class SettingsScreens extends StatefulWidget {
  const SettingsScreens({super.key});

  @override
  State<SettingsScreens> createState() => _SettingsScreensState();
}

class _SettingsScreensState extends State<SettingsScreens> {
  final sc = Get.put(SettingController());
  final dashboardController = Get.put(DashboardController());

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
                    dashboardController.resetIndex();
                  },
                  child: CircleWithIcon(
                    icon: const Icon(Icons.arrow_back_ios_new),
                    radius: 21.r,
                  ),
                ),
                const Spacer(),
                Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff1E1E2D),
                  ),
                ),
                const Spacer(),
              ],
            ),
            actions: [
              GestureDetector(
                onTap: () async {
                  // await deleteDataFromStorage(StorageKey.token);
                  final logoutController = Get.put(LogoutController());
                  await logoutController.onLogout(context: context);
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    right: 20.w,
                  ),
                  child: CircleWithIcon(
                    radius: 21.r,
                    icon: Transform.flip(
                      flipX: true,
                      child: const Icon(Icons.logout),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 20.h,
                children: [
                  Text(
                    'General',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xffA2A2A7),
                    ),
                  ),
                  iconRow(
                    text1: 'Language',
                    text2: 'Engish',
                    onTap: () {
                      Get.defaultDialog(
                        backgroundColor: Colors.white,
                        title: 'Select Language',
                        content: Column(
                          children: [
                            ListTile(
                              title: const Text('English'),
                              onTap: () => Get.back(),
                              trailing: const Icon(Icons.arrow_forward_ios),
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Get.back(),
                            child: const Text('Cancel'),
                          ),
                        ],
                      );
                    },
                  ),
                  iconRow(
                      text1: 'Personal Information',
                      onTap: () => Get.toNamed(Routes.editProfile)),
                  iconRow(text1: 'Contact Us'),
                  Text(
                    'Security',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xffA2A2A7),
                    ),
                  ),
                  iconRow(
                    text1: 'Change Password',
                    onTap: () => Get.toNamed(Routes.changePassword),
                  ),
                  iconRow(
                      text1: 'Privacy Policy',
                      onTap: () => Get.toNamed(Routes.privacyPolicy)),
                  Text(
                    'Choose what data you share with us',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xffA2A2A7),
                    ),
                  ),
                  iconRow(
                    text1: 'Biometric',
                    showSwitch: true,
                    showLine: false,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget iconRow({
    required String text1,
    String text2 = '',
    bool showSwitch = false,
    bool showLine = true,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap ??
          () {
            Get.showSnackbar(
              const GetSnackBar(
                snackPosition: SnackPosition.TOP,
                message: 'This feature will be available soon',
                duration: Duration(seconds: 2),
                backgroundColor: Color(0xff0066FF),
              ),
            );
          },
      child: Container(
        color: Colors.transparent,
        width: 1.sw,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text1,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                showSwitch == true
                    ? Obx(
                        () => Transform.scale(
                          scale: 0.7,
                          child: CupertinoSwitch(
                            value: sc.switchValue.value,
                            activeTrackColor: const Color(0xff0066FF),
                            onChanged: (value) {
                              // sc.updateValue(value);
                              Get.showSnackbar(
                                const GetSnackBar(
                                  snackPosition: SnackPosition.TOP,
                                  message:
                                      'This feature will be available soon',
                                  duration: Duration(seconds: 2),
                                  backgroundColor: Color(0xff0066FF),
                                ),
                              );
                            },
                          ),
                        ),
                      )
                    : Row(
                        children: [
                          Text(
                            text2,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xffA2A2A7),
                            ),
                          ),
                          10.horizontalSpace,
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: const Color(0xffA2A2A7),
                            size: 20.sp,
                          )
                        ],
                      )
              ],
            ),
            if (showLine)
              Column(
                children: [
                  4.verticalSpace,
                  const Divider(
                    color: Color(0xffF4F4F4),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
