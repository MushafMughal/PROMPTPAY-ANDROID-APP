import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prompt_pay_fyp/features/Chat/model/chat_model.dart';
import 'package:prompt_pay_fyp/features/Chat/viewModel/chat_provider.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: kBottomNavigationBarHeight - 25.h,
        backgroundColor: Colors.white,
        leading: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Spacer(),
            Image.asset('assets/tabler_menu.png'),
          ],
        ),
        automaticallyImplyLeading: false,
        surfaceTintColor: Colors.white,
      ),
      body: Consumer<ChatProvider>(builder: (
        context,
        chatProvider,
        child,
      ) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.custom(
                reverse: chatProvider.messages.isNotEmpty ? true : false,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                childrenDelegate: SliverChildListDelegate([
                  if (chatProvider.messages.isEmpty)
                    Column(
                      children: [
                        SizedBox(
                          height: 60.h,
                        ),
                        Image.asset('assets/ai_robot.png'),
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
                      shrinkWrap: true,
                      itemCount: chatProvider.messages.length,
                      itemBuilder: (context, index) {
                        return _buildMessage(chatProvider.messages[index]);
                      },
                    )
                ]),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (chatProvider.messages.isEmpty &&
                      chatProvider.controller.text.isEmpty)
                    Column(
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
                        SizedBox(
                          width: 1.sw,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              spacing: 20.w,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 14.w,
                                    vertical: 28.h,
                                  ),
                                  height: 148.h,
                                  width: 156.w,
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
                                  child: Text(
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                    ),
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                    'Need to transfer funds? Just tell me the amount and recipient.',
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 14.w,
                                    vertical: 28.h,
                                  ),
                                  height: 148.h,
                                  width: 156.w,
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
                                  child: Text(
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                    ),
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                    'Would you like to schedule a payment for later?',
                                  ),
                                ),
                              ],
                            ),
                          ),
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
                            keyboardType: TextInputType.multiline,
                            controller: chatProvider.controller,
                            onChanged: (value) {
                              chatProvider.updateController(value);
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
                              labelText: 'Send \$300 to Muhammad',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 16.w,
                        ),
                        GestureDetector(
                          onTap: chatProvider.controller.text.isNotEmpty
                              ? () {
                                  chatProvider.addMessage = ChatModel(
                                    isSender: true,
                                    message: chatProvider.controller.text,
                                  );
                                  chatProvider.resetController();
                                }
                              : null,
                          child: Container(
                            padding: EdgeInsets.all(12.h),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: chatProvider.controller.text.isEmpty
                                      ? Colors.grey
                                      : const Color(0xff0066FF),
                                  spreadRadius: 0.5,
                                  blurRadius: 3,
                                ),
                              ],
                            ),
                            child: Icon(
                              Icons.arrow_upward_sharp,
                              color: chatProvider.controller.text.isEmpty
                                  ? Colors.grey
                                  : const Color(0xff0066FF),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
            ),
          ],
        );
      }),
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
                  'assets/ai_robot.png',
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
              color: !message.isSender ? Colors.white : const Color(0xffD9D9D9),
              borderRadius: BorderRadius.circular(24.r),
              boxShadow: !message.isSender
                  ? const [
                      BoxShadow(
                        color: Color(0xff0066FF),
                        spreadRadius: 0.2,
                        blurRadius: 3,
                      ),
                    ]
                  : null,
            ),
            child: Text(
              message.message,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
