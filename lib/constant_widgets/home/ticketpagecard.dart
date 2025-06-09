import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:crm_staff_ticketing/utils/colours.dart';
import 'package:crm_staff_ticketing/utils/curves.dart';
import 'package:crm_staff_ticketing/utils/textstyle.dart';

class Ticketpagecard extends StatelessWidget {
  final String? peragraph;
  final String? ticketid;
  final String? title;
  final String? subtitle;
  final String? buttonText;
  final double? height;
  final double? width;
  final double? imageheight;
  final double? imagewidth;
  final TextStyle Cont_titleStyle;
  final TextStyle Cont_subtitleStyle;
  final VoidCallback? onPressed;
  final String? status; // Green color
  final TextStyle? statusStyle;
  final Color? statusColor; // Green color
  final String? date;
  final Color? buttonColor; // default border radius
  final Color? borderColor; // default border color
  final double? buttonheight; // default border radius
  final double? buttonwidth; // default border color
 final Color? buttontextColor;
  Widget? widget;
  final String? level;
  final Color? levelcolor;


   Ticketpagecard ({super.key,
  this.height,
    this.width,
   this.peragraph,
    this.title,
    this.subtitle,
    this.ticketid,
    this.buttonText,
    this.imageheight,
    this.imagewidth,
    required this.Cont_titleStyle,
    required this.Cont_subtitleStyle,
    this.onPressed,
    this.status,
    this.statusStyle,
    this.statusColor,
    this.date,
    this.buttonColor,
    this.borderColor, 
    this.buttonheight,
    this.buttonwidth,
    this.buttontextColor,
    this.widget,
    this.level,
    this.levelcolor,
  });



  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        width: width ?? double.infinity,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
           boxShadow: [
         
      ],
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(color: lightgrey, width: .5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(screenpadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Text(ticketid??''),
    if (status != null)
                 Container(
                   decoration: BoxDecoration(
                     color: statusColor,
                     borderRadius: BorderRadius.circular(borderRadius),
                     
                   ),
                   padding:
                       const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                   child: Text(status!, style: TextStyle(color: Colors.white),),
                 ),

    
  ],
),
SizedBox(height: 5,),
Text(title??'',style: Cont_titleStyle,
                  maxLines: 1,
                   overflow: TextOverflow.ellipsis,),
Text(subtitle??'',style: subtitlestyle2,
             maxLines: 1,
             overflow: TextOverflow.ellipsis,),
Text(peragraph??'',),
SizedBox(height: 9,)
,Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
children: [
  Padding(
    padding: const EdgeInsets.only(top: 3),
    child: widget??Text('',style: TextStyle(color: levelcolor),),
  ),

  SizedBox(width: 5,),
  Text(level??'',style: greytextstyle,)
  

],
    ),
    Text(date??'',style: greytextstyle,)

  ],
)

              
                
            ]
          ),
        ),
      ),
    );
  }
}