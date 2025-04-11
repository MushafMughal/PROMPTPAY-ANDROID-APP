import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:prompt_pay/view/Dashboard/widgets/cards.dart';
import 'package:prompt_pay/view/Dashboard/widgets/home.dart';
import 'package:prompt_pay/view/Dashboard/widgets/settings.dart';
import 'package:prompt_pay/view/Dashboard/widgets/transactions.dart';
import 'package:prompt_pay/viewModel/controllers/dashboard_controller.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final dashboardController = Get.put(DashboardController());
  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = <Widget>[
      const Home(),
      const Cards(),
      const Transactions(),
      const SettingsScreens(),
    ];
    return Obx(
      () => Scaffold(
        body: screens[dashboardController.selectedIndex],
        bottomNavigationBar: SizedBox(
          height: 80.h,
          child: BottomNavigationBar(
            currentIndex: dashboardController.selectedIndex,
            backgroundColor: const Color(0xffF4F4F4),
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
            ),
            selectedItemColor: const Color(0xff0066FF),
            unselectedItemColor: const Color(0xff8B8B94),
            onTap: (value) {
              dashboardController.selectedIndex = value;
            },
            items: [
              const BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home),
                label: 'Home',
              ),
              const BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.creditcard_fill),
                label: 'My Cards',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(
                  FontAwesomeIcons.moneyBillTransfer,
                  size: 20.sp,
                ),
                label: 'Transactions',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined),
                label: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
