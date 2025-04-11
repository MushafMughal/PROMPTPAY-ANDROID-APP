import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prompt_pay/viewModel/controllers/account_controller.dart';
import 'package:prompt_pay/viewModel/controllers/mastercard_controller.dart';

class CustomMasterCard extends StatefulWidget {
  const CustomMasterCard({
    super.key,
  });

  @override
  State<CustomMasterCard> createState() => _CustomMasterCardState();
}

class _CustomMasterCardState extends State<CustomMasterCard> {
  final mastercardController = Get.put(MastercardController());
  final accountController = Get.put(AccountController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (accountController.accountDetails.isEmpty) {
        accountController.getAccountDetails(context: context);
      }
      if (mastercardController.cardDetails.isEmpty) {
        mastercardController.getCardDetails(context: context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/pngs/card_background.png'),
          fit: BoxFit.cover,
        ),
        color: const Color(0xff27233D),
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/pngs/chip_icon.png'),
                  Transform.rotate(
                    angle: pi / 2,
                    // angle: ,
                    child: const Icon(
                      Icons.wifi,
                      color: Color.fromARGB(255, 61, 46, 128),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              Text(
                mastercardController.cardDetails['card_number'] != null
                    ? '${mastercardController.cardDetails['card_number']?.toString().replaceAll(RegExp(r'\s+'), '').replaceAllMapped(RegExp(r'(\d{4})'), (match) => '${match.group(0)} ')}'
                    : 'XXXX XXXX XXXX XXXX',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontFamily: 'Inter',
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                accountController.accountDetails['name'] != null
                    ? '${accountController.accountDetails['name']}'
                    : 'XXXXX',
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  fontFamily: 'Inter',
                ),
              ),
              SizedBox(height: 12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Expiry Date',
                            style: TextStyle(
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xffA2A2A7),
                              fontFamily: 'Inter',
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            mastercardController.cardDetails['expiry_date'] !=
                                    null
                                ? '${mastercardController.cardDetails['expiry_date']}'
                                : 'XX/XX',
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontFamily: 'Inter',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 30.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'CVV',
                            style: TextStyle(
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xffA2A2A7),
                              fontFamily: 'Inter',
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            mastercardController.cardDetails['cvv'] != null
                                ? '${mastercardController.cardDetails['cvv']}'
                                : 'XXX',
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontFamily: 'Inter',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        mastercardController.cardDetails['card_type'] != null
                            ? mastercardController.cardDetails['card_type'] ==
                                    'Visa'
                                ? 'assets/pngs/visacard_icon.png'
                                : 'assets/pngs/mastercard_icon.png'
                            : 'assets/pngs/mastercard_icon.png',
                        height: 30.h,
                        width: 34.w,
                      ),
                      if (mastercardController.cardDetails['card_type'] ==
                          'MasterCard')
                        Column(
                          children: [
                            SizedBox(height: 4.h),
                            Text(
                              mastercardController.cardDetails['card_type'] !=
                                      null
                                  ? (mastercardController
                                              .cardDetails['card_type'] ==
                                          'Visa'
                                      ? 'Visa'
                                      : 'MastersCard')
                                  : 'MastersCard',
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                fontFamily: 'Inter',
                              ),
                            ),
                          ],
                        )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
