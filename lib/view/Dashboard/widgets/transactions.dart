import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prompt_pay/utils/helper.dart';
import 'package:prompt_pay/view/Dashboard/widgets/home.dart';
import 'package:prompt_pay/viewModel/controllers/account_controller.dart';
import 'package:prompt_pay/viewModel/controllers/dashboard_controller.dart';
import 'package:prompt_pay/viewModel/controllers/transaction_controller.dart';
import 'package:prompt_pay/widgets/circle_with_icon.dart';

class Transactions extends StatefulWidget {
  const Transactions({super.key});

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  final dashboardController = Get.find<DashboardController>();
  final accountController = Get.find<AccountController>();
  final transactionController = Get.find<TransactionController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: 5.0.w),
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
              'Transaction History',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xff1E1E2D),
              ),
            ),
            const Spacer(),
            CircleWithIcon(
              icon: const SizedBox.shrink(),
              radius: 21.r,
              color: Colors.transparent,
            ),
            SizedBox(width: 5.0.w),
          ],
        ),
      ),
      body: Container(
        height: 0.85.sh,
        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
        child: Column(
          children: [
            Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Current Balance',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18.sp,
                      color: const Color(0xffA2A2A7),
                    ),
                  ),
                ),
                SizedBox(
                  height: 6.h,
                ),
                Obx(
                  () => Text(
                    'PKR ${accountController.accountDetails['balance'] ?? 0}',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 26.sp,
                      color: const Color(0xff1E1E2D),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async => Helper.onRefresh(context: context),
                child: const SingleChildScrollView(
                  child: TransactionsWidget(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
