import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prompt_pay/view/Onboarding/onboarding.dart';
import 'package:prompt_pay/viewModel/controllers/account_controller.dart';
import 'package:prompt_pay/viewModel/controllers/dashboard_controller.dart';
import 'package:prompt_pay/viewModel/controllers/mastercard_controller.dart';
import 'package:prompt_pay/widgets/circle_with_icon.dart';
import 'package:prompt_pay/widgets/custom_master_card.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class Cards extends StatelessWidget {
  const Cards({super.key});

  @override
  Widget build(BuildContext context) {
    final dashboardController = Get.put(DashboardController());
    final accountController = Get.put(AccountController());
    final MastercardController cardController = Get.find();
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          automaticallyImplyLeading: false,
          toolbarHeight: kTextTabBarHeight + 30.h,
          title: Row(
            children: [
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
                'Card Details',
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
                right: 40.w,
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
                const CustomMasterCard(),
                // TransactionHistoryWidget(
                //   transactionDetailsList: [
                //     TransactionDetailModel(
                //       serviceIcon: 'assets/pngs/apple_icon.png',
                //       serviceName: 'Apple',
                //       subtitle: 'Entertainment',
                //       type: TransactionType.received,
                //       amount: '10.00',
                //     ),
                //     TransactionDetailModel(
                //       serviceIcon: 'assets/pngs/apple_icon.png',
                //       serviceName: 'Google',
                //       subtitle: 'Entertainment',
                //       type: TransactionType.sent,
                //       amount: '10.00',
                //     ),
                //     TransactionDetailModel(
                //       serviceIcon: 'assets/pngs/apple_icon.png',
                //       serviceName: 'Facebook',
                //       subtitle: 'Entertainment',
                //       type: TransactionType.received,
                //       amount: '10.00',
                //     ),
                //   ],
                // ),
                10.h.verticalSpace,
                Text(
                  'Monthly spending limit',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff1E1E2D),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  decoration: BoxDecoration(
                    color: const Color(0xffF4F4F4),
                    borderRadius: BorderRadius.circular(18.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Text(
                            'Amount: PKR ${accountController.accountDetails['balance'] ?? '0.00'}',
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff1E1E2D),
                            )),
                      ),
                      SfSliderTheme(
                        data: SfSliderThemeData(
                          inactiveTrackHeight: 6.h,
                          activeTrackHeight: 6.h,
                          activeLabelStyle: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xffA2A2A7),
                          ),
                          inactiveLabelStyle: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                        ),
                        child: Obx(
                          () => SfSlider(
                            edgeLabelPlacement: EdgeLabelPlacement.auto,
                            showLabels: true,
                            labelFormatterCallback:
                                (actualValue, formattedText) {
                              formattedText = actualValue.toString();
                              return formattedText;
                            },
                            tooltipTextFormatterCallback:
                                (actualValue, formattedText) {
                              formattedText = actualValue.toString();
                              return formattedText;
                            },
                            min: 0,
                            max: 100000,
                            value: cardController.cardSpendingLimit.value
                                .round()
                                .toDouble(),
                            onChanged: (value) {
                              cardController.saveCardLimit(data: value);
                            },
                            activeColor: const Color(0xff0066FF),
                            inactiveColor: Colors.white,
                            thumbShape: _SfThumbShape(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Obx(
                  () => CustomButton(
                    text: 'Save',
                    isDisabled: double.parse(
                            cardController.cardDetails['card_limit']) ==
                        cardController.cardSpendingLimit.value,
                    onTap: () {
                      cardController.updateCardLimit(context: context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _SfThumbShape extends SfThumbShape {
  @override
  void paint(PaintingContext context, Offset center,
      {required RenderBox parentBox,
      required RenderBox? child,
      required SfSliderThemeData themeData,
      SfRangeValues? currentValues,
      dynamic currentValue,
      required Paint? paint,
      required Animation<double> enableAnimation,
      required TextDirection textDirection,
      required SfThumb? thumb}) {
    // Drawing a circle for the thumb
    double radius = 7.r;
    final Paint thumbPaint = Paint()
      ..color = Colors.white // White fill color for the thumb
      ..style = PaintingStyle.fill;

    final Paint borderPaint = Paint()
      ..color = const Color(0xff0066FF) // Blue border color for the thumb
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    // Draw the circle (thumb)
    context.canvas.drawCircle(center, radius, thumbPaint);
    // Draw the blue border around the circle
    context.canvas.drawCircle(center, radius, borderPaint);

    // Draw the variable text below the circle
    final TextSpan span = TextSpan(
      text: '$currentValue', // The variable text
      style: TextStyle(
        color: const Color(0xff1E1E2D),
        fontSize: 12.sp,
      ),
    );
    final TextPainter textPainter = TextPainter(
      text: span,
      textAlign: TextAlign.center,
      textDirection: textDirection,
    );
    textPainter.layout();

    // Calculate the position for the text below the circle
    final Offset textOffset =
        Offset(center.dx - textPainter.width / 2, center.dy + radius + 10);
    textPainter.paint(context.canvas, textOffset);
  }
}
