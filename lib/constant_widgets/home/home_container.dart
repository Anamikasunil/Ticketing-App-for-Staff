import 'package:flutter/widgets.dart';
import 'package:crm_staff_ticketing/utils/colours.dart';
import 'package:crm_staff_ticketing/utils/curves.dart';
import 'package:flutter/material.dart';

class HomeContainer extends StatelessWidget {
  Icon? icon ;
  String count ;
  String options ;
  final Color? color;
  final Color? countcolor;
  double? width;
  
   HomeContainer({super.key ,

    this.icon,
    required this.count,
    required this.options,
    this.color,
    this.countcolor,
    this.width
    
    });
  // const HomeContainer({super.key, required this.icon, required this.count, required this.options});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
       width: width ?? double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: color 
      ),

      child: Padding(
        padding: const EdgeInsets.all(screenpadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // icon ?? Text(''),
            Text(
              count,
              style: TextStyle(
                fontSize: 20,
                color: countcolor ?? Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Flexible(
              child: Text(
                options,
                overflow: TextOverflow.visible,
                maxLines: 2,
                // softWrap: ,
                style: const TextStyle(
                  fontSize: 14,
                  color:  Color.fromARGB(255, 75, 85, 99),
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}