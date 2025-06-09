import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:crm_staff_ticketing/utils/colours.dart';
import 'package:crm_staff_ticketing/utils/curves.dart';
import 'package:crm_staff_ticketing/utils/textstyle.dart';

class Ticketsdetailscontainer extends StatelessWidget {
final double? height;
final double? width;
final String? image;
final String ?name;
final String? clientdes;
final String? email;
final String?phonenumber;
final Widget? widget;
final String? position;
final Widget? circleAvatar;
final String? staffname;
final Widget? icon;
final Widget? sizedbox;


  Ticketsdetailscontainer({super.key,
  this.image,
  this.height,
  this.name,
  this.width,
  this.clientdes,
  this.phonenumber,
this.widget,
this.email,
this.position,
this.circleAvatar,
this.icon,
this.staffname,
this.sizedbox,

  
  
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: lightgrey ),
        color:Colors.white
      ),

      height: height  ,
      width: width,
     child: Padding(
       padding: const EdgeInsets.only(right: 16,left: 16,top: 8,bottom: 8),
       child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          Row(
            children: [
            circleAvatar ?? Text(''),
            SizedBox(width: 10,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               
               
                Text(name??'',style: headerstyle,),
                Text(clientdes??'',style: subtitlestyle2,),
                
              ],
            )
              
            ],
          ),
          SizedBox(height: 10,),
        Row(
          children: [
            widget??Text(''),
            SizedBox(width: 10,),
            Text(email??'')
          ],
        ),
        SizedBox(height: 10,),
         Row(
          children: [
            icon??Text(''),
            SizedBox(width: 10,),
            Text(phonenumber??'')
          ],
        )
       
       ],),
     ),

    );
  }
}