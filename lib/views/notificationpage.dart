import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart' show SharedPreferences;
import 'package:crm_staff_ticketing/constant_widgets/home/home_appbar.dart';
import 'package:crm_staff_ticketing/constant_widgets/home/notificationcontainer.dart';
import 'package:crm_staff_ticketing/controller/controller.dart';
import 'package:crm_staff_ticketing/dummy_tools/controlers_dummy.dart/controller_dummy.dart';
import 'package:crm_staff_ticketing/dummy_tools/models_dummy.dart/model_dummy.dart';
import 'package:crm_staff_ticketing/model/model.dart';
import 'package:crm_staff_ticketing/utils/colours.dart';
import 'package:crm_staff_ticketing/utils/notificatio.dart';
import 'package:crm_staff_ticketing/utils/textstyle.dart';

class Notificationpage extends StatefulWidget {
  Notificationpage({super.key});

  @override
  State<Notificationpage> createState() => _NotificationpageState();
}

class _NotificationpageState extends State<Notificationpage> {
  bool isLoading = true;
  // final NotificationController _notificationController = NotificationController();
  // final NotificationcardController _notificationcardController = NotificationcardController();
  NotificationController _notificationController = NotificationController();

  @override
  void initState() {
    super.initState();
    // initialize();
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
   await _notificationController.fetchDatabase(_id);
    //  _notificationcardController.fetchDatabase();
    setState(() {
      isLoading = false;
    });
  }

  String fixTimeFormat(String input) {
    final parts = input.split(' ');
    if (parts.length != 2) return input;

    final date = parts[0];
    final timeParts = parts[1].split(':');
    if (timeParts.length < 3) return input;

    String hour = timeParts[0].padLeft(2, '0');
    String minute = timeParts[1].padLeft(2, '0');
    String secondParts = timeParts[2];

    return "$date $hour:$minute:$secondParts";
  }

  String formatTimeAgo(DateTime notificationTime) {
    final difference = DateTime.now().difference(notificationTime);

    if (difference.inMinutes < 1) {
      return "Just now";
    } else if (difference.inMinutes < 60) {
      return "${difference.inMinutes} min ago";
    } else if (difference.inHours < 24) {
      return "${difference.inHours} hr ago";
    } else {
      return "${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: HomeAppbar(
        titletext: 'Notification',
        profileIcon: Text(
          'Mark all read',
          style: TextStyle(color: buttoncolor, fontWeight: FontWeight.w500, fontSize: 16),
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(screenpadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: _notificationController.notificationList.map((NotificationModel) {
                          return Container(
                            
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xFFF3F4F6)
,
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            child: Center(
                              child: Text(
                                NotificationModel.title.toString(),
                                style: subtitlestyle2,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ListView.builder(
                      itemCount: _notificationController.notificationList.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        NotificationModel  notificationModel = _notificationController.notificationList[index];

                        DateTime notificationTime;
                        try {
                          notificationTime = DateTime.parse(fixTimeFormat(notificationModel.date.toString()));
                        } catch (e) {
                          notificationTime = DateTime.now();
                        }

                        final formattedTime = formatTimeAgo(notificationTime);

                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            notificationModel.type == 'Assignment'
                                ? ticketicon
                                : notificationModel.type == 'Updates'
                                    ? updateicon
                                    : notificationModel.type == 'Response'
                                        ? responseicon
                                        : SizedBox(),
                            Expanded(
                              child: Notificationcontainer(
                                title: notificationModel.title,
                                subtitle: notificationModel.descrption,
                                ticketid: notificationModel.ticketId,
                                time: formattedTime,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
