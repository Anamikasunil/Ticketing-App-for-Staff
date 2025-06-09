class TicketModel {
  final String? ticketId;
  final String ?subject;
  final String? ticketDescription;
  final String ?priority;
  final String ?contactPerson;
  final String ?contactNo;
  final String ?staffAssigned;
  final String ?workType;
  final String? estimatedTime;
  final String? ticketStatus;
  final String? finalStatus;
  final String? closingRemarks;
  final String? closingDatetime;
  final String ?enterUser;
  final String ?requestDateTime;
  final String ?deleteStatus;
  final String? filePath;
  final String? uploadedAt;
  final String? ticketAttachmentsId;

  final String ?productId;
  final String ?productName;
  final String ?productDescription;

    final String? commenterId;
  final String ?comment;
  final String ?commentTime;

  final String ?staff_id;
  final String ?staff_name;
  final String ?staff_position;
  final String ?staff_image;
  final String ?staff_status;

      String? clientName;
    String? clientEmail;
    String? clientPhone;
    String? companyName;
    String? companyAddress;
    String? companyStatus;

    String? t_id;


  TicketModel({
     this.ticketId,
     this.subject,
     this.ticketDescription,
   this.priority,
     this.contactPerson,
    this.contactNo,
    this.staffAssigned,
     this.workType,
     this.estimatedTime,
     this.ticketStatus,
    this.finalStatus,
    this.closingRemarks,
    this.closingDatetime,
   this.enterUser,
     this.requestDateTime,
     this.deleteStatus,
    this.filePath,
    this.uploadedAt,
    this.ticketAttachmentsId,
    this.productDescription,
     this.productId,
    this.productName,
         this.commenterId,
     this.comment,
     this.commentTime,
     this.staff_id,
     this.staff_name,
    this.staff_position,
    this.staff_image,
    this.staff_status,

    this.clientName,
    this.clientEmail,
    this.clientPhone,
    this.companyName,
    this.companyAddress,  
    this.companyStatus, 

    this.t_id,
    

    
    
    
  });

  factory TicketModel.fromJson(Map<String, dynamic> json) {
    return TicketModel(
      ticketId: json['ticket_id'] ?? "",
      subject: json['subject']?? "",
      ticketDescription: json['ticket_description']?? "",
      priority: json['priority']?? "",
      contactPerson: json['contact_person']?? "",
      contactNo: json['contact_no']?? "",
      staffAssigned: json['staff_assigned']?? "",
      workType: json['work_type']?? "",
      estimatedTime: json['estimated_time']?? "",
      ticketStatus: json['ticket_status']?? "",
      finalStatus: json['final_status']?? "",
      closingRemarks: json['closing_remarks']?? "",
      closingDatetime: json['closing_datetime']?? "",
      enterUser: json['enter_user']?? "",
      requestDateTime: json['request_date_time']?? "",
      deleteStatus: json['delete_status']?? "",
      filePath: json['file_path']?? "",
      uploadedAt: json['uploaded_at']?? "",
      ticketAttachmentsId: json['ticket_attachments_id']?? "",
   
        productId: json['product_id']?? "",
        productName: json['product_name'] ??"",
        productDescription: json['product_description']?? "",
      
  
        commenterId: json['commenter_id']?? "",
        comment: json['comment']?? "",
        commentTime: json['comment_time']?? "",

        staff_id: json['staff_id']?? "",
        staff_name: json['staff_name']?? "",
        staff_position: json['staff_position']?? "",
        staff_image: json['staff_image']?? "",
        staff_status: json['staff_status']?? "",


        clientName: json['client_name']?? "",
        clientEmail: json['client_email']?? "",
        clientPhone: json['client_phone']?? "",
        companyName: json['company_name']?? "",
        companyAddress: json['company_address']?? "",
        companyStatus: json['company_status']?? "",
        
        t_id : json['t_id']?? "",

  
      
    );
  }
}






class StatusModel {
    String? ticketStatusId;
    String? ticketId;
    String? statusTitle;
    String? statusDescription;
    String? statusTime;
    String? tId;
    String? ticketProductId;
    String? clientId;
    dynamic?  requestDateTime;
    String? subject;
    String? ticketDescription;
    String? priority;
    String? contactPerson;
    String? contactNo;
    String? staffAssigned;
    String? workType;
    String? estimatedTime;
    String? ticketStatus;
    String? finalStatus;
    String? closingRemarks;
    dynamic? closingDatetime;
    String? enterUser;
    String? deleteStatus;
    String? productId;
    String? productName;
    String? productDescription;
    String? commenterId;
    String? comment;
    dynamic? commentTime;
    String? filePath;
    dynamic? uploadedAt;
    String? ticketAttachmentsId;

    StatusModel({
 this.ticketStatusId,
        this.ticketId,
        this.statusTitle,
        this.statusDescription,
        this.statusTime,
        this.tId,
        this.ticketProductId,
        this.clientId,
        this.requestDateTime,
        this.subject,
        this.ticketDescription,
        this.priority,
        this.contactPerson,
        this.contactNo,
        this.staffAssigned,
        this.workType,
        this.estimatedTime,
        this.ticketStatus,
        this.finalStatus,
        this.closingRemarks,
        this.closingDatetime,
        this.enterUser,
        this.deleteStatus,
        this.productId,
        this.productName,
        this.productDescription,
        this.commenterId,
        this.comment,
        this.commentTime,
        this.filePath,
        this.uploadedAt,
        this.ticketAttachmentsId,
    });

    factory StatusModel.fromJson(Map<String, dynamic> json) => StatusModel(
         ticketStatusId: json["ticket_status_id"] ?? "",
        ticketId: json["ticket_id"]?? "",
        statusTitle: json["status_title"]?? "",
        statusDescription: json["status_description"]?? "",
        statusTime: json["status_time"]?? "",
        tId: json["t_id"]?? "",
        ticketProductId: json["ticket_product_id"]?? "",
        clientId: json["client_id"]?? "",
        requestDateTime: json["request_date_time"]?? "" ,
        subject: json["subject"]?? "",
        ticketDescription: json["ticket_description"]?? "",
        priority: json["priority"]?? "",
        contactPerson: json["contact_person"]?? "",
        contactNo: json["contact_no"]?? "",
        staffAssigned: json["staff_assigned"]?? "",
        workType: json["work_type"]?? "",
        estimatedTime: json["estimated_time"]?? "",
        ticketStatus: json["ticket_status"]?? "",
        finalStatus: json["final_status"]?? "",
        closingRemarks: json["closing_remarks"]?? "",
        closingDatetime: json["closing_datetime"]?? "",
        enterUser: json["enter_user"]?? "",
        deleteStatus: json["delete_status"]?? "",
        productId: json["product_id"]?? "",
        productName: json["product_name"]?? "",
        productDescription: json["product_description"]?? "",
        commenterId: json["commenter_id"]?? "",
        comment: json["comment"]?? "",
        commentTime: json["comment_time"]?? "",
        filePath: json["file_path"]?? "",
        uploadedAt: json["uploaded_at"]?? "",
        ticketAttachmentsId: json["ticket_attachments_id"]?? ""
        );
}




class NotificationModel {
    String? id;
    String? clientId;
    String? staffId;
    String? productId;
    String? ticketId;
    String? date;
    String? title;
    String? descrption;
    String? type;
    String? status;
    String? navigateTo;
    String? active;

    NotificationModel({
        this.id,
        this.clientId,
        this.staffId,
        this.productId,
        this.ticketId,
        this.date,
        this.title,
        this.descrption,
        this.type,
        this.status,
        this.navigateTo,
        this.active,
    });

    factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
        id: json["id"] ??"",
        clientId: json["client_id"]??"",
        staffId: json["staff_id"]??"",
        productId: json["product_id"]??"",
        ticketId: json["ticket_id"]??"",
        date: json["date"]??"",
        title: json["title"]??"",
        descrption: json["descrption"]??"",
        type: json["type"]??"",
        status: json["status"]??"",
        navigateTo: json["navigate_to"]??"",
        active: json["active"]??"",
    );
}