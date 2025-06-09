import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:crm_staff_ticketing/utils/colours.dart';
import 'package:crm_staff_ticketing/utils/curves.dart';
import 'package:crm_staff_ticketing/utils/textstyle.dart';

class CardPage extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget? textformfields;
  final String? text;
  const CardPage({super.key,
  this.height,
  this.width,
  this.textformfields,
  this.text});

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
              Text(text??'',style: titlestyle,),
              SizedBox(height: 5,),
              textformfields??Text('')
            
                     
         

              
                
            ]
          ),
        ),
      ),
    );
  }
}