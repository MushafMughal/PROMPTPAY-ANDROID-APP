import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prompt_pay/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 787),
      builder: (_, child) {
        return GetMaterialApp(
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
            ),
            scaffoldBackgroundColor: Colors.white,
            fontFamily: 'Poppins',
            primaryColor: const Color(0xff0066FF),
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.splash,
          getPages: getPages,
        );
      },
    );
  }
}
