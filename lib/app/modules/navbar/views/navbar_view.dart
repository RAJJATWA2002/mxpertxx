import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mxpertz/common/colors.dart';

import '../controllers/navbar_controller.dart';

class NavbarView extends GetView<NavbarController> {
  const NavbarView({super.key});

  @override
  Widget build(BuildContext context) {
    final NavbarController controller = Get.put(NavbarController());
    return Scaffold(
      body: Obx(() => controller.pages[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          currentIndex: controller.selectedIndex.value,
          backgroundColor: backgroundColor,
          onTap: (index) => controller.changeIndex(index),
          selectedItemColor: secondaryColor,
          unselectedItemColor: darkGrayColor,

          items: [
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.home, color: secondaryColor),
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.category, color: secondaryColor),
              icon: Icon(Icons.category),
              label: 'Category',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: 'Message',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Private'),
          ],
        ),
      ),
    );
  }
}
