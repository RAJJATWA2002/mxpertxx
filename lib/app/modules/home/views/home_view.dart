import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mxpertz/app/data/constants/image_constants.dart';
import 'package:mxpertz/app/modules/home/controllers/home_controller.dart';
import 'package:mxpertz/common/colors.dart';
import 'package:mxpertz/common/responsive_size.dart';
import 'package:mxpertz/common/text_style.dart';

import '../../../../common/auth_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key) {
    Get.put(HomeController());
  }

  @override
  Widget build(BuildContext context) {
    final User? user = AuthController.instance.user;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Image.asset(ImageConstants.menu),
        ),
        title: Image.asset(
          ImageConstants.splash,
          height: ResponsiveSize.height(context, 33.57),
          width: ResponsiveSize.width(context, 63.05),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(Icons.search_rounded, color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Image.asset(ImageConstants.scan),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text(
                "Hi, ${user!.displayName ?? ''}",
                style: MTextStyle.titleStyle16br,
              ),
              Text(
                'What are you looking for today?',
                style: MTextStyle.titleStyle24bb,
              ),
              SizedBox(height: 10),
              CarouselSlider(
                items:
                    controller.imagePaths.map((imagePath) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(imagePath, fit: BoxFit.cover),
                      );
                    }).toList(),
                options: CarouselOptions(
                  height: ResponsiveSize.height(context, 210),
                  autoPlay: true,
                  viewportFraction: 1.0,
                  onPageChanged: (index, reason) {
                    controller.updateCurrentIndex(index);
                  },
                ),
              ),
              SizedBox(height: 10),
              Obx(
                () => Align(
                  alignment: Alignment.center,
                  child: DotsIndicator(
                    dotsCount: controller.imagePaths.length,
                    position: controller.currentIndex.toDouble(),
                    decorator: DotsDecorator(
                      color: Colors.grey,
                      activeColor: secondaryColor,
                      size: Size.square(8),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              SizedBox(
                height: 25,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.list1.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        controller.list1[index],
                        style: TextStyle(
                          fontSize: 12,
                          color: blackColor,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 5),
              Container(
                height: 5,
                color: secondaryColor,
                width: Get.width * 0.22,
                margin: const EdgeInsets.only(left: 100),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'See More',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: secondaryColor,
                  ),
                ),
              ),
              SizedBox(height: 15),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.8,
                ),
                itemCount: controller.gridItems.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        controller.gridItems[index]["image"]!,
                        height: 47,
                        width: 47,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 5),
                      Text(
                        controller.gridItems[index]["title"]!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF9098B1),
                        ),
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: 20),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.6,
                ),
                itemCount: controller.products.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(color: Colors.grey.shade300, blurRadius: 4),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0, left: 20),
                          child: Image.asset(ImageConstants.heart),
                        ),
                        Image.asset(
                          controller.products[index]["image"]!,
                          height: 135,
                          width: 155,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 5),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                controller.products[index]["title"]!,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  color: secondaryColor,
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.shopping_cart,
                                      color: backgroundColor,
                                    ),
                                    Text(
                                      'Add',
                                      style: TextStyle(color: backgroundColor),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          "₹${controller.products[index]["price"]}",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  Image.asset(ImageConstants.star),
                                  Text('4.6', style: TextStyle(fontSize: 10)),
                                ],
                              ),
                              SizedBox(width: 10),
                              Text(
                                '86 Reveiws',
                                style: TextStyle(fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
