import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prompt_pay/viewModel/controllers/transaction_controller.dart';
import 'package:prompt_pay/widgets/app_snackbar.dart';
import 'package:prompt_pay/widgets/circle_with_icon.dart';
import 'package:prompt_pay/widgets/transaction_history_widget.dart';

class TransactionHistory extends StatefulWidget {
  const TransactionHistory({super.key});

  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
              'Transaction History',
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
          Padding(
            padding: EdgeInsets.only(
              right: 20.w,
            ),
            child: CircleWithIcon(
              onTap: () async {
                await Get.find<TransactionController>()
                    .getTransactionList(context: context);
                appSnackbar('Success', 'Transaction list refreshed');
              },
              radius: 21.r,
              icon: Transform.flip(
                flipX: true,
                child: const Icon(Icons.history),
              ),
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async => Get.find<TransactionController>()
            .getTransactionList(context: context),
        child: SingleChildScrollView(
          child: Container(
            // height: 0.8.sh,
            padding: EdgeInsets.symmetric(horizontal: 20.0.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 20.h),
                const TransactionHistoryWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
