import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:crm_staff_ticketing/utils/colours.dart';
import 'package:crm_staff_ticketing/utils/curves.dart';
import 'package:crm_staff_ticketing/utils/textstyle.dart';

class SecondTicketcard extends StatelessWidget {


  
  final String? peragraph;
  final String? ticketid;
  final String? title;
  final String? staffname;
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
Widget? profileicon;
Widget? icon;

   SecondTicketcard({super.key,
  this.height,
    this.width,
   this.peragraph,
    this.title,
    this.staffname,
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
    this.profileicon,
    this.icon
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
    Text(ticketid??'',style: addticketstyle,),Row(
      children: [
        if (status != null)
      widget??Text(''),
        SizedBox(width: 5,),
        Text(status??'',style: TextStyle(color: statusColor),)

      ],
    ),
   
  ],
 ),
 SizedBox(height: 3,),
  Text(title??'',style: Cont_titleStyle,
                   maxLines: 1,
                    overflow: TextOverflow.ellipsis,),
                    SizedBox(height: 3,),
 
 Text(peragraph??'',style: subtitlestyle2,),
 SizedBox(height:8 ,),

 Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Row(
      children: [
        profileicon?? Text(''),
        SizedBox(width: 4,),
        Text(staffname??'')



      ],
    ),
    Row(
      children: [
 icon??Text(''),
 SizedBox(width: 3,),
 Text(level??'',style: TextStyle(color: levelcolor),)
 
      ],
    )

  ],
 )

                
            ]
          ),
        ),
      ),
    );
  }
}











 