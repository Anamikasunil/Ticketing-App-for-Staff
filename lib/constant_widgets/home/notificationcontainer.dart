import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:crm_staff_ticketing/utils/colours.dart';
import 'package:crm_staff_ticketing/utils/textstyle.dart';

class Notificationcontainer extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? time;
  final String? ticketid;
  Widget? widget;
  Widget? circleavatar;
  final TextOverflow? overflow ;
  final int? maxLines ;
   Notificationcontainer({super.key,
   this.circleavatar,
   this.subtitle,
   this.ticketid,
   this.time,
   this.title,
   this.widget,
   this.maxLines,
   this.overflow});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(screenpadding),
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  SizedBox(width: 8,),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title??'',style: titlestyle,),
                        Text(
                          subtitle ?? '',
                          style: subtitlestyle2,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        // Text(subtitle??'',style: subheaderstyle,  maxLines: maxLines ?? 2,
                        //   overflow: overflow ?? TextOverflow.ellipsis,),
                        Text(ticketid??'',style: subtitlestyle2,overflow: TextOverflow.visible,maxLines: 100,softWrap: true,)
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text(time??'',style: subtitlestyle,)
          
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      
      ),
    );
}
}