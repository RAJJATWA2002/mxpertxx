import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mxpertz/app/routes/app_pages.dart';

import '../../../../common/colors.dart';
import '../../../../common/responsive_size.dart';
import '../../../../common/text_style.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/onboarding_one_controller.dart';

class OnboardingOneView extends GetView<OnboardingOneController> {
  const OnboardingOneView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: ResponsiveSize.height(context, 484),
              child: SvgPicture.asset(
                ImageConstants.onbording1,
                height: ResponsiveSize.height(context, 256.09),
                width: ResponsiveSize.width(context, 301),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(ResponsiveSize.width(context, 20)),
                alignment: Alignment.center,
                width: Get.width,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      StringConstants.onlinepayment,
                      style: MTextStyle.titleStyle20sb,
                    ),
                    Text(
                      StringConstants.random,
                      style: MTextStyle.titleStyle12gm,
                      textAlign: TextAlign.center,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: Get.width * 0.15),
                        GestureDetector(
                          child: Text(
                            StringConstants.skip,
                            style: MTextStyle.titleStyle16sb,
                          ),
                          onTap: () {
                            // Get.toNamed(Routes.LOGIN);
                          },
                        ),
                        GestureDetector(
                          child: Image.asset(ImageConstants.nextarrow),
                          onTap: () {
                            Get.toNamed(Routes.ONBOARDING_TWO);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
