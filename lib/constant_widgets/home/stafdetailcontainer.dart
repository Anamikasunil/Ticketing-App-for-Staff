import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:crm_staff_ticketing/utils/colours.dart';
import 'package:crm_staff_ticketing/utils/curves.dart';
import 'package:crm_staff_ticketing/utils/textstyle.dart';

class staffdetailscontainer extends StatelessWidget {
final double? height;
final double? width;
final String? position;
final Widget? circleAvatar;
final String? staffname;



staffdetailscontainer({super.key,
  
  this.height,
  this.width,
this.position,
this.circleAvatar,
this.staffname,

  
  
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
       padding: const EdgeInsets.only(right: 16,left: 16,top: 18,bottom: 18),
       child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            circleAvatar ?? Text(''),
            SizedBox(width: 10,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               
               
                Text(staffname??'',style: headerstyle,),
                Text(position??''),
                
              ],
            )
              
            ],
          ),
       
       
       ],),
     ),

    );
  }
}