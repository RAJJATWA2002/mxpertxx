import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mxpertz/app/routes/app_pages.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../common/colors.dart';
import '../../../../common/common_widget.dart';
import '../../../../common/responsive_size.dart';
import '../../../../common/text_style.dart';
import '../controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: GestureDetector(
            child: CircleAvatar(
              child: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: primaryColor,
              ),
              backgroundColor: Color(0xFF1A9EB7).withOpacity(0.2),
            ),
            onTap: () {
              Get.back();
            },
          ),
        ),
        leadingWidth: 66,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          horizontal: ResponsiveSize.width(context, 20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('OTP Verification', style: MTextStyle.titleStyle20bb),
            SizedBox(height: ResponsiveSize.height(context, 15)),
            Text(
              'Enter the verification code we just sent on your email address.',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Color(0xFF8391A1),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: ResponsiveSize.height(context, 34)),
            PinCodeTextField(
              appContext: context,
              length: 4,
              controller: controller.pinController,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                fieldHeight: 50,
                fieldWidth: 50,
                borderRadius: BorderRadius.circular(10),
                borderWidth: 0,
                activeFillColor: primaryColor,
                inactiveFillColor: backgroundColor,
                selectedFillColor: backgroundColor,
                activeColor: backgroundColor,
                inactiveColor: primaryColor,
                selectedColor: primaryColor,
              ),
              textStyle: TextStyle(color: Colors.black),
              enableActiveFill: true,
              keyboardType: TextInputType.number,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              onCompleted: (value) {
                print("$value Completed");
              },
            ),
            SizedBox(height: ResponsiveSize.height(context, 34)),
            CommonWidget.mainButton(
              onTap: () {
                if (controller.pinController.text == "1234") {
                  Get.snackbar(
                    "OTP Verification Success",
                    "Otp Match",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: primaryColor,
                    colorText: Colors.white,
                  );
                  Future.delayed(Duration(seconds: 2), () {
                    Get.offNamed(Routes.NAVBAR);
                  });
                } else {
                  Get.snackbar(
                    "OTP Verification Failed",
                    "Otp Not Match",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                  );
                }
              },
              text: 'VERIFY',
            ),
          ],
        ),
      ),
    );
  }
}
