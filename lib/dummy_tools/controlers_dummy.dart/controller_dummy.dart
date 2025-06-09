import 'package:flutter/material.dart';
import 'package:crm_staff_ticketing/dummy_tools/models_dummy.dart/model_dummy.dart';
import 'package:crm_staff_ticketing/utils/colours.dart';



// class TicketStatusController {
//   List<TicketStatusModel> ticketStatusList = [];

//   void fetchTicketStatus() {
//     final data = {
//       'data': [
//         {'id': 1, 'name': 'Open Tickets', 'count': '12'},
//         {'id': 2, 'name': 'In Progress', 'count': '7'},
//         {'id': 3, 'name': 'Resolved', 'count': '20'},
        
//       ],
//     };

//     ticketStatusList = (data['data'] as List)
//         .map((item) => TicketStatusModel.fromJson(item))
//         .toList();

//         print(ticketStatusList[0].name);
//   }
  
// }



class QuickaccessController {
  List<QuickaccessModel> quickaccessList = [];

  void fetchTicketStatus() {
    final data = {

      'data': [
  {'id': 1, 'title': 'All Tickets', 'subtitle': 'View and manage all tickets', },
  {'id': 2, 'title': 'My Assigned', 'subtitle': 'Tcket assigned to you', },
  {'id': 3, 'title': 'Reports', 'subtitle': 'View detailed analytics', },
],

    };

    quickaccessList = (data['data'] as List)
        .map((item) => QuickaccessModel.fromJson(item))
        .toList();

        print(quickaccessList[0].title);
  }
  
}



class RecentactivityController {
  List<RecentactivityModel> RecentactivityList = [];

  void fetchTicketStatus() {
    final data = {

      'data': [
  {'id': 5846, 'color':Colors.blue,'ticketid': 'Tk-1234', ' issue': 'Network connectivity issue','duration': '2h ago'},
  {'id': 5846,'color':Colors.amber, 'ticketid': 'Tk-1233', ' issue': 'Software installation','duration': '3h ago'},
  {'id': 5846, 'color':Colors.green, 'ticketid': 'Tk-1232', ' issue': 'Password reset request','duration': '5h ago'},
  ],

    };

    RecentactivityList = (data['data'] as List)
        .map((item) => RecentactivityModel.fromJson(item))
        .toList();

        // print(ticketStatusList[0].name);
  }
  
}




class DropdownController {
  List<DropdownModel> DropdownList = [];

  void fetchDatabase() {
    final data = {
      'data': [
        {'id': 1, 'drop': 'Priority'},
        {'id': 2, 'drop': 'Status'},
        {'id': 3, 'drop': 'Date'},
      ],
    };

    DropdownList = (data['data'] as List)
        .map((item) => DropdownModel.fromJson(item))
        .toList();

    // Assign dummy values and default selections
    for (var item in DropdownList) {
      if (item.drop == 'Priority') {
        item.values = ['priority', 'Medium', 'Low'];
        item.selectedValue = 'priority';
      } else if (item.drop == 'Status') {
        item.values = ['Status', 'Closed', 'Pending'];
        item.selectedValue = 'Status';
      } else if (item.drop == 'Date') {
        item.values = ['Date', 'Yesterday', 'Last Week'];
        item.selectedValue = 'Date';
      }
    }
  }
}




class TicketcardController {
  List<TicketcardModel> TicketcardList = [];

  void fetchDatabase() {
    final data = {

      'data': [
  {'id': 1, 'ticketid': 'TK-2034', 'title': 'Acme Corporation', 'status': 'open', 'subtitle':'Cloud Mnagmenent Suit' , 'peragraph':'Unable to access dashboard after recent update','date':'Feb15 2024','color':Colors.green,'level':'High','colorss':Colors.red,'cardstatus':'Active','updatedstatus':'updated 2h ago'},
     {'id': 2, 'ticketid': 'TK-2035', 'title': 'Acme Corporation', 'status': 'in-progress', 'subtitle':'Cloud Mnagmenent Suit' , 'peragraph':'Unable to access dashboard after recent update','date':'Feb15 2024','color':buttoncolor,'level':'Low','colorss':Colors.green,'cardstatus':'Active','updatedstatus':'updated 3h ago'},
     {'id': 3, 'ticketid': 'TK-2036', 'title': 'Acme Corporation', 'status': 'Closed', 'subtitle':'Cloud Mnagmenent Suit' , 'peragraph':'Unable to access dashboard after recent update','date':'Feb15 2024','color':Colors.orange,'level':'Medium','colorss':Colors.orange,'cardstatus':'Active','updatedstatus':'updated 2h ago'},
    {'id': 4, 'ticketid': 'TK-2037', 'title': 'Acme Corporation', 'status': 'Resolved', 'subtitle':'Cloud Mnagmenent Suit' , 'peragraph':'Unable to access dashboard after recent update','date':'Feb15 2024','color':Color.fromARGB(198, 113, 112, 112),'level':'High','colorss':Colors.red,'cardstatus':'Active','updatedstatus':'updated 2h ago'}, 
     
      ]

    };

    TicketcardList = (data['data'] as List)
        .map((item) => TicketcardModel.fromJson(item))
        .toList();

       
  }
  
}



class TicketdetailsController {
  List<TicketdetailsModel> TicketdetailsList = [];

  void fetchDatabase() {
    final data = {

      'data': [
  {'id': 1, 'commentername': 'John Smith', 'clientdes': 'Premium Client', 'email': 'johnsmith@gmail.com', 'phonenumber':'7689546732' , 'staffname':'Sarah Wilson','position':'Senior Supportive Engineer',
  'commenterimage':'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg','staffimage':'https://plus.unsplash.com/premium_photo-1690407617542-2f210cf20d7e?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29ufGVufDB8fDB8fHww',
  'issue':'A paragraph is a self-contained unit of writing that develops a single main idea or point. It typically consists of several sentences that are organized and coherent, all related to that central topic. Paragraphs are a fundamental building block of longer written works, helping to structure and organize information for clarity and readability',
  'date':'Created on Dec 15,2023 at 10:30 AM'},
   
     
      ]

    };

    TicketdetailsList = (data['data'] as List)
        .map((item) => TicketdetailsModel.fromJson(item))
        .toList();

       
  }
  
}






class TicketHistoryController {
  final List<Map<String, dynamic>> _historyData = [
    {
      'time': '11:30 AM',
      'user': 'Sarah Wilson',
      'message': 'Status updated to Active',
      'attachment': null,
    },
    {
      'time': '11:15 AM',
      'user': 'John Smith',
      'message': 'Added screenshot of error',
      'attachment': 'error-screenshot.png (2.4 MB)',
    },
    {
      'time': '10:45 AM',
      'user': 'Sarah Wilson',
      'message': 'Added technical notes\n\nInvestigating the root cause. Initial analysis suggests cache invalidation issue.',
      'attachment': null,
    },
  ];

  List<TicketHistoryModel> getTicketHistory() {
    return _historyData
        .map((entry) => TicketHistoryModel.fromJson(entry))
        .toList();
  }
}




class SecondticketcardController {
  List<SecondticketcardModel> SecondticketcardList = [];

  void fetchDatabase() {
    final data = {
      'data': [
        {'id': 1, 'cardname': 'All Ticket'},
        {'id': 2, 'cardname': 'Open'},
        {'id': 3, 'cardname': 'Resolved'},
        {'id': 3, 'cardname': 'Pending'},
        {'id': 3, 'cardname': 'Closed'},


      ],
    };

    SecondticketcardList = (data['data'] as List)
        .map((item) => SecondticketcardModel.fromJson(item))
        .toList();
  }
}





class gridviewDropdownController {
  List<gridviewDropdownModel> gridviewDropdownList = [];

  void fetchDatabase() {
    final data = {
      'data': [
        {'id': 1, 'drop': 'Status'},
        {'id': 2, 'drop': 'Priority'},
        {'id': 3, 'drop': 'Date Arrange'},
         {'id': 4, 'drop': 'Assigned Staff'},
      ],
    };
gridviewDropdownList = (data['data'] as List)
        .map((item) => gridviewDropdownModel.fromJson(item))
        .toList();

    // Assign dummy values and default selections
    for (var item in gridviewDropdownList) {
      if (item.drop == 'Status') {
        item.values = ['Status', 'Closed', 'Pending'];
        item.selectedValue ='Status';
      } else if (item.drop == 'Priority') {
        item.values = ['Priority', 'Medium', 'Low'];
        item.selectedValue = 'Priority';
      } else if (item.drop == 'Date Arrange') {
        item.values = ['Date Arrange', 'Yesterday', 'Last Week'];
        item.selectedValue = 'Date Arrange';
      }
      else if (item.drop == 'Assigned Staff') {
        item.values = ['Assigned Staff', 'Yesterday', 'Last Week'];
        item.selectedValue = 'Assigned Staff';
      }
    }
  }
}






// class NotificationController {
//   List<NotificationModel> NotificationList = [];

//   void fetchTicketStatus() {
//     final data = {
//       'data': [
//         {'id': 1,'type':'Assignment', 'title': 'New Ticket Assigned', 'time': '2025-04-18 00:1:29.000000','description':'Server performance optimization required for AWS instance','ticketid':'Ticket#1234'},
//          {'id': 3,'type':'Updates', 'title': 'Status Updated', 'time': '2025-04-18 00:1:29.000000','description':'Server performance optimization required for AWS instance','ticketid':'Ticket#1234'},
//           {'id': 1, 'type':'Response','title': 'Client Response', 'time': '2025-04-18 00:1:29.000000','description':'Server performance optimization required for AWS instance','ticketid':'Ticket#1234'},
        
//       ],
//     };

//     NotificationList = (data['data'] as List)
//         .map((item) => NotificationModel.fromJson(item))
//         .toList();

//         print(NotificationList[0].name);
//   }
  
// }





// class NotificationcardController {
//   List<NotificationcardModel> NotificationcardList = [];

//   void fetchDatabase() {
//     final data = {
//       'data': [
//         {'id': 1, 'cardname': 'All'},
//         {'id': 2, 'cardname': 'Assignments'},
//         {'id': 3, 'cardname': 'Updates'},
//         {'id': 3, 'cardname': 'Response'},
        


//       ],
//     };

//     NotificationcardList = (data['data'] as List)
//         .map((item) => NotificationcardModel.fromJson(item))
//         .toList();
//   }
// }
