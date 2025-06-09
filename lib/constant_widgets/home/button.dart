import 'package:crm_staff_ticketing/utils/curves.dart';
import 'package:crm_staff_ticketing/utils/colours.dart';
import 'package:crm_staff_ticketing/utils/curves.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String title;
  final double? height;
  final double? width;
  final VoidCallback onPressed;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? buttonColor; // default border radius
  final Color? bordercolor; // default border color
  final Color? buttontextColor ; 
  final Widget? widget;

   Button({
    super.key,
    this.fontSize,
    this.fontWeight,
    required this.title,
    this.height,
    this.width,
    required this.onPressed,
    this.buttonColor,
    this.bordercolor,
    this.buttontextColor,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50, // default height
      width: width ?? double.infinity, // default width
      child: ElevatedButton(
        onPressed: onPressed ?? () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor ?? Colors.transparent,
          
          shape: RoundedRectangleBorder(
            side:  BorderSide(color: bordercolor ?? Colors.transparent, width: 1.5),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            widget ?? Text(
            ''
            ),
            Text(title ,style:  TextStyle(color: buttontextColor , fontSize: fontSize , fontWeight: fontWeight ?? FontWeight.w600 ),),
          ],
        ),
      ),
    );
  }
}
