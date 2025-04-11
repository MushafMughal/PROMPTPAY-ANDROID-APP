import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prompt_pay/viewModel/controllers/transaction_controller.dart';
import 'package:prompt_pay/widgets/circle_with_icon.dart';

class TransactionDetails extends StatefulWidget {
  const TransactionDetails({super.key});

  @override
  State<TransactionDetails> createState() => _TransactionDetailsState();
}

class _TransactionDetailsState extends State<TransactionDetails> {
  final TransactionController transactionController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // SliverAppBar(
          //   pinned: true,
          //   automaticallyImplyLeading: false,
          //   toolbarHeight: kTextTabBarHeight + 30.h,
          //   title: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       SizedBox(width: 5.0.w),
          //       GestureDetector(
          //         onTap: () {
          //           Get.back();
          //         },
          //         child: CircleWithIcon(
          //           icon: const Icon(Icons.arrow_back_ios_new),
          //           radius: 21.r,
          //         ),
          //       ),
          //       const Spacer(),
          //       Text(
          //         'Transaction Details',
          //         style: TextStyle(
          //           fontSize: 18.sp,
          //           fontWeight: FontWeight.w500,
          //           color: const Color(0xff1E1E2D),
          //         ),
          //       ),
          //       const Spacer(),
          //       CircleWithIcon(
          //         icon: const SizedBox.shrink(),
          //         radius: 21.r,
          //         color: Colors.transparent,
          //       ),
          //       SizedBox(width: 5.0.w),
          //     ],
          //   ),
          // ),
          SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(height: 10.0.h),
                    Container(
                      width: double.maxFinite,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xff0066FF),
                            Color.fromARGB(255, 127, 177, 253)
                          ],
                        ),
                      ),
                      child: Column(
                        children: [
                          14.h.verticalSpace,
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(width: 5.0.w),
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
                                  'Transaction Details',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
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
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 20.h),
                            color: Colors.white,
                            child: Column(
                              children: [
                                10.h.verticalSpace,
                                Text(
                                  'PromptPay',
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xff1E1E2D),
                                  ),
                                ),
                                10.h.verticalSpace,
                                Text(
                                  'Rs. ${transactionController.transactionDetails['amount']}',
                                  style: TextStyle(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xff1E1E2D),
                                  ),
                                ),
                                10.h.verticalSpace,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const CircleWithIcon(
                                      icon: Icon(Icons.person),
                                    ),
                                    10.h.horizontalSpace,
                                    Text(
                                      transactionController.transactionDetails[
                                                  'transaction_type'] ==
                                              'credit'
                                          ? transactionController
                                                  .transactionDetails[
                                              'source_account_title']
                                          : transactionController
                                                  .transactionDetails[
                                              'destination_account_title'],
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xff1E1E2D),
                                      ),
                                    ),
                                  ],
                                ),
                                10.h.verticalSpace,
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                20.h.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Transaction Details',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff1E1E2D),
                        ),
                      ),
                      10.h.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Transaction ID',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff1E1E2D),
                            ),
                          ),
                          Text(
                            transactionController
                                .transactionDetails['transaction_id'],
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xffA2A2A7),
                            ),
                          ),
                        ],
                      ),
                      10.h.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Transaction Time',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff1E1E2D),
                            ),
                          ),
                          Text(
                            transactionController
                                .transactionDetails['transaction_time'],
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xffA2A2A7),
                            ),
                          ),
                        ],
                      ),
                      20.h.verticalSpace,
                      Text(
                        'Account Details',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff1E1E2D),
                        ),
                      ),
                      10.h.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Amount ${transactionController.transactionDetails['transaction_type'] == 'credit' ? 'Received' : transactionController.transactionDetails['transaction_type'] == 'debit' ? 'Sent' : transactionController.transactionDetails['transaction_type'] == 'bill_payment' ? 'Paid' : ''}',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff1E1E2D),
                            ),
                          ),
                          Text(
                            'Rs. ${transactionController.transactionDetails['amount']}',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xffA2A2A7),
                            ),
                          ),
                        ],
                      ),
                      10.h.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Service Fee (Incl. Tax)',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff1E1E2D),
                            ),
                          ),
                          Text(
                            'Rs. ${transactionController.transactionDetails['service_fee']}',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xffA2A2A7),
                            ),
                          ),
                        ],
                      ),
                      10.h.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Amount',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff1E1E2D),
                            ),
                          ),
                          Text(
                            'Rs. ${transactionController.transactionDetails['total_amount']}',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xffA2A2A7),
                            ),
                          ),
                        ],
                      ),
                      20.h.verticalSpace,
                      Text(
                        'Additional Information',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff1E1E2D),
                        ),
                      ),
                      10.h.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Destination Acc. Title',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff1E1E2D),
                            ),
                          ),
                          Text(
                            '${transactionController.transactionDetails['destination_account_title']}',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xffA2A2A7),
                            ),
                          ),
                        ],
                      ),
                      10.h.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Destination Bank',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff1E1E2D),
                            ),
                          ),
                          Text(
                            '${transactionController.transactionDetails['destination_bank']}',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xffA2A2A7),
                            ),
                          ),
                        ],
                      ),
                      10.h.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Destination Acc. Number',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff1E1E2D),
                            ),
                          ),
                          Text(
                            '${transactionController.transactionDetails['destination_account_number']}',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xffA2A2A7),
                            ),
                          ),
                        ],
                      ),
                      10.h.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Source Acc. Title',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff1E1E2D),
                            ),
                          ),
                          Text(
                            '${transactionController.transactionDetails['source_account_title']}',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xffA2A2A7),
                            ),
                          ),
                        ],
                      ),
                      10.h.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Channel',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff1E1E2D),
                            ),
                          ),
                          Text(
                            '${transactionController.transactionDetails['Raast'] ?? '-'}',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xffA2A2A7),
                            ),
                          ),
                        ],
                      ),
                      20.h.verticalSpace,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
