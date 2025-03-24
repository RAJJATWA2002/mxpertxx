import 'package:get/get.dart';
import 'package:mxpertz/app/data/constants/image_constants.dart';
import 'package:mxpertz/app/data/constants/string_constants.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  final currentIndex = 0.obs;
  final List<String> imagePaths = [
    'assets/images/c1.png',
    'assets/images/c1.png',
    'assets/images/c1.png',
    'assets/images/c1.png',
  ];
  final List<String> list1 = [
    'recommend',
    'cell phone',
    'Car Products',
    'department store',
    'cell phone',
    'Car Products',
    'department store',
  ];

  final List<Map<String, String>> gridItems = [
    {"image": ImageConstants.beauty, "title": StringConstants.beauty},
    {"image": ImageConstants.offers, "title": StringConstants.offers},
    {"image": ImageConstants.fashion, "title": StringConstants.fashion},
    {"image": ImageConstants.home, "title": StringConstants.home},
    {"image": ImageConstants.shirt, "title": StringConstants.shirt},
    {"image": ImageConstants.womanbag, "title": StringConstants.womanBag},
    {"image": ImageConstants.dress, "title": StringConstants.dress},
    {"image": ImageConstants.mobile, "title": StringConstants.mobiles},
  ];
  final List<Map<String, String>> products = [
    {
      "image": ImageConstants.multi,
      "title": StringConstants.multiKit,
      'price': '500',
      'reviews': '87',
    },
    {
      "image": ImageConstants.lipstick,
      "title": StringConstants.lipstick,
      'price': '400',
      'reviews': '86',
    },
    {
      "image": ImageConstants.multi,
      "title": StringConstants.multiKit,
      'price': '500',
      'reviews': '87',
    },
    {
      "image": ImageConstants.lipstick,
      "title": StringConstants.lipstick,
      'price': '400',
      'reviews': '86',
    },
  ];

  void updateCurrentIndex(int index) {
    currentIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
