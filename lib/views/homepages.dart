import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:crm_staff_ticketing/constant_widgets/home/button.dart';
import 'package:crm_staff_ticketing/constant_widgets/home/home_appbar.dart';
import 'package:crm_staff_ticketing/constant_widgets/home/home_container.dart';
import 'package:crm_staff_ticketing/constant_widgets/home/quickaccess_container.dart';
import 'package:crm_staff_ticketing/controller/controller.dart';
import 'package:crm_staff_ticketing/dummy_tools/controlers_dummy.dart/controller_dummy.dart';
import 'package:crm_staff_ticketing/dummy_tools/models_dummy.dart/model_dummy.dart';
import 'package:crm_staff_ticketing/model/model.dart';
import 'package:crm_staff_ticketing/utils/colours.dart';
import 'package:crm_staff_ticketing/utils/curves.dart';
import 'package:crm_staff_ticketing/utils/icons.dart';
import 'package:crm_staff_ticketing/utils/textstyle.dart';
import 'package:crm_staff_ticketing/views/notificationpage.dart';
import 'package:crm_staff_ticketing/views/profile.dart';
import 'package:crm_staff_ticketing/views/ticketdetails.dart';
import 'package:crm_staff_ticketing/views/tickets.dart';

class Homepages extends StatefulWidget {
  const Homepages({super.key});

  @override
  State<Homepages> createState() => _HomepagesState();
}

class _HomepagesState extends State<Homepages> {
  // final TicketStatusController _ticketStatusController = TicketStatusController();
  final TicketController _ticketController =TicketController();

  final QuickaccessController _quickaccessController = QuickaccessController();
  final RecentactivityController _recentactivityController=RecentactivityController();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadpref();
  }

      SharedPreferences ? _readobj ;

late String _id ;

    Future<void>_loadpref()async{
             _readobj = await SharedPreferences.getInstance();
             setState(() {
               _id = _readobj ?.getString('staff_id') ?? "2";
               print("current _id is ${_id}");
             });

       initialize();
             
  }

  Future<void> initialize() async {
    // _ticketStatusController.fetchTicketStatus();
  await _ticketController.fetchDatabase(_id);
    _quickaccessController.fetchTicketStatus();
    _recentactivityController.fetchTicketStatus();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scafoldcolor,
      appBar:  HomeAppbar(
        titletext: 'Dashboard',
        notificationIcon: GestureDetector(
          onTap: (){
              Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Notificationpage()),
          );
          },
          child: notificationicon),
        ontap: () {
        

        },
        profileIcon: CircleAvatar(
          radius: 18,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profilepage(image: 'https://techcrunch.com/wp-content/uploads/2025/01/GettyImages-2173579179.jpg?resize=1280,853',)),
              );
            },
          ),
          backgroundImage: const NetworkImage(
            'https://techcrunch.com/wp-content/uploads/2025/01/GettyImages-2173579179.jpg?resize=1280,853',
          ),
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(screenpadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 110,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TicketPage(status: 'Open',),
                                ),
                              );
                            },
                            child: HomeContainer(
                            
                              // width: 120,
                              color: buttoncolor.withOpacity(0.2),
                              count:
                                      _ticketController.ticketList
                                          .where((t) => t.ticketStatus == 'Open')
                                          .length
                                          .toString(),
                                  options: 'Open',
                                  countcolor: buttoncolor,
                              
                              ),
                          ),
                        ),

                        SizedBox(width: 16,),
                           Expanded(
                            
                             child: GestureDetector(
                               onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TicketPage(status: 'In Progress',),
                                ),
                              );
                            },
                               child: HomeContainer(
                                color: Color(0xFFF59E0B).withOpacity(0.2)
                               ,
                                                         // width: 120,
                                                         count:
                                      _ticketController.ticketList
                                          .where((t) => t.ticketStatus == 'In Progress')
                                          .length
                                          .toString(),
                                  options: 'In Progress',
                                  countcolor: Color(0xFFF59E0B),
                                                         
                                                         ),
                             ),
                           ),

                            SizedBox(width: 16,),

                           Expanded(
                             child: GestureDetector(
                               onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TicketPage(status: 'Resolved',),
                                ),
                              );
                            },
                               child: HomeContainer(
                                         color: Color.fromARGB(255, 0, 170, 51).withOpacity(0.2)
                               ,
                                                         count:
                                      _ticketController.ticketList
                                          .where((t) => t.ticketStatus == 'Resolved')
                                          .length
                                          .toString(),
                                  options: 'Resolved',
                                  countcolor: Color.fromARGB(255, 0, 170, 51),
                                                         
                                                         ),
                             ),
                           ),

                          
                      ]
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text('Quick Access', style: headerstyle),
                  const SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _quickaccessController.quickaccessList.length,
                    itemBuilder: (context, index) {
                      QuickaccessModel quickaccessModel = _quickaccessController.quickaccessList[index];
                      return Padding(
                        padding: const EdgeInsets.only(top: 4.0,bottom: 0),
                        child: GestureDetector(
                          onTap: (){
                            if (quickaccessModel.title == 'All Tickets') {
                              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                                return TicketPage();
                              }));
                            }


                            else if (quickaccessModel.title == 'My Assigned') {
                             print('hiii');
                            } 
                             else if (quickaccessModel.title == 'Reports') {
                            print('hii');
                            } 
                            
                          },

                          
                          child: quickaccesscontainer(
                            height: 82,
                            cir_color: buttoncolor.withOpacity(0.2),
                            con_color: Colors.white,
                            widget: Icon(quickaccessIcons[index], color: buttoncolor,),
                            title: quickaccessModel.title,
                            subtitle: quickaccessModel.subtitle,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Recent Activity', style: headerstyle),

                        
                    ],
                  ),
                  SizedBox(height: 10,),
                 




Container(
  width: double.infinity,
  decoration: BoxDecoration(
    borderRadius: BorderRadiusDirectional.circular(borderRadius),
    border: Border.all(color: lightgrey),
    color: Colors.white,
  ),
  child: ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount:      _ticketController.ticketList.length > 3
                              ? 3
                              : _ticketController.ticketList.length,
    itemBuilder: (context, index) {
      TicketModel ticketModel = _ticketController.ticketList[index];

      // Function to calculate 'time ago'
      String getTimeAgo(DateTime dateTime) {
        final Duration diff = DateTime.now().difference(dateTime);

        if (diff.inSeconds < 60) {
          return 'just now';
        } else if (diff.inMinutes < 60) {
          return '${diff.inMinutes} min ago';
        } else if (diff.inHours < 24) {
          return '${diff.inHours} hr ago';
        } else if (diff.inDays < 7) {
          return '${diff.inDays} day${diff.inDays > 1 ? 's' : ''} ago';
        } else {
          return '${(diff.inDays / 7).floor()} week${(diff.inDays / 7).floor() > 1 ? 's' : ''} ago';
        }
      }
final isLastItem = index ==
          (_ticketController.ticketList.length > 3 ? 2 : _ticketController.ticketList.length - 1);

      return Padding(
        padding: EdgeInsets.only(
          bottom: isLastItem ? 16.0 : 0.0,
          left: 8.0,
          right: 8.0,
        ),
        child: GestureDetector(
              onTap: () {
                
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => TicketDetails(
      ticketId: ticketModel. ticketId,
      subject: ticketModel. subject,
      ticketDescription: ticketModel. ticketDescription,
      priority: ticketModel. priority,
      contactPerson: ticketModel. contactPerson,
      contactNo:  ticketModel.contactNo,
      staffAssigned: ticketModel. staffAssigned,
      workType: ticketModel. workType,
      estimatedTime: ticketModel. estimatedTime,
      ticketStatus: ticketModel. ticketStatus,
      finalStatus:  ticketModel.finalStatus,
      closingRemarks: ticketModel. closingRemarks,
      closingDatetime:  ticketModel.closingDatetime,
      enterUser:  ticketModel.enterUser,
      requestDateTime:  ticketModel.requestDateTime,
      deleteStatus: ticketModel. deleteStatus,
      filePath: ticketModel. filePath,
      uploadedAt: ticketModel. uploadedAt,
      ticketAttachmentsId: ticketModel. ticketAttachmentsId,
      productDescription:  ticketModel.productDescription,
      productId: ticketModel. productId,
      productName: ticketModel. productName,
      commenterId: ticketModel. commenterId,
      comment: ticketModel. comment,
      commentTime: ticketModel. commentTime,
      staff_id:  ticketModel.staff_id,
      staff_name: ticketModel. staff_name,
      staff_position: ticketModel. staff_position,
      staff_image: ticketModel. staff_image,
      staff_status: ticketModel. staff_status,
      color:  ticketModel.ticketStatus == 'In Progress'
                          ? mediumpriority
                          : ticketModel.ticketStatus == 'Open'
                              ? lowpriority
                              : ticketModel.ticketStatus == 'Resolved'
                                  ? resolvedprority
                                  : ticketModel.ticketStatus == 'Closed'
                                      ? highpriority
                                      : Colors.blueGrey,
  colorss:  ticketModel.ticketStatus == 'In Progress'
                          ? mediumpriority
                          : ticketModel.ticketStatus == 'Open'
                              ? lowpriority
                              : ticketModel.ticketStatus == 'Resolved'
                                  ? resolvedprority
                                  : ticketModel.ticketStatus == 'Closed'
                                      ? highpriority
                                      : Colors.blueGrey,
      clientName: ticketModel. clientName,
      clientEmail: ticketModel. clientEmail,
      clientPhone:  ticketModel.clientPhone,
      companyName:  ticketModel.companyName,
      companyAddress: ticketModel. companyAddress,
      companyStatus: ticketModel. companyStatus,
      t_id: ticketModel. t_id,
    ),
  ),
);
              },
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0 , left: 8,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.fiber_manual_record,
                            color: ticketModel.ticketStatus == 'In progress'
                                ? mediumpriority
                                : ticketModel.ticketStatus == 'Open'
                                    ? lowpriority
                                    : ticketModel.ticketStatus == 'Resolved'
                                        ? resolvedprority
                                        : ticketModel.ticketStatus == 'Closed'
                                            ? highpriority
                                            : Colors.blueGrey,
                            size: 10,
                          ),
                          SizedBox(width: 4),
                          Text(ticketModel.ticketId.toString(), style: titlestyle),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(CupertinoIcons.clock, size: 13),
                          SizedBox(width: 2),
                          Text(
                            getTimeAgo(DateTime.parse(ticketModel.requestDateTime.toString())),
                            style: subtitlestyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10), // Reduced spacing
                  Text(ticketModel.ticketDescription.toString(), style: subtitlestyle),
                  if (index != _recentactivityController.RecentactivityList.length - 1)
                    Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: Divider(thickness: 0.6, height: 10), // minimal space taken
                    ),
                   
                ],
              ),
            ),
          ),
        ),
      );
    },
  ),
),









                  SizedBox(height: 20,),
                  Button(
                    buttonColor: buttoncolor,
                    
                    widget: Icon(Icons.add,color: Colors.white,),
                    title: 'New Ticket',
                     buttontextColor: Colors.white,fontSize: 14,fontWeight: FontWeight.w600, onPressed: (){
Navigator.push(context, MaterialPageRoute(builder:(BuildContext){
  return TicketPage();
}));
                  })


                  
                ],
              ),
            ),
    );
  }
}
