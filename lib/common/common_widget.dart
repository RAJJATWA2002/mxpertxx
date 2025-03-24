import 'package:flutter/material.dart';
import 'package:mxpertz/common/text_style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'colors.dart';

class CommonWidget {
  static Widget mainButton({
    double? height,
    double? width,
    double? borderRadius,
    Color? buttonColor,
    TextStyle? textStyle,
    Decoration? decoration,
    required VoidCallback onTap,
    required String text,
    Widget? child,
  }) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        width: width ?? 315.px,
        height: height ?? 60.px,
        decoration:
            decoration ??
            BoxDecoration(
              color: buttonColor ?? primaryColor,
              borderRadius: BorderRadius.circular(borderRadius ?? 50.px),
            ),
        child:
            child ??
            Text(
              text,
              style:
                  textStyle ??
                  TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: backgroundColor,
                  ),
            ),
      ),
      onTap: onTap,
    );
  }

  static Widget socialButton({
    required String imagePath,
    required String name,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 57.px,
        width: 90.33.px,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(15.px),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(imagePath),
            Text(name, style: MTextStyle.titleStyle12br),
          ],
        ),
      ),
    );
  }
}
