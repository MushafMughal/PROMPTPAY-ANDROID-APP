import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:prompt_pay/view/Login/login.dart';
import 'package:prompt_pay/view/Onboarding/onboarding.dart';
import 'package:prompt_pay/viewModel/controllers/account_controller.dart';
import 'package:prompt_pay/viewModel/controllers/payees_controller.dart';
import 'package:prompt_pay/widgets/app_snackbar.dart';
import 'package:prompt_pay/widgets/circle_with_icon.dart';
import 'package:prompt_pay/widgets/custom_master_card.dart';

class SendMoney extends StatefulWidget {
  const SendMoney({super.key});

  @override
  State<SendMoney> createState() => _SendMoneyState();
}

class _SendMoneyState extends State<SendMoney> {
  final payeesController = Get.put(PayeesController());
  final accountController = Get.put(AccountController());
  final amountController = TextEditingController();

  void fetchPayees() async {
    await payeesController.getPayees(context: context);
  }

  @override
  void initState() {
    super.initState();
    if (payeesController.payeesList.isEmpty) {
      fetchPayees();
    }
  }

  String accountNumber = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        // physics: const NeverScrollableScrollPhysics(),
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
                    Get.back();
                  },
                  child: CircleWithIcon(
                    icon: const Icon(Icons.arrow_back_ios_new),
                    radius: 21.r,
                  ),
                ),
                const Spacer(),
                Text(
                  'Send Money',
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
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      SizedBox(height: 10.0.h),
                      const CustomMasterCard(),
                      SizedBox(height: 30.0.h),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.0.w,
                          vertical: 10.0.h,
                        ),
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14.0.r),
                          border: Border.all(
                            color: const Color(0xffE7EAEE),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Send to',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff1E1E2D),
                              ),
                            ),
                            SizedBox(height: 10.0.h),
                            Obx(
                              () => SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            // Get.showSnackbar(
                                            //   const GetSnackBar(
                                            //     snackPosition:
                                            //         SnackPosition.TOP,
                                            //     message:
                                            //         'This feature will be available soon',
                                            //     duration: Duration(seconds: 2),
                                            //     backgroundColor:
                                            //         Color(0xff0066FF),
                                            //   ),
                                            // );
                                            Get.bottomSheet(
                                              const AddPayeeDialog(),
                                            );
                                          },
                                          child: CircleWithIcon(
                                            icon: Icon(
                                              Icons.add_sharp,
                                              color: const Color(0xff0066FF),
                                              size: 32.0.sp,
                                            ),
                                            radius: 24.r,
                                          ),
                                        ),
                                        SizedBox(height: 4.0.h),
                                        Text(
                                          'Add',
                                          style: TextStyle(
                                            fontSize: 11.sp,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xff1E1E2D),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 18.0.w),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: List.generate(
                                        payeesController.payeesList.length,
                                        (index) {
                                          return GestureDetector(
                                            onTap: () {
                                              accountNumber = payeesController
                                                  .payeesList[index]
                                                      ['account_number']
                                                  .toString();
                                              setState(() {});
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                  right: 18.0.w),
                                              constraints: BoxConstraints(
                                                maxWidth: 60.0.w,
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  CircleWithIcon(
                                                    icon: Text(
                                                      payeesController
                                                              .payeesList[index]
                                                                  ['payee_name']
                                                                  ?[0]
                                                              .toString()
                                                              .toUpperCase() ??
                                                          '',
                                                      style: TextStyle(
                                                        fontSize: 20.sp,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    radius: 24.r,
                                                  ),
                                                  SizedBox(height: 4.0.h),
                                                  Text(
                                                    payeesController.payeesList[
                                                                index]
                                                            ['payee_name'] ??
                                                        '',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 11.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: const Color(
                                                          0xff1E1E2D),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30.0.h),
                      Container(
                        padding: EdgeInsets.fromLTRB(
                          10.0.w,
                          10.0.h,
                          10.0.w,
                          0.0.h,
                        ),
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14.0.r),
                          border: Border.all(
                            color: const Color(0xffE7EAEE),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Bank Name',
                                      style: TextStyle(
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xff7E848D),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          context: context,
                                          builder: (context) =>
                                              BankSelectionDialog(
                                            ammount: accountController
                                                        .accountDetails[
                                                    'balance'] ??
                                                '0',
                                          ),
                                        );
                                      },
                                      child: Icon(
                                        Icons.add,
                                        size: 30.sp,
                                        color: const Color(0xff7E848D),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0.w),
                                  child: Row(
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.buildingColumns,
                                        size: 16.sp,
                                        color: const Color(0xff7E848D),
                                      ),
                                      SizedBox(width: 20.0.w),
                                      Text(
                                        accountController
                                                .accountDetails['bank_name'] ??
                                            '',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: const Color(0xff1E1E2D),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider()
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Account Number',
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff7E848D),
                                  ),
                                ),
                                SizedBox(
                                  height: 30.0.h,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.only(
                                            top: 7.0.h, left: 10.0.w),
                                        child: FaIcon(
                                          FontAwesomeIcons.creditCard,
                                          size: 16.sp,
                                          // color: const Color(0xff7E848D),
                                        ),
                                      ),
                                      contentPadding: EdgeInsets.only(
                                        bottom: 10.0.h,
                                      ),
                                      enabledBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xFFDCDDDD)),
                                      ),
                                      focusedBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFDCDDDD),
                                        ),
                                      ),
                                      hintText: '0000 0000 0000 00',
                                      hintStyle: TextStyle(
                                        fontSize: 14.sp,
                                        color: const Color(0xff7E848D),
                                      ),
                                    ),
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xff1E1E2D),
                                    ),
                                    controller: TextEditingController(
                                      text: accountNumber,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            6.h.verticalSpace,
                            Text(
                              'Enter Your Amount',
                              style: TextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff7E848D),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'PKR',
                                  style: TextStyle(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xff9BB2D4),
                                  ),
                                ),
                                SizedBox(width: 10.0.w),
                                SizedBox(
                                  width: 0.5.sw,
                                  child: TextField(
                                    controller: amountController,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.only(top: -10.h),
                                      border: InputBorder.none,
                                      fillColor: Colors.white,
                                      hintText: '00.00',
                                      hintStyle: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff9BB2D4),
                                      ),
                                    ),
                                    style: TextStyle(
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xff1E1E2D),
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  10.h.verticalSpace,
                  CustomButton(
                    onTap: () async {
                      try {
                        final res = await payeesController.sendMoney(
                          context: context,
                          body: {
                            'account_number': accountNumber,
                            'amount': amountController.text,
                          },
                        );
                        if (res['status']) {
                          appSnackbar('Success', res['message']);
                          final pinController = TextEditingController();
                          final pinputFocusNode = FocusNode();
                          pinputFocusNode.requestFocus();
                          Get.defaultDialog(
                            radius: 6.r,
                            titlePadding: EdgeInsets.only(
                                top: 30.h, bottom: 0, left: 60.w, right: 60.w),
                            backgroundColor: Colors.white,
                            title: 'Enter your verification code',
                            titleStyle: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 50.w),
                            content: Column(
                              children: [
                                Text(
                                  'We sent a verification code to ${accountController.accountDetails['email']}.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    color: Colors.black45,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                10.h.verticalSpace,
                                Image.asset(
                                  'assets/pngs/verification-code-image.png',
                                ),
                                10.h.verticalSpace,
                                Pinput(
                                  // You can pass your own SmsRetriever implementation based on any package
                                  // in this example we are using the SmartAuth
                                  length: 5,
                                  controller: pinController,
                                  focusNode: pinputFocusNode,
                                  separatorBuilder: (index) =>
                                      SizedBox(width: 4.w),
                                  hapticFeedbackType:
                                      HapticFeedbackType.lightImpact,

                                  cursor: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 9),
                                        width: 22,
                                        height: 1,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                ),
                                6.h.verticalSpace,
                                SizedBox(
                                  height: 26.h,
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10.w,
                                        vertical: 0,
                                      ),
                                      backgroundColor: const Color(0xff0066FF),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(24.r),
                                        side: const BorderSide(
                                          color: Color(0xff0066FF),
                                        ),
                                      ),
                                    ),
                                    child: Text(
                                      'Verify',
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                    onPressed: () async {
                                      final res =
                                          await payeesController.verifyOtp(
                                        context: context,
                                        body: {
                                          'otp': pinController.text,
                                          'account_number': accountNumber,
                                          'amount': amountController.text,
                                        },
                                      );
                                      if (res?['status'] ?? false) {
                                        accountNumber = '';
                                        amountController.clear();
                                        pinController.clear();
                                        setState(() {});
                                      } else {
                                        appSnackbar(
                                          'Error',
                                          res?['message'] ??
                                              'Verification failed',
                                        );
                                      }
                                    },
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    await payeesController.resendOtp(
                                        context: context);
                                  },
                                  child: Container(
                                    width: double.maxFinite,
                                    padding:
                                        EdgeInsets.symmetric(vertical: 6.h),
                                    child: Text(
                                      'Send the code again',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        color: Colors.black45,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        }
                      } catch (e) {
                        if (kDebugMode) {
                          print('Error sending money: $e');
                        }
                      }
                    },
                    text: 'Send Money',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BankSelectionDialog extends StatelessWidget {
  const BankSelectionDialog({
    super.key,
    required this.ammount,
  });
  final String ammount;

  @override
  Widget build(BuildContext context) {
    final List<String> bankNames = [
      'Prompt Pay',
      'MCB',
      'Afalah',
      'Soneri',
      'BOP',
      'HBL',
      'UBL',
      'JazzCash',
      'EasyPaisa',
      'Payoneer',
      'PayPal',
      'Stripe',
    ];
    return DraggableScrollableSheet(
      initialChildSize: 0.65,
      maxChildSize: 0.7,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Select a Bank',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                'Available Balance',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
              Text(
                'PKR $ammount',
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff0066FF),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Please, select a bank from which you want to do the money transfer.',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  controller: scrollController,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 2 / 1.3,
                  ),
                  itemCount: bankNames.length,
                  itemBuilder: (context, index) {
                    return ElevatedButton(
                      onPressed: () {
                        if (bankNames[index] != 'Prompt Pay') {
                          Get.showSnackbar(
                            const GetSnackBar(
                              snackPosition: SnackPosition.TOP,
                              message: 'This feature will be available soon',
                              duration: Duration(seconds: 2),
                              backgroundColor: Color(0xff0066FF),
                            ),
                          );
                        } else {
                          Get.back();
                        }
                        // Handle bank selection
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: bankNames[index] == 'Prompt Pay'
                            ? const Color(0xff0066FF)
                            : Colors.grey.shade200,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        bankNames[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: bankNames[index] == 'Prompt Pay'
                                ? Colors.white
                                : Colors.black,
                            fontSize: 12.sp),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class AddPayeeDialog extends StatelessWidget {
  const AddPayeeDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.8,
      maxChildSize: 0.8,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Add Payee',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              CustomTextFieldWithlabel(
                label: 'Payee Name',
                hintText: 'John Doe',
                obscureText: false,
                controller: Get.find<PayeesController>().payeeNameController,
              ),
              const SizedBox(height: 10),
              CustomTextFieldWithlabel(
                label: 'Account Number',
                hintText: '000 0000 0000 0000',
                obscureText: false,
                controller:
                    Get.find<PayeesController>().accountNumberController,
              ),
              const SizedBox(height: 10),
              CustomTextFieldWithlabel(
                isEnabled: false,
                label: 'Bank Name',
                hintText: 'PromptPay',
                obscureText: false,
                controller: TextEditingController(
                  text: 'PromptPay',
                ),
              ),
              const SizedBox(height: 20),
              CustomButton(
                  onTap: () {
                    Get.find<PayeesController>().addPayee(context: context);
                  },
                  text: 'Add Payee'),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }
}
