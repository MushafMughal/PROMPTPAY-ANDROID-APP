import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prompt_pay/viewModel/controllers/transaction_controller.dart';
import 'package:prompt_pay/widgets/circle_with_icon.dart';

class TransactionHistoryWidget extends StatefulWidget {
  const TransactionHistoryWidget({
    super.key,
    this.limit,
  });
  final int? limit;

  @override
  State<TransactionHistoryWidget> createState() =>
      _TransactionHistoryWidgetState();
}

class _TransactionHistoryWidgetState extends State<TransactionHistoryWidget> {
  final transactionController = Get.put(TransactionController());
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (transactionController.transactionList.isEmpty) {
        await transactionController.getTransactionList(context: context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: transactionController.transactionList.isNotEmpty
            ? List.generate(
                (widget.limit != null &&
                        widget.limit! <
                            transactionController.transactionList.length)
                    ? widget.limit!
                    : transactionController.transactionList.length,
                (index) => Padding(
                  padding: EdgeInsets.only(bottom: 20.h),
                  child: GestureDetector(
                    onTap: () async {
                      await transactionController.getTransactionDetails(
                        context: context,
                        id: transactionController.transactionList[index]
                            ['transaction_id'],
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleWithIcon(
                              icon: Icon(
                                Icons.check,
                                size: 26.sp,
                              ),
                              radius: 21.r,
                            ),
                            SizedBox(width: 20.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  transactionController.transactionList[index]
                                      ['name'],
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xff1E1E2D),
                                  ),
                                ),
                                // Text(
                                //   transactionDetailsList[index].subtitle,
                                //   style: TextStyle(
                                //     fontSize: 12.sp,
                                //     fontWeight: FontWeight.w400,
                                //     color: const Color(0xffA2A2A7),
                                //   ),
                                // ),
                              ],
                            ),
                          ],
                        ),
                        Text(
                          transactionController.transactionList[index]
                                      ['transaction_type'] ==
                                  'credit'
                              ? '${transactionController.transactionList[index]['amount']}'
                              : '- ${transactionController.transactionList[index]['amount']}',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: transactionController.transactionList[index]
                                        ['transaction_type'] ==
                                    'debit'
                                ? Colors.black
                                : const Color(0xff0066FF),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : [],
      ),
    );
  }
}
