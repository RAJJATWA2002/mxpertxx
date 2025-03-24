import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mxpertz/common/common_widget.dart';

import '../../../../common/responsive_size.dart';
import '../../../../common/text_style.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: ResponsiveSize.width(context, 20)),
            child: Icon(Icons.close),
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: Get.height * 0.85,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
            horizontal: ResponsiveSize.width(context, 30),
          ),
          child: Form(
            key: controller.loginformkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(ImageConstants.splash),
                Text(
                  StringConstants.welcomeback,
                  style: MTextStyle.titleStyle24bb,
                ),
                Text('Login to continue'),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  cursorColor: Color(0xFF7B6F72),
                  focusNode: FocusNode(skipTraversal: true),
                  decoration: InputDecoration(
                    prefixIcon: SizedBox(
                      height: ResponsiveSize.height(context, 20),
                      width: ResponsiveSize.width(context, 12),
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        // Adjust padding as needed
                        child: SvgPicture.asset(
                          ImageConstants.phone,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    hintText: 'Phone Number',
                    hintStyle: TextStyle(
                      color: Color(0xFF7B6F72),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF7B6F72),
                        width: 0.5,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF7B6F72),
                        width: 1,
                      ), // Change color here
                      borderRadius: BorderRadius.circular(8),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF7B6F72),
                        width: 1,
                      ), // Change color here
                      borderRadius: BorderRadius.circular(8),
                    ),
                    counterText: '',
                  ),
                  maxLength: 10,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    } else if (value.length < 10) {
                      return 'Phone number must be at least 10 digits';
                    }
                    return null;
                  },
                ),
                CommonWidget.mainButton(
                  onTap: () {
                    if (controller.loginformkey.currentState!.validate()) {
                      Get.toNamed(Routes.OTP);
                    } else {
                      Get.snackbar(
                        "Validation Failed",
                        "Fill Mobile Number",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                      );
                    }
                  },
                  text: 'Get OTP',
                ),
                Text('Or Continue With', style: MTextStyle.titleStyle12br),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CommonWidget.socialButton(
                      imagePath: ImageConstants.google,
                      name: StringConstants.google,
                      onTap: () {
                        controller.signInWithGoogle();
                      },
                    ),
                    SizedBox(width: Get.width * 0.05),
                    CommonWidget.socialButton(
                      imagePath: ImageConstants.facebook,
                      name: StringConstants.facebook,
                    ),
                  ],
                ),
                GestureDetector(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Don’t have an account?",
                          style: MTextStyle.titleStyle12gm,
                        ),
                        TextSpan(
                          text: 'SIGN UP',
                          style: MTextStyle.titleStyle18pb,
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Get.toNamed(Routes.SIGNUP);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
