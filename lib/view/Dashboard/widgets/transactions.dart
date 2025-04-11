import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prompt_pay/view/Dashboard/widgets/home.dart';
import 'package:prompt_pay/viewModel/controllers/account_controller.dart';
import 'package:prompt_pay/viewModel/controllers/dashboard_controller.dart';
import 'package:prompt_pay/widgets/circle_with_icon.dart';

class Transactions extends StatefulWidget {
  const Transactions({super.key});

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  final dashboardController = Get.put(DashboardController());
  final AccountController accountController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          SliverAppBar(
            pinned: true,
            automaticallyImplyLeading: false,
            toolbarHeight: kTextTabBarHeight + 30.h,
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
          SliverToBoxAdapter(
            child: Container(
              height: 0.85.sh,
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: Column(
                children: [
                  // SizedBox(
                  //   height: 20.h,
                  // ),
                  Column(
                    children: [
                      Text(
                        'Current Balance',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18.sp,
                          color: const Color(0xffA2A2A7),
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
                  // SizedBox(
                  //   height: 200,
                  //   width: double.maxFinite,
                  //   child: LineChart(
                  //     LineChartData(
                  //       borderData: FlBorderData(show: false),
                  //       minY: 0,
                  //       maxY: 10000,
                  //       minX: 0.5,
                  //       maxX: 6.5,
                  //       showingTooltipIndicators: [
                  //         // ShowingTooltipIndicators(
                  //         //   [
                  //         //     LineBarSpot(LineChartBarData(spots: [
                  //         //       FlSpot(0, 1)
                  //         //     ]))
                  //         //   ]
                  //         // )
                  //       ],
                  //       titlesData: const FlTitlesData(
                  //         bottomTitles: AxisTitles(
                  //           axisNameWidget: Row(
                  //             mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //             children: [
                  //               Text('OCT'),
                  //               Text('NOV'),
                  //               Text('DEC'),
                  //               Text('JAN'),
                  //               Text('FEB'),
                  //               Text('MAR'),
                  //             ],
                  //           ),
                  //         ),
                  //         topTitles: AxisTitles(),
                  //         rightTitles: AxisTitles(),
                  //         leftTitles: AxisTitles(),
                  //       ),
                  //       lineBarsData: [
                  //         LineChartBarData(
                  //           isStrokeCapRound: true,
                  //           isStrokeJoinRound: true,
                  //           preventCurveOverShooting: true,
                  //           preventCurveOvershootingThreshold: 20,
                  //           barWidth: 6,
                  //           belowBarData: BarAreaData(
                  //             show: true,
                  //             gradient: LinearGradient(
                  //               begin: Alignment.topCenter,
                  //               end: Alignment.bottomCenter,
                  //               colors: [
                  //                 const Color(0xff0066FF)
                  //                     .withValues(alpha: 0.08),
                  //                 const Color(0xff0066FF)
                  //                     .withValues(alpha: 0.01),
                  //               ],
                  //             ),
                  //           ),
                  //           curveSmoothness: 0.5,
                  //           isCurved: true,
                  //           color: Colors.red,
                  //           spots: [
                  //             const FlSpot(1, 4000),
                  //             const FlSpot(2, 3000),
                  //             const FlSpot(3, 6000),
                  //             const FlSpot(4, 4999),
                  //             const FlSpot(5, 8999),
                  //             const FlSpot(6, 6999),
                  //           ],
                  //         ),
                  //         // LineChartBarData(),
                  //         // LineChartBarData(),
                  //         // LineChartBarData(),
                  //       ],
                  //       backgroundColor: Colors.white,
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(height: 20.h),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text(
                  //       'Transaction',
                  //       style: TextStyle(
                  //         fontSize: 18.sp,
                  //         fontWeight: FontWeight.w500,
                  //         color: const Color(0xff1E1E2D),
                  //       ),
                  //     ),
                  //     GestureDetector(
                  //       onTap: () {
                  //         Get.toNamed(Routes.transactionHistory);
                  //       },
                  //       child: Text(
                  //         'See All',
                  //         style: TextStyle(
                  //           fontSize: 13.sp,
                  //           fontWeight: FontWeight.w400,
                  //           color: const Color(0xff0066FF),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),

                  SizedBox(height: 20.h),
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
                  const TransactionsWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
