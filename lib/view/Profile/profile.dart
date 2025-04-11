// ignore_for_file: deprecated_member_use
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/route_manager.dart';
import 'package:prompt_pay/routes/routes.dart';
import 'package:prompt_pay/widgets/circle_with_icon.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
                  'Profile',
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
                onTap: () {
                  Get.toNamed(Routes.editProfile);
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    right: 20.w,
                  ),
                  child: CircleWithIcon(
                    radius: 21.r,
                    icon: Transform.flip(
                      flipX: true,
                      child: const Icon(FontAwesomeIcons.edit),
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
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 35.sp,
                      ),
                      20.horizontalSpace,
                      Text(
                        'Ali Khan',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  1.verticalSpace,
                  iconRow(
                    text1: 'Personal Information',
                    iconData: CupertinoIcons.profile_circled,
                    onTap: () {
                      Get.toNamed(Routes.editProfile);
                    },
                  ),
                  iconRow(text1: 'Payment Preferences', iconData: Icons.payment),
                  iconRow(text1: 'Banks and Cards', iconData: FontAwesomeIcons.bank),
                  iconRow(text1: 'Notifications', iconData: Icons.notifications),
                  iconRow(text1: 'Message Center', iconData: Icons.message_outlined),
                  iconRow(text1: 'Address', iconData: Icons.location_on_outlined),
                  iconRow(
                    text1: 'Setting',
                    iconData: Icons.settings,
                    onTap: () {
                      Get.toNamed(Routes.settings);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget iconRow({
  required String text1,
  required IconData iconData,
  bool showLine = true,
  VoidCallback? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      color: Colors.transparent,
      width: 1.sw,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(iconData),
                  10.horizontalSpace,
                  Text(
                    text1,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: const Color(0xffA2A2A7),
                size: 20.sp,
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
