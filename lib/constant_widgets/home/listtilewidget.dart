import 'package:flutter/material.dart';
import 'package:crm_staff_ticketing/utils/colours.dart';
import 'package:crm_staff_ticketing/utils/curves.dart';

class ListTileWidget extends StatelessWidget {

final Widget? listtile1;
final Widget ?listtile2;
final Widget? listtile3;


   ListTileWidget({super.key,this.listtile1,this.listtile2,this.listtile3});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
         Card(
      elevation: 2,
      child: Container(
        width:  double.infinity,
       
        decoration: BoxDecoration(
          color: Colors.white,
           boxShadow: [
         
      ],
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(color: lightgrey, width: .5),
        ),
        child: listtile1??Text(''),
      )

        )
        ],
      ),
    );
  }
}