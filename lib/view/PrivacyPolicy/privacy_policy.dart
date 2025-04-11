import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

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
        title: Container(
          margin: EdgeInsets.only(left: 20.w, top: 20.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => Get.back(),
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
              Text(
                'Privacy Policy',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff1E1E2D),
                ),
              ),
              SizedBox(width: 64.w),
            ],
          ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Privacy Policy",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Last updated: March 22, 2025",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Introduction",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "We value your privacy and are committed to protecting your personal information. This privacy policy explains how we collect, use, and disclose information when you use our mobile application.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                "Information We Collect",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "1. Personal Information: When you use our app, we may collect personal information such as your name, email address, and contact details.\n"
                "2. Usage Information: We collect information about how you use our app, including your interactions with the app, log files, and analytics data.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                "How We Use Information",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "1. To provide and maintain our service.\n"
                "2. To improve user experience and enhance app features.\n"
                "3. To communicate with you, such as sending updates and promotional offers.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                "Sharing Your Information",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "We do not share your personal information with third parties, except in the following circumstances:\n"
                "1. When required by law or government authorities.\n"
                "2. To protect our rights and prevent fraud.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                "Your Choices",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "You have the right to access, update, or delete your personal information. You can contact us if you have any concerns regarding your privacy.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                "Contact Us",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "If you have any questions or concerns about this privacy policy, feel free to contact us at support@promtpay.com.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
