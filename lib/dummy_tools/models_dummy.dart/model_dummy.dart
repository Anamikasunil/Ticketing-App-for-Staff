import 'package:flutter/material.dart';

class TicketStatusModel {
  final int id;
  final String name;
  final String count;

  TicketStatusModel({
    required this.id,
    required this.name,
    required this.count,
  });

  factory TicketStatusModel.fromJson(Map<String, dynamic> json) {
    return TicketStatusModel(
      id: json['id'],
      name: json['name'],
      count: json['count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'count': count,
    };
  }
}




class QuickaccessModel {
  final int id;
  final String title;
  final String subtitle;


  QuickaccessModel({
    required this.id,
    required this.title,
    required this.subtitle,
    
  });

  factory QuickaccessModel.fromJson(Map<String, dynamic> json) {
    return QuickaccessModel(
      id: json['id'],
      title: json['title'],
      subtitle: json['subtitle'],
    
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      
    };
  }
}


class RecentactivityModel {
  final int id;
  final Color color;
  final String ticketid;
  final String issue;
  final String duration;

  RecentactivityModel({
    required this.id,
    required this.color,
    required this.ticketid,
    required this.issue,
    required this.duration,
  });

  factory RecentactivityModel.fromJson(Map<String, dynamic> json) {
    return RecentactivityModel(
      id: json['id'],
      color: json['color'],
      ticketid: json['ticketid'],
      issue: json[' issue'], // note the space before 'issue'
      duration: json['duration'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'color': color,
      'ticketid': ticketid,
      ' issue': issue, // keep same key if used this way in your backend
      'duration': duration,
    };
  }
}

class DropdownModel {
  final int id;
  final String drop;
  List<String> values;
  String selectedValue;

  DropdownModel({
    required this.id,
    required this.drop,
    required this.values,
    required this.selectedValue,
  });

  factory DropdownModel.fromJson(Map<String, dynamic> json) {
    return DropdownModel(
      id: json['id'],
      drop: json['drop'],
      values: [], // set later
      selectedValue: '', // set later
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'drop': drop,
      'values': values,
      'selectedValue': selectedValue,
    };
  }
}



class TicketcardModel {
  final int id;
  final String ticketid;
  final String title;
  final String status;
  final String subtitle;
  final String peragraph;
  final String date;
  final Color color;
  final String level;
  final Color colorss;
  final String cardstatus;
  final String updatedstatus;

  TicketcardModel({
    required this.id,
    required this.ticketid,
    required this.title,
    required this.status,
    required this.subtitle,
    required this.peragraph,
    required this.date,
    required this.color,
    required this.level,
    required this.colorss,
    required this.cardstatus,
      required this.updatedstatus,
  });

  factory TicketcardModel.fromJson(Map<String, dynamic> json) {
    return TicketcardModel(
      id: json['id'],
      ticketid: json['ticketid'],
      title: json['title'],
      status: json['status'],
      subtitle: json['subtitle'],
      peragraph: json['peragraph'],
      date: json['date'],
      color: json['color'], // Assume it's already a Color object
      level: json['level'],
      colorss: json['colorss'], // Assume it's already a Color object
      cardstatus: json['cardstatus'],
        updatedstatus: json['updatedstatus'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'ticketid': ticketid,
      'title': title,
      'status': status,
      'subtitle': subtitle,
      'peragraph': peragraph,
      'date': date,
      'color': color,       // Direct Color object (only works for internal maps)
      'level': level,
      'colorss': colorss,   // Same here
      'cardstatus': cardstatus,
      'updatedstatus': updatedstatus,
    };
  }
}


class TicketdetailsModel {
  final int id;
  final String commenterName;
  final String clientDes;
  final String email;
  final String phoneNumber;
  final String staffName;
  final String position;
  final String commenterImage;
  final String staffImage;
  final String issue;
  final String date;

  TicketdetailsModel({
    required this.id,
    required this.commenterName,
    required this.clientDes,
    required this.email,
    required this.phoneNumber,
    required this.staffName,
    required this.position,
    required this.commenterImage,
    required this.staffImage,
    required this.issue,
    required this.date,
  });

  factory TicketdetailsModel.fromJson(Map<String, dynamic> json) {
    return TicketdetailsModel(
      id: json['id'],
      commenterName: json['commentername'],
      clientDes: json['clientdes'],
      email: json['email'],
      phoneNumber: json['phonenumber'],
      staffName: json['staffname'],
      position: json['position'],
      commenterImage: json['commenterimage'],
      staffImage: json['staffimage'],
      issue: json['issue'],
      date: json['date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'commentername': commenterName,
      'clientdes': clientDes,
      'email': email,
      'phonenumber': phoneNumber,
      'staffname': staffName,
      'position': position,
      'commenterimage': commenterImage,
      'staffimage': staffImage,
      'issue': issue,
      'date': date,
    };
  }
}



class TicketHistoryModel {
  final String time;
  final String user;
  final String message;
  final String? attachment;

  TicketHistoryModel({
    required this.time,
    required this.user,
    required this.message,
    this.attachment,
  });

  factory TicketHistoryModel.fromJson(Map<String, dynamic> json) {
    return TicketHistoryModel(
      time: json['time'],
      user: json['user'],
      message: json['message'],
      attachment: json['attachment'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'time': time,
      'user': user,
      'message': message,
      'attachment': attachment,
    };
  }
}



class SecondticketcardModel {
  final int id;
  final String cardname;

  SecondticketcardModel({
    required this.id,
    required this.cardname,
  });

  factory SecondticketcardModel.fromJson(Map<String, dynamic> json) {
    return SecondticketcardModel(
      id: json['id'],
      cardname: json['cardname'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cardname': cardname,
    };
  }
}




class gridviewDropdownModel {
  final int id;
  final String drop;
  List<String> values;
  String selectedValue;

  gridviewDropdownModel({
    required this.id,
    required this.drop,
    required this.values,
    required this.selectedValue,
  });

  factory gridviewDropdownModel.fromJson(Map<String, dynamic> json) {
    return gridviewDropdownModel(
      id: json['id'],
      drop: json['drop'],
      values: [], // set later
      selectedValue: '', // set later
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'drop': drop,
      'values': values,
      'selectedValue': selectedValue,
    };
  }
}




// class NotificationModel {
//   final int id;
//   final String name;
//   final String time;
//   final String description;
//   final String ticketId;
//   final String type;

//   NotificationModel({
//     required this.id,
//     required this.name,
//     required this.time,
//     required this.description,
//     required this.ticketId,
//     required this.type,
//   });

//   factory NotificationModel.fromJson(Map<String, dynamic> json) {
//     return NotificationModel(
//       id: json['id'],
//       name: json['title'],
//       time: json['time'],
//       description: json['description'],
//       ticketId: json['ticketid'],
//     type: json['type'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'title': name,
//       'time': time,
//       'description': description,
//       'ticketid': ticketId,
//       'type':type,
//     };
//   }
// }


// class NotificationcardModel {
//   final int id;
//   final String cardName;

//   NotificationcardModel({
//     required this.id,
//     required this.cardName,
//   });

//   factory NotificationcardModel.fromJson(Map<String, dynamic> json) {
//     return NotificationcardModel(
//       id: json['id'],
//       cardName: json['cardname'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'cardname': cardName,
//     };
//   }
// }
