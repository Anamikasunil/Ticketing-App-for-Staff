import 'package:crm_staff_ticketing/constant_widgets/home/button.dart';
import 'package:crm_staff_ticketing/utils/colours.dart';
import 'package:crm_staff_ticketing/utils/curves.dart';
import 'package:crm_staff_ticketing/utils/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:crm_staff_ticketing/utils/colours.dart';

class Container2 extends StatelessWidget {
  final String? image;
  final String? title;
  final String? subtitle;
  final String? buttonText;
  final double? height;
  final double? width;
  final double? imageheight;
  final double? imagewidth;
  final TextStyle Cont_titleStyle;
  final TextStyle  Cont_subtitleStyle;
  final VoidCallback? onPressed;
  final Color? buttonColor; // default border radius
  final Color? borderColor; // default border color
  final double? buttoncolor; // default border radius
  const Container2({
    super.key,
    this.height,
    this.width,
    this.image,
    this.title,
    this.subtitle,
    this.buttonText,
    this.imageheight,
    this.imagewidth,
    required  this.Cont_titleStyle,
     required this.Cont_subtitleStyle,
     this.onPressed,
    this.buttonColor,
    this.borderColor,
    this.buttoncolor,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: lightgrey, width: 1.5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(screenpadding),
        child: Row(
          children: [
            Image(
              image: NetworkImage(
                image??'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg',
              ),
              height: imageheight ?? 70,
              width: imagewidth ?? 50,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title ?? '',
                    style: Cont_titleStyle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    subtitle ?? '',
                    style: Cont_subtitleStyle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Button(
              buttonColor: buttonColor,
              bordercolor: borderColor,
              title: buttonText ?? '',
              buttontextColor: Colors.white,
              height: 40,
              width: 150,
              fontSize: 14,
              onPressed: onPressed!,
            ),
          ],
        ),
      ),
    );
  }
}
