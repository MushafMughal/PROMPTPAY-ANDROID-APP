import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prompt_pay_fyp/chat_screen.dart';
import 'package:prompt_pay_fyp/features/Chat/viewModel/chat_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => ChatProvider()),
          ],
          builder: (context, child) {
            return const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: ChatScreen(),
            );
          },
        );
      },
    );
  }
}
