import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mxpertz/app/modules/cart/views/cart_view.dart';
import 'package:mxpertz/app/modules/category/views/category_view.dart';
import 'package:mxpertz/app/modules/home/views/home_view.dart';
import 'package:mxpertz/app/modules/message/views/message_view.dart';
import 'package:mxpertz/app/modules/private/views/private_view.dart';

class NavbarController extends GetxController {
  var selectedIndex = 0.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  final List<Widget> pages = [
    HomeView(),
    CategoryView(),
    MessageView(),
    CartView(),
    PrivateView(),
  ];
}
