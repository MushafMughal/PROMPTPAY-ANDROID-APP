import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prompt_pay/view/Dashboard/widgets/home.dart';
import 'package:prompt_pay/widgets/circle_with_icon.dart';

class TransactionHistory extends StatefulWidget {
  const TransactionHistory({super.key});

  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
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
                  radius: 21.r,
                  icon: Transform.flip(
                    flipX: true,
                    child: const Icon(Icons.history),
                  ),
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: const Column(
                children: [
                  // TransactionHistoryWidget(
                  //   transactionDetailsList: [
                  //     TransactionDetailModel(
                  //       serviceIcon: 'assets/pngs/apple_icon.png',
                  //       serviceName: 'Apple',
                  //       subtitle: 'Entertainment',
                  //       amount: '10.00',
                  //       type: TransactionType.received,
                  //     ),
                  //     TransactionDetailModel(
                  //       serviceIcon: 'assets/pngs/apple_icon.png',
                  //       serviceName: 'Apple',
                  //       subtitle: 'Entertainment',
                  //       amount: '12.00',
                  //       type: TransactionType.received,
                  //     ),
                  //     TransactionDetailModel(
                  //       serviceIcon: 'assets/pngs/apple_icon.png',
                  //       serviceName: 'Apple',
                  //       subtitle: 'Entertainment',
                  //       amount: '30.00',
                  //       type: TransactionType.sent,
                  //     ),
                  //     TransactionDetailModel(
                  //       serviceIcon: 'assets/pngs/apple_icon.png',
                  //       serviceName: 'Apple',
                  //       subtitle: 'Entertainment',
                  //       amount: '1.00',
                  //       type: TransactionType.sent,
                  //     ),
                  //     TransactionDetailModel(
                  //       serviceIcon: 'assets/pngs/apple_icon.png',
                  //       serviceName: 'Apple',
                  //       subtitle: 'Entertainment',
                  //       amount: '15.00',
                  //       type: TransactionType.received,
                  //     ),
                  //   ],
                  // )
                  TransactionsWidget()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
