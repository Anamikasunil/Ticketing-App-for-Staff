import 'dart:convert';

import 'package:crm_staff_ticketing/API/api.dart';
import 'package:http/http.dart'as http;
import 'package:crm_staff_ticketing/model/model.dart';

class TicketController {
  List<TicketModel> ticketList = [];

  Future<void> fetchDatabase(String id) async {
  
    final response = await http.post(
      Uri.parse(TICKET),
      body: {'staff_assigned': id},
    );

      print('hiii');
      print(TICKET);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<dynamic> listData = data['data'];



      print(response.body);

      
      ticketList =
          listData.map((json) => TicketModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}



class StatusController {
  List<StatusModel> statusList = [];

  Future<void> fetchDatabase(String id) async {
    print('ideeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee  $id');
    print(HISTORY);

    final response = await http.post(
      Uri.parse(HISTORY),
      body: {'ticket_id': id},
    );

    print('hiii');
    print(HISTORY);
    print(response.statusCode);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<dynamic> listData = data['data'];

      print('Response status code: ${response.statusCode}');
      print(response.body);

      if (listData.isEmpty) {
        statusList.add(
        StatusModel(
          statusTime: '',
          statusDescription: 'No',
          filePath: '',
        ),
      );
        print('No data found');
      } else {
        statusList = listData.map((json) => StatusModel.fromJson(json)).toList();
      }
    } else {
      statusList = [];
      print('Request failed with status: ${response.statusCode}');
    }
  }
}




class NotificationController {
  List<NotificationModel> notificationList = [];

  Future<void> fetchDatabase(String id) async {
    print('ideeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee  $id');
        print(NOTIFICATION);

    final response = await http.post(
      Uri.parse(NOTIFICATION),
      body: {'staff_assigned': id},
    );

    print('hiii');
    print(HISTORY);

    print(response.statusCode);


  if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<dynamic> listData = data['data'];


  print('Response status code: ${response.statusCode}');
      print(response.body);

      
      notificationList =
          listData.map((json) => NotificationModel.fromJson(json)).toList();
    }
  else {
        notificationList = [];
        print('No data found or data is not a list.');
      }
    } 
  }


