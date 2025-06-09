import 'package:flutter/material.dart';
import 'package:crm_staff_ticketing/utils/colours.dart';
import 'package:crm_staff_ticketing/utils/consts.dart';
import 'package:crm_staff_ticketing/utils/curves.dart';
import 'package:crm_staff_ticketing/utils/textstyle.dart';



class quickaccesscontainer extends StatelessWidget {
  double ? height;
  double ? width;
  Color ? con_color;
  Color? cir_color ;
  Widget? widget ;
  String? title;
  String? subtitle ;


   quickaccesscontainer({super.key,
    this.con_color,
    this.height,
    this.width,
    this.cir_color,
    this.subtitle,
    this.title,
    this.widget
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: lightgrey),
        color: con_color
      ),

      height: height,
      width: width,
      child: Padding(
        padding: const EdgeInsets.all(screenpadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
        
            CircleAvatar(
              radius: 30,
              backgroundColor: cir_color,
              child: widget  
        
            ),
        
            SizedBox(width: 15,),
         
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
        
                Text(title ?? '', style: titlestyle,),
                Text(subtitle ?? '' , style: subtitlestyle,)
        
              ],
            )
        
                     
          ],
        ),
      ),

    );
  }
}