import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vikns_machinetest/controller/bottomcontroller.dart';
import 'package:vikns_machinetest/view/pages/homepage.dart';
import 'package:vikns_machinetest/view/pages/navigationpage.dart';
import 'package:vikns_machinetest/view/pages/notificationpage.dart';
import 'package:vikns_machinetest/view/pages/profilepage.dart';

class Bottom_Nav extends StatelessWidget {
  final BottomNavController bottomNavController =
      Get.put(BottomNavController());
  Bottom_Nav({super.key});

  final List<Widget> childrens = [
    const Home(),
    const Navigation(),
    const Notify(),
    const Profile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => FlashyTabBar(
          items: [
            FlashyTabBarItem(
                activeColor: Colors.grey.shade50,
                inactiveColor: Colors.grey.shade50,
                icon: Icon(
                  Icons.home_filled,
                  color: Colors.grey.shade800,
                ),
                title: Icon(
                  Icons.home_filled,
                  color: Colors.grey.shade50,
                )),
            FlashyTabBarItem(
                activeColor: Colors.indigo.shade900,
                inactiveColor: Colors.grey.shade50,
                icon: Icon(
                  Icons.navigation_outlined,
                  color: Colors.grey.shade800,
                ),
                title: Icon(
                  Icons.navigation_outlined,
                  color: Colors.grey.shade50,
                )),
            FlashyTabBarItem(
                activeColor: Colors.indigo.shade800,
                inactiveColor: Colors.grey.shade50,
                icon: Icon(
                  Icons.notifications_none,
                  color: Colors.grey.shade800,
                ),
                title: Icon(
                  Icons.notifications_none,
                  color: Colors.grey.shade50,
                )),
            FlashyTabBarItem(
                activeColor: Colors.indigo.shade900,
                inactiveColor: Colors.grey.shade50,
                icon: Icon(
                  Icons.person_outlined,
                  color: Colors.grey.shade800,
                ),
                title: Icon(
                  Icons.person_outlined,
                  color: Colors.grey.shade50,
                )),
          ],
          selectedIndex: bottomNavController.selectedIndex.value,
          iconSize: 28,
          onItemSelected: bottomNavController.changeNavBar,
          backgroundColor: Colors.black,
          animationDuration: Durations.extralong2,
        ),
      ),
      body: Obx(() => childrens[bottomNavController.selectedIndex.value]),
    );
  }
}
