import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:crm_staff_ticketing/constant_widgets/home/dropdowncontainer.dart';
import 'package:crm_staff_ticketing/constant_widgets/home/home_appbar.dart';
import 'package:crm_staff_ticketing/constant_widgets/home/searchbox.dart';
import 'package:crm_staff_ticketing/constant_widgets/home/searchbox2.dart';
import 'package:crm_staff_ticketing/constant_widgets/home/secondticketcard.dart';
import 'package:crm_staff_ticketing/constant_widgets/home/ticketpagecard.dart';
import 'package:crm_staff_ticketing/dummy_tools/controlers_dummy.dart/controller_dummy.dart';
import 'package:crm_staff_ticketing/dummy_tools/models_dummy.dart/model_dummy.dart';
import 'package:crm_staff_ticketing/utils/colours.dart';
import 'package:crm_staff_ticketing/utils/textstyle.dart';

class Seconticketpage extends StatefulWidget {
  final String id;
  final String ticketid;
  final String level;
  final String updatedstatus;
  final Color color;
  final Color colorss;
  final String status;
  final String date;
  final String title;
  final String subtitle;
  final String peragraph;
  final String cardstatus;
  String? staffname;

  Seconticketpage({
    super.key,
    required this.id,
    required this.ticketid,
    required this.level,
    required this.updatedstatus,
    required this.color,
    required this.colorss,
    required this.status,
    required this.date,
    required this.peragraph,
    required this.subtitle,
    required this.title,
    required this.cardstatus,
    this.staffname
  });

  @override
  State<Seconticketpage> createState() => _SeconticketpageState();
}

class _SeconticketpageState extends State<Seconticketpage> {
  bool isLoading = true;
  final SecondticketcardController _secondticketcardController = SecondticketcardController();
  final gridviewDropdownController controller = gridviewDropdownController();
  
 final TicketcardController _ticketcardController=TicketcardController();
  

  @override
  void initState() {
    super.initState();
    inisialize1();
  }

  void inisialize1() {
    _secondticketcardController.fetchDatabase();
    controller.fetchDatabase();
     _ticketcardController.fetchDatabase();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: HomeAppbar(
        titletext: 'Tickets',
        notificationIcon: Icon(Icons.sort),
        profileIcon:Text('sort' , style: subheaderstyle,),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(screenpadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Searchboxpage2(),
                    SizedBox(height: 20),
                    // ListView.builder without Expanded
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal, // Horizontal scroll
                      child: Row(
                        children: _secondticketcardController.SecondticketcardList.map((secondticketcardModel) {
                          return Container(
                             // Set a fixed width for each card
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color:    Color(0xFFF3F4F6),
 // Set a background color
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            child: Center( // Ensure text is centered
                              child: Text(
                                secondticketcardModel.cardname,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(height: 25,),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: controller.gridviewDropdownList.sublist(0, 2).map((item) {
                        return SizedBox(
            width: 160,
            child: DropdownButtonFormField<String>(
             
              decoration: InputDecoration(
                labelText: item.drop,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                    width: 1.5,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                    width: 1.5,
                  ),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              ),
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Colors.grey.shade700,
              ),
              items: item.values.map((value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  item.selectedValue = value!;
                });
              },
            ),
                        );
                  }).toList(),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: controller.gridviewDropdownList.sublist(2).map((item) {
                        return SizedBox(
            width: 160,
            child: DropdownButtonFormField<String>(
              
              decoration: InputDecoration(
                labelText: item.drop,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                    width: 1.5,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                    width: 1.5,
                  ),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              ),
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Colors.grey.shade700,
              ),
              items: item.values.map((value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  item.selectedValue = value!;
                });
              },
            ),
                        );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(height: 25,),
            
            ListView.builder(
              itemCount: _ticketcardController.TicketcardList.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context,index){
                TicketcardModel ticketcardModel=_ticketcardController.TicketcardList[index];
            
                return Padding(
                  padding: const EdgeInsets.only(top: 8,bottom: 5),
                  child: SecondTicketcard(Cont_titleStyle: titlestyle, Cont_subtitleStyle: subtitlestyle,
                  ticketid: ticketcardModel.ticketid,
                  status: ticketcardModel.status,statusColor: ticketcardModel.color,
                     widget: Icon(Icons.fiber_manual_record,color: ticketcardModel.color,size: 14,),
                     title: ticketcardModel.title,
                     peragraph: ticketcardModel.peragraph,
                     profileicon: CircleAvatar(
            radius: 15,
            backgroundColor: Colors.amber,
                     ),
                     staffname: widget.staffname,
                     icon: Icon(Icons.flag,size: 14,color: ticketcardModel.colorss,),
                     level: ticketcardModel.level,levelcolor: ticketcardModel.colorss,
            
                 
                  
                  ),
                );
            
            })
            
            
            
                     
            
                  ],
                ),
              ),
          ),
    );
  }
}
