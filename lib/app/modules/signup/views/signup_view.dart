import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mxpertz/common/colors.dart';

import '../../../../common/common_widget.dart';
import '../../../../common/responsive_size.dart';
import '../../../../common/text_style.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false),
      body: Obx(() {
        return SingleChildScrollView(
          child: Container(
            height: Get.height * 0.85,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
              horizontal: ResponsiveSize.width(context, 30),
            ),
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    StringConstants.createAccount,
                    style: MTextStyle.titleStyle24bb,
                  ),
                  Text('Sign Up', style: MTextStyle.titleStyle16br),
                  SizedBox(height: ResponsiveSize.height(context, 23)),
                  TextFormField(
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: Color(0xFF7B6F72),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Color(0xFFD6D6D6),
                      ),
                      hintText: 'Email',
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
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF7B6F72),
                          width: 1,
                        ), // Change color here
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else if (!RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                      ).hasMatch(value)) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: controller.passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: !controller.isPasswordVisibles.value,
                    cursorColor: Color(0xFF7B6F72),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock_outline_rounded,
                        color: Color(0xFFD6D6D6),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.isPasswordVisibles.value
                              ? Icons.visibility
                              : Icons.visibility_off_outlined,
                          color: Color(0xFFD6D6D6),
                        ),
                        onPressed: () {
                          controller.isPasswordVisibles.toggle();
                        },
                      ),
                      hintText: 'Special Characters ',
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
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      } else if (!RegExp(
                        r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$',
                      ).hasMatch(value)) {
                        return 'Must contain a letter, number & special character';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: controller.confirmPasswordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: !controller.isPasswordVisibler.value,
                    cursorColor: Color(0xFF7B6F72),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock_outline_rounded,
                        color: Color(0xFFD6D6D6),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.isPasswordVisibler.value
                              ? Icons.visibility
                              : Icons.visibility_off_outlined,
                          color: Color(0xFFD6D6D6),
                        ),
                        onPressed: () {
                          controller.isPasswordVisibler.toggle();
                        },
                      ),
                      hintText: 'Repeat Password',
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
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      } else if (value != controller.passwordController.text) {
                        return 'Repeat Password not match';
                      }
                      return null;
                    },
                  ),
                  Container(
                    height: ResponsiveSize.height(context, 70),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Color(0xFF7B6F72)),
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            showCountryPicker(
                              context: context,
                              showPhoneCode: true,
                              favorite: <String>['AN'],
                              onSelect: (Country country) {
                                controller.phoneCode.value = country.phoneCode;
                                controller.countryFlag.value =
                                    country.flagEmoji; //
                                print(
                                  'Selected Code: +${controller.phoneCode.value}',
                                );
                              },
                              moveAlongWithKeyboard: false,
                              countryListTheme: CountryListThemeData(
                                backgroundColor: Color(0xFFFFF5EA),
                              ),
                            );
                          },
                          child: Obx(
                            () => Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Row(
                                children: [
                                  Image.asset(
                                    ImageConstants.flag, // Load asset image
                                    width: 18, // Adjust flag size
                                    height: 18,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "+${controller.phoneCode.value}",
                                    style: TextStyle(
                                      color: Color(0xFF7B6F72),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_drop_down,
                                    color: secondaryColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: controller.phoneController,
                            keyboardType: TextInputType.phone,
                            cursorColor: Color(0xFF7B6F72),
                            maxLength: 10,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              counterText: '',
                              hintText: 'Mobile Number',
                              hintStyle: TextStyle(
                                color: Color(0xFF7B6F72),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your valid Mobile Number';
                              } else if (value.length < 10) {
                                return 'Mobile number must be 10 digits';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: ResponsiveSize.height(context, 23)),
                  CommonWidget.mainButton(
                    onTap: () {
                      controller.registerUser();
                    },
                    text: 'Next',
                  ),
                  Text('Or Continue With', style: MTextStyle.titleStyle12br),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonWidget.socialButton(
                        imagePath: ImageConstants.apple,
                        name: StringConstants.apple,
                      ),
                      CommonWidget.socialButton(
                        imagePath: ImageConstants.google,
                        name: StringConstants.google,
                        onTap: () {},
                      ),
                      CommonWidget.socialButton(
                        imagePath: ImageConstants.facebook,
                        name: StringConstants.facebook,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
