import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prompt_pay/models/chat_model.dart';
import 'package:prompt_pay/viewModel/controllers/chat_controller.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final chatController = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (chatController.messages.isNotEmpty) {
          Get.defaultDialog(
            titlePadding: EdgeInsets.only(top: 20.h),
            backgroundColor: Colors.white,
            title: 'Confirm',
            titleStyle: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xff1E1E2D),
            ),
            content: const Text(
              'Are you sure you want to clear all messages?',
              textAlign: TextAlign.center,
            ),
            confirm: TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 4.h,
                ),
                backgroundColor: const Color(0xff0066FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.r),
                  side: const BorderSide(
                    color: Color(0xff0066FF),
                  ),
                ),
              ),
              child: Text(
                'Yes',
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                chatController.clearMessages();
                Get.back();
                Get.back();
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
                  borderRadius: BorderRadius.circular(24.r),
                  side: const BorderSide(
                    color: Color(0xff0066FF),
                  ),
                ),
              ),
              child: Text(
                'No',
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff1E1E2D),
                ),
              ),
              onPressed: () {
                Get.back();
              },
            ),
          );
        } else {
          Get.back();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          // toolbarHeight: kBottomNavigationBarHeight - 25.h,
          backgroundColor: Colors.white,
          leading: Column(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const Spacer(),
              Image.asset('assets/pngs/tabler_menu.png'),
            ],
          ),
          actions: [
            Obx(
              () => chatController.messages.isNotEmpty
                  ? Padding(
                      padding: EdgeInsets.only(right: 16.w),
                      child: GestureDetector(
                        onTap: () {
                          Get.defaultDialog(
                            titlePadding: EdgeInsets.only(top: 20.h),
                            backgroundColor: Colors.white,
                            title: 'Confirm',
                            titleStyle: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xff1E1E2D),
                            ),
                            content: const Text(
                              'Are you sure you want to clear all messages?',
                              textAlign: TextAlign.center,
                            ),
                            confirm: TextButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20.w,
                                  vertical: 4.h,
                                ),
                                backgroundColor: const Color(0xff0066FF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24.r),
                                  side: const BorderSide(
                                    color: Color(0xff0066FF),
                                  ),
                                ),
                              ),
                              child: Text(
                                'Yes',
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                chatController.clearMessages();
                                Get.back();
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
                                  borderRadius: BorderRadius.circular(24.r),
                                  side: const BorderSide(
                                    color: Color(0xff0066FF),
                                  ),
                                ),
                              ),
                              child: Text(
                                'No',
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xff1E1E2D),
                                ),
                              ),
                              onPressed: () {
                                Get.back();
                              },
                            ),
                          );
                        },
                        child: CircleAvatar(
                          // radius: 24.r,
                          backgroundColor: const Color(0xffF4F4F4),
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(8.0),
                            child: const Icon(
                              Icons.logout,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
          automaticallyImplyLeading: false,
          surfaceTintColor: Colors.white,
        ),
        body: GetBuilder<ChatController>(
          builder: (chatController) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ListView.custom(
                    reverse: chatController.messages.isNotEmpty ? true : false,
                    shrinkWrap: true,
                    childrenDelegate: SliverChildListDelegate(
                      [
                        if (chatController.messages.isEmpty)
                          Column(
                            children: [
                              SizedBox(
                                height: 60.h,
                              ),
                              SizedBox(
                                width: 1.sw,
                                height: 200.h,
                                child: Image.asset(
                                  'assets/pngs/ai_robot.png',
                                ),
                              ),
                              Text(
                                'Hello! How can I assist you today?',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          )
                        else
                          ListView.builder(
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                            shrinkWrap: true,
                            itemCount: chatController.messages.length,
                            physics: const BouncingScrollPhysics(),
                            controller: chatController.scrollController,
                            itemBuilder: (context, index) {
                              return _buildMessage(
                                  chatController.messages[index]);
                            },
                          )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (chatController.messages.isEmpty &&
                          chatController.controller.value.text.isEmpty &&
                          chatController.isPromptPay.value)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Suggestions',
                              style: TextStyle(
                                fontSize: 20.sp,
                                color: const Color(0xff1E1E2D),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 18.h,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 20.w,
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    chatController.controller.value.text =
                                        'I Need to transfer funds to someone?';
                                    chatController
                                        .onSendPromptPayMessageWithRoute(
                                            context: context);
                                    // chatController.addMessage(
                                    //   const ChatModel(
                                    //     isSender: false,
                                    //     message:
                                    //         'I Need to transfer funds to someone?',
                                    //   ),
                                    // );
                                    // //delayed response
                                    // Future.delayed(const Duration(seconds: 1),
                                    //     () {
                                    //   chatController.addMessage(
                                    //     const ChatModel(
                                    //       isSender: true,
                                    //       message:
                                    //           'This is an automated message from PromptPay',
                                    //     ),
                                    //   );
                                    // });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 14.w,
                                      vertical: 6.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10.r),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color(0xff0066FF),
                                          spreadRadius: 0.2,
                                          blurRadius: 3,
                                          // offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          style: TextStyle(
                                            fontSize: 15.sp,
                                          ),
                                          'I Need to transfer funds to someone?',
                                        ),
                                        const Icon(Icons.arrow_forward_outlined)
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    chatController.addMessage(
                                      const ChatModel(
                                        isSender: false,
                                        message:
                                            'I Need to pay my electricity bill?',
                                      ),
                                    );
                                    //delayed response
                                    Future.delayed(const Duration(seconds: 1),
                                        () {
                                      chatController.addMessage(
                                        const ChatModel(
                                          isSender: true,
                                          message:
                                              'This is an automated message from PromptPay',
                                        ),
                                      );
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 14.w,
                                      vertical: 6.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10.r),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color(0xff0066FF),
                                          spreadRadius: 0.2,
                                          blurRadius: 3,
                                          // offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          style: TextStyle(
                                            fontSize: 15.sp,
                                          ),
                                          'I Need to pay my electricity bill?',
                                        ),
                                        const Icon(
                                            Icons.arrow_forward_outlined),
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    chatController.addMessage(
                                      const ChatModel(
                                        isSender: false,
                                        message:
                                            'I want to change my app password?',
                                      ),
                                    );
                                    //delayed response
                                    Future.delayed(const Duration(seconds: 1),
                                        () {
                                      chatController.addMessage(
                                        const ChatModel(
                                          isSender: true,
                                          message:
                                              'This is an automated message from PromptPay',
                                        ),
                                      );
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 14.w,
                                      vertical: 6.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10.r),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color(0xff0066FF),
                                          spreadRadius: 0.2,
                                          blurRadius: 3,
                                          // offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          style: TextStyle(
                                            fontSize: 15.sp,
                                          ),
                                          'I want to change my app password?',
                                        ),
                                        const Icon(
                                            Icons.arrow_forward_outlined),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                          ],
                        ),
                      SizedBox(
                        width: 1.sw,
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                onTapOutside: (event) => FocusManager
                                    .instance.primaryFocus
                                    ?.unfocus(),
                                keyboardType: TextInputType.multiline,
                                controller: chatController.controller.value,
                                onChanged: (value) {
                                  chatController.updateController(value);
                                },
                                cursorColor: const Color(0xff0066FF),
                                decoration: InputDecoration(
                                  alignLabelWithHint: false,
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 30.w,
                                    vertical: 15.h,
                                  ),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(28.r),
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 207, 205, 205),
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(28.r),
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 207, 205, 205),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(28.r),
                                    borderSide: const BorderSide(
                                      color: Color(0xff0066FF),
                                    ),
                                  ),
                                  labelText: 'Type your message here',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const PromptpayToggleButton(),
                          GestureDetector(
                            onTap: () {
                              if (!chatController.isPromptPay.value) {
                                chatController.onSendNormalMessage(
                                    context: context);
                              }
                              if (chatController.isPromptPay.value) {
                                chatController.onSendPromptPayMessageWithRoute(
                                    context: context);
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.all(12.h),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: chatController
                                            .controller.value.text.isEmpty
                                        ? Colors.grey
                                        : const Color(0xff0066FF),
                                    spreadRadius: 0.5,
                                    blurRadius: 3,
                                  ),
                                ],
                              ),
                              child: Icon(
                                Icons.arrow_upward_sharp,
                                color:
                                    chatController.controller.value.text.isEmpty
                                        ? Colors.grey
                                        : const Color(0xff0066FF),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildMessage(ChatModel message) {
    return Container(
      margin: EdgeInsets.only(
        left: 8.w,
        right: 16.w,
        bottom: 12.h,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment:
            !message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (message.isSender)
            Row(
              children: [
                SizedBox(
                  width: 8.w,
                ),
                Image.asset(
                  'assets/pngs/ai_robot.png',
                  height: 32.h,
                  width: 32.w,
                ),
              ],
            ),
          Container(
            constraints: BoxConstraints(
              maxWidth: 0.8.sw,
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: !message.isSender
                  ? const Color(0xff0066FF)
                  : const Color(0xffD9D9D9),
              borderRadius: BorderRadius.circular(24.r),
              // boxShadow: !message.isSender
              //     ? const [
              //         BoxShadow(
              //           color: Color(0xff0066FF),
              //           spreadRadius: 0.2,
              //           blurRadius: 3,
              //         ),
              //       ]
              //     : null,
            ),
            child: Text(
              message.message,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: !message.isSender ? Colors.white : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PromptpayToggleButton extends StatefulWidget {
  const PromptpayToggleButton({
    super.key,
  });

  @override
  State<PromptpayToggleButton> createState() => _PromptpayToggleButtonState();
}

class _PromptpayToggleButtonState extends State<PromptpayToggleButton> {
  final chatController = Get.find<ChatController>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (chatController.isPromptPay.value) {
          if (chatController.messages.isEmpty) {
            chatController.togglePromptPay();
            return;
          }
          Get.defaultDialog(
            titlePadding: EdgeInsets.only(top: 20.h),
            backgroundColor: Colors.white,
            title: 'Confirm',
            titleStyle: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xff1E1E2D),
            ),
            content: const Text(
              'Are you sure you want to clear all messages?',
              textAlign: TextAlign.center,
            ),
            confirm: TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 4.h,
                ),
                backgroundColor: const Color(0xff0066FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.r),
                  side: const BorderSide(
                    color: Color(0xff0066FF),
                  ),
                ),
              ),
              child: Text(
                'Yes',
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                chatController.clearMessages();
                chatController.togglePromptPay();
                Get.back();
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
                  borderRadius: BorderRadius.circular(24.r),
                  side: const BorderSide(
                    color: Color(0xff0066FF),
                  ),
                ),
              ),
              child: Text(
                'No',
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff1E1E2D),
                ),
              ),
              onPressed: () {
                Get.back();
              },
            ),
          );
        } else {
          chatController.togglePromptPay();
        }
      },
      child: Obx(
        () => Container(
          padding: EdgeInsets.all(8.h),
          decoration: BoxDecoration(
            color: chatController.isPromptPay.value
                ? const Color(0xff0066FF)
                : Colors.white.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(24.r),
            // boxShadow: isOn
            //     ? const [
            //         BoxShadow(
            //           color: Color(0xff0066FF),
            //           spreadRadius: 0.5,
            //           blurRadius: 3,
            //         ),
            //       ]
            //     : null,
          ),
          child: Row(
            children: [
              Icon(
                Icons.qr_code,
                color: chatController.isPromptPay.value
                    ? Colors.white
                    : const Color(0xff0066FF),
              ),
              SizedBox(
                width: 2.w,
              ),
              Text(
                'PrompPay',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: chatController.isPromptPay.value
                      ? Colors.white
                      : const Color(0xff0066FF),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
