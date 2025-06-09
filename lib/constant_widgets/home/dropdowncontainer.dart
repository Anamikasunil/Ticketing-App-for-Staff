import 'package:flutter/widgets.dart';
import 'package:crm_staff_ticketing/utils/colours.dart';
import 'package:crm_staff_ticketing/utils/curves.dart';
import 'package:flutter/material.dart';

class DropdownContainer extends StatelessWidget {
  Widget? widget ;
  String texts ;
  Icon? icon;
 
  
   DropdownContainer({super.key ,
  
    this.widget,
    required this.texts,
   this.icon,
    
    });
  // const HomeContainer({super.key, required this.icon, required this.count, required this.options});

  @override
  Widget build(BuildContext context) {
    return Container(
      height:60,
      width: 130,
      
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white, 
      ),

      child: widget 


    );
  }
}