import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prompt_pay/routes/routes.dart';
import 'package:prompt_pay/utils/helper.dart';
import 'package:prompt_pay/viewModel/controllers/account_controller.dart';
import 'package:prompt_pay/widgets/circle_with_icon.dart';
import 'package:prompt_pay/widgets/custom_master_card.dart';
import 'package:prompt_pay/widgets/transaction_history_widget.dart';
import 'package:share_plus/share_plus.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final accountController = Get.find<AccountController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: kTextTabBarHeight + 30.h,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.0.w, top: 10.h),
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.editProfile);
                },
                child: CircleAvatar(
                  radius: 21.r,
                  backgroundColor: const Color(0xffF4F4F4),
                  child: const Icon(
                    Icons.person,
                    color: Color(0xff1E1E2D),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Welcome back,',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xffA2A2A7),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Obx(
                    () => Text(
                      accountController.accountDetails['name'] != null
                          ? '${accountController.accountDetails['name']}'
                          : '',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff1E1E2D),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w, top: 10.h),
            child: GestureDetector(
              onTap: () => Get.toNamed(Routes.chat),
              child: CircleAvatar(
                radius: 21.r,
                backgroundColor: const Color(0xffF4F4F4),
                child: Image.asset(
                  'assets/pngs/ai_robot_icon.png',
                ),
              ),
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async => Helper.onRefresh(context: context),
        child: SingleChildScrollView(
          child: SizedBox(
            height: 0.8.sh,
            child: Stack(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          const CustomMasterCard(),
                          SizedBox(height: 20.h),
                          Row(
                            children: [
                              Column(
                                children: [
                                  CircleWithIcon(
                                    icon: const Icon(
                                      Icons.arrow_upward_outlined,
                                      color: Color(0xff1E1E2D),
                                    ),
                                    onTap: () {
                                      Get.toNamed(Routes.sendMoney);
                                    },
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    'Sent',
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff1E1E2D),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 20.w),
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.defaultDialog(
                                        titlePadding: EdgeInsets.only(
                                          top: 20.h,
                                          left: 20.w,
                                          right: 20.w,
                                        ),
                                        contentPadding: EdgeInsets.only(
                                          top: 10.h,
                                          bottom: 20.h,
                                        ),
                                        backgroundColor: Colors.white,
                                        title: 'Your Bank Details',
                                        // middleText: 'Mushaf Sibtain',
                                        content: Column(
                                          children: [
                                            CircleAvatar(
                                              radius: 21.r,
                                              backgroundColor:
                                                  const Color(0xffF4F4F4),
                                              child: const Icon(
                                                Icons.person,
                                                color: Color(0xff1E1E2D),
                                              ),
                                            ),
                                            Text(
                                              'Name: ${accountController.accountDetails['name'] ?? ''}',
                                              style: TextStyle(
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.w400,
                                                color: const Color(0xff1E1E2D),
                                              ),
                                            ),
                                            Text(
                                              'Bank Name: ${accountController.accountDetails['bank_name'] ?? ''}',
                                              style: TextStyle(
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.w400,
                                                color: const Color(0xff1E1E2D),
                                              ),
                                            ),
                                            Text(
                                              'Account Number: ${accountController.accountDetails['account_number'] ?? ''}',
                                              style: TextStyle(
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.w400,
                                                color: const Color(0xff1E1E2D),
                                              ),
                                            ),
                                          ],
                                        ),
                                        confirm: TextButton(
                                          style: TextButton.styleFrom(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 20.w,
                                              vertical: 4.h,
                                            ),
                                            backgroundColor:
                                                const Color(0xff0066FF),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(24.r),
                                              side: const BorderSide(
                                                color: Color(0xff0066FF),
                                              ),
                                            ),
                                          ),
                                          child: Text(
                                            'Share',
                                            style: TextStyle(
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                            ),
                                          ),
                                          onPressed: () async {
                                            // Get.back();
                                            final result = await Share.share(
                                                'Name: ${accountController.accountDetails['name']}\nBank Name: PromptPay\nAccount Number: ${accountController.accountDetails['account_number']}\n\nShared by PromptPay App');

                                            if (result.status ==
                                                ShareResultStatus.success) {
                                              if (kDebugMode) {
                                                print(
                                                    'Thank you for sharing my website!');
                                              }
                                            }
                                          },
                                        ),
                                        cancel: TextButton(
                                          style: TextButton.styleFrom(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 20.w,
                                              vertical: 4.h,
                                            ),
                                            backgroundColor: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(24.r),
                                              side: const BorderSide(
                                                color: Color(0xff0066FF),
                                              ),
                                            ),
                                          ),
                                          child: Text(
                                            'Copy',
                                            style: TextStyle(
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xff1E1E2D),
                                            ),
                                          ),
                                          onPressed: () {
                                            Clipboard.setData(ClipboardData(
                                                text:
                                                    'Name: ${accountController.accountDetails['name'] ?? ''} \nBank Name: ${accountController.accountDetails['bank_name'] ?? ''} \nAccount  Number: ${accountController.accountDetails['account_number'] ?? ''}'));
                                            Get.back();
                                          },
                                        ),
                                      );
                                    },
                                    child: const CircleWithIcon(
                                      icon: Icon(
                                        Icons.arrow_downward_outlined,
                                        color: Color(0xff1E1E2D),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    'Received',
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff1E1E2D),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 20.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Transaction',
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xff1E1E2D),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.transactionHistory);
                                },
                                child: Text(
                                  'See All',
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff0066FF),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Expanded(
                        child: TransactionsWidget(
                          limit: 3,
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 65.h,
                  right: -100,
                  child: IgnorePointer(
                    ignoring: true,
                    child: Transform.rotate(
                      angle: 145 * pi / 180,
                      child: ClipOval(
                        child: Container(
                          height: 361.h,
                          width: 270.w,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                const Color(0xff0018F1).withValues(alpha: 0.2),
                                const Color(0xff0066FF).withValues(alpha: 0.2),
                              ],
                            ),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TransactionsWidget extends StatefulWidget {
  const TransactionsWidget({
    super.key,
    this.limit,
  });
  final int? limit;

  @override
  State<TransactionsWidget> createState() => _TransactionsWidgetState();
}

class _TransactionsWidgetState extends State<TransactionsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        TransactionHistoryWidget(
          limit: widget.limit,
        ),
      ],
    );
  }
}
