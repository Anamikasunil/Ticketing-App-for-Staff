import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:crm_staff_ticketing/API/api.dart';
import 'package:crm_staff_ticketing/constant_widgets/home/button.dart';
import 'package:crm_staff_ticketing/constant_widgets/home/global_container';
// import 'package:crm_staff_ticketing/constant_widgets/home/global_container.dart';
import 'package:crm_staff_ticketing/constant_widgets/home/home_appbar.dart';
import 'package:crm_staff_ticketing/constant_widgets/home/stafdetailcontainer.dart';
import 'package:crm_staff_ticketing/constant_widgets/home/ticketdetailscommentcard.dart';
import 'package:crm_staff_ticketing/controller/controller.dart';
import 'package:crm_staff_ticketing/dummy_tools/controlers_dummy.dart/controller_dummy.dart';
import 'package:crm_staff_ticketing/dummy_tools/models_dummy.dart/model_dummy.dart';
import 'package:crm_staff_ticketing/model/model.dart';
import 'package:crm_staff_ticketing/utils/colours.dart';
import 'package:crm_staff_ticketing/utils/curves.dart';
import 'package:crm_staff_ticketing/utils/textstyle.dart';
import 'package:crm_staff_ticketing/views/addupdate.dart';
import 'package:crm_staff_ticketing/views/homepages.dart';
import 'package:crm_staff_ticketing/views/img_view.dart';
import 'package:crm_staff_ticketing/views/updateticketstatus.dart';
import 'package:http/http.dart' as http;

class TicketDetails extends StatefulWidget {
  final String? ticketId,
      subject,
      ticketDescription,
      priority,
      contactPerson,
      contactNo,
      staffAssigned,
      workType,
      estimatedTime,
      ticketStatus,
      finalStatus,
      closingRemarks,
      closingDatetime,
      enterUser,
      requestDateTime,
      deleteStatus,
      filePath,
      uploadedAt,
      ticketAttachmentsId,
      productId,
      productName,
      productDescription,
      commenterId,
      comment,
      commentTime,
      staff_name,
      clientName,
      clientEmail,
      clientPhone,
      companyName,
      companyAddress,
      companyStatus;

  final dynamic staff_id, staff_position, staff_image, staff_status;
  final Color? color, colorss;
  final String? t_id;

  const TicketDetails(
      {super.key,
      required this.ticketId,
      required this.subject,
      required this.ticketDescription,
      required this.priority,
      required this.contactPerson,
      required this.contactNo,
      required this.staffAssigned,
      required this.workType,
      required this.estimatedTime,
      required this.ticketStatus,
      required this.finalStatus,
      required this.closingRemarks,
      required this.closingDatetime,
      required this.enterUser,
      required this.requestDateTime,
      required this.deleteStatus,
      required this.filePath,
      required this.uploadedAt,
      required this.ticketAttachmentsId,
      required this.productDescription,
      required this.productId,
      required this.productName,
      required this.commenterId,
      required this.comment,
      required this.commentTime,
      required this.staff_id,
      required this.staff_name,
      required this.staff_position,
      required this.staff_image,
      required this.staff_status,
      required this.color,
      required this.colorss,
      required this.clientName,
      required this.clientEmail,
      required this.clientPhone,
      required this.companyName,
      required this.companyAddress,
      required this.companyStatus,
      required this.t_id});

  @override
  State<TicketDetails> createState() => _TicketDetailsState();
}

class _TicketDetailsState extends State<TicketDetails> {
  bool isLoading = true;
  String? staffName;
  // final historyList = TicketHistoryController().getTicketHistory();

  final StatusController _statusController = StatusController();

  TextEditingController _commentext = TextEditingController();

  @override
  void initState() {
    super.initState();
    initialize();
    print(
        // 'Ticket ID: ${widget.ticketId}\n'
        // 'Subject: ${widget.subject}\n'
        // 'Description: ${widget.ticketDescription}\n'
        // 'Priority: ${widget.priority}\n'
        // 'Contact Person: ${widget.contactPerson}\n'
        // 'Contact No: ${widget.contactNo}\n'
        // 'Staff Assigned: ${widget.staffAssigned}\n'
        // 'Work Type: ${widget.workType}\n'
        // 'Estimated Time: ${widget.estimatedTime}\n'
        // 'Ticket Status: ${widget.ticketStatus}\n'
        // 'Final Status: ${widget.finalStatus}\n'
        // 'Closing Remarks: ${widget.closingRemarks}\n'
        // 'Closing Datetime: ${widget.closingDatetime}\n'
        // 'Enter User: ${widget.enterUser}\n'
        // 'Request DateTime: ${widget.requestDateTime}\n'
        // 'Delete Status: ${widget.deleteStatus}\n'
        // 'File Path: ${widget.filePath}\n'
        // 'Uploaded At: ${widget.uploadedAt}\n'
        // 'Ticket Attachments ID: ${widget.ticketAttachmentsId}\n'
        // 'Product ID: ${widget.productId}\n'
        // 'Product Name: ${widget.productName}\n'
        // 'Product Description: ${widget.productDescription}\n'
        // 'Commenter ID: ${widget.commenterId}\n'
        // 'Comment: ${widget.comment}\n'
        // 'Comment Time: ${widget.commentTime}\n'
        // 'Staff ID: ${widget.staff_id}\n'
        // 'Staff Name: ${widget.staff_name}\n'
        // 'Staff Position: ${widget.staff_position}\n'
        // 'Staff Image: ${widget.staff_image}\n'
        // 'Staff Status: ${widget.staff_status}\n'
        // 'Color: ${widget.color}\n'
        // 'Colorss: ${widget.colorss}\n'
        'Client Name: ${widget.clientName}\n'
        'Client Email: ${widget.clientEmail}\n'
        'Client Phone: ${widget.clientPhone}\n'
        'Company Name: ${widget.companyName}\n'
        'Company Address: ${widget.companyAddress}\n'
        'Company Status: ${widget.companyStatus}\n');
  }

  Future<void> initialize() async {
    print(widget.t_id.toString());

    await _statusController.fetchDatabase(widget.t_id.toString());
    setState(() {
      isLoading = false;
    });
  }

  Future<void> _submitComment(BuildContext cntx) async {
  


    var response = await http.post(Uri.parse(ADDCOMMENTS),

    
     body: {
        'ticket_id': widget.t_id,
        'status':'staff',
        'comment': _commentext.text,
        'date': DateTime.now().toString(),
        'user_id': widget.staff_id.toString(),
      },

    );



    var jsonData = jsonDecode(response.body);
    var jsonString = jsonData['message'];
    print(response.body);

    if (jsonString == 'success') {
      ScaffoldMessenger.of(cntx).showSnackBar(SnackBar(content: Text("Successfully Added")));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Homepages()),
      );
    } else {
      ScaffoldMessenger.of(cntx).showSnackBar(SnackBar(content: Text(" Failed")));
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: HomeAppbar(
        titletext: 'Ticket Details',
        notificationIcon: const Icon(Icons.file_upload_outlined),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(screenpadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius),
                  border: Border.all(color: lightgrey),
                  color: const Color(0xFFF9FAFB),
                ),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.ticketId.toString(), style: titlestyle),
                          Row(
                            children: [
                              Icon(Icons.fiber_manual_record,
                                  color: widget.colorss, size: 14),
                              const SizedBox(width: 4),
                              Text(widget.ticketStatus.toString(),
                                  style: TextStyle(color: widget.colorss)),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: widget.color,
                              borderRadius: BorderRadius.circular(borderRadius),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            child: Text(widget.ticketStatus.toString(),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 12)),
                          ),
                          const SizedBox(width: 10),
                          Text(widget.requestDateTime.toString(),
                              style: thirdstyles),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Ticketsdetailscontainer(
                circleAvatar: CircleAvatar(
                  backgroundColor: lightgrey,
                  radius: 20,
                  child: Text(
                    widget.clientName != null && widget.clientName!.isNotEmpty
                        ? widget.clientName![0].toUpperCase()
                        : 'N/A',
                    style: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0), fontSize: 16),
                  ),
                ),
                name: widget.clientName,
                clientdes: widget.companyName,
                widget: Icon(Icons.email_outlined, color: hardgrey),
                email: widget.clientEmail ?? "",
                icon: Icon(Icons.phone_outlined, color: hardgrey),
                phonenumber: widget.clientPhone ?? "",
              ),
              const SizedBox(height: 10),
              GlobalContainer(
                  firststyle: titlestyle,
                  secondstyle: subtitlestyle,
                  ticketNumber: 'Issue Description',
                  status: const Text(''),
                  title: widget.subject ?? '',
                  color: Colors.white,
                  leadingwidget:
                      Icon(Icons.access_time_rounded, color: hardgrey),
                  time: 'Created On : ${widget.requestDateTime}' ?? '',
                  // timeStyle: greytextstyle,
                  timestyle: greytextstyle),
              SizedBox(height: 20),
              staffdetailscontainer(
                circleAvatar: CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(widget.staff_image),
                ),
                staffname: widget.staff_name,
                position: widget.staff_position,
              ),
              const SizedBox(height: 20),
                Column(
                                     mainAxisAlignment: MainAxisAlignment.center,
                                                         crossAxisAlignment: CrossAxisAlignment.center,
                                   children: [
                                     Padding(
                                       padding: const EdgeInsets.all(2.0),
                                       child: TextFormField(
                                        controller: _commentext,
                                         maxLines: 3,
                                         enabled: true,
                                         decoration: InputDecoration(
                                           hintText: 'Add your comment or Additional details...',
                                           hintStyle: greytextstyle,
                                           enabledBorder: OutlineInputBorder(
                                             borderSide: BorderSide(
                                       color: const Color.fromARGB(255, 149, 149, 149),
                                       width: 0.2,
                                             ),
                                           ),
                                           border: OutlineInputBorder(
                                             borderSide: BorderSide(
                                       color: const Color.fromARGB(255, 0, 0, 0),
                                       width: 0.5,
                                             ),
                                           ),
                                           focusedBorder: OutlineInputBorder(
                                             borderSide: BorderSide(
                                       color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.3),
                                       width: 0.5,
                                             ),
                                           ),
                                         ),
                                       ),
                                     ),
                                     SizedBox(height: 10,),
                                 
                                      Button(
                                        buttontextColor: Colors.white,
                                                            buttonColor: buttoncolor,
                                                            
                                                            title: 'Send Comment', onPressed: (){

                                                              _submitComment(context);
                                                            })
                                   ],
                                 ),

                                 SizedBox(height: 20,),
              Text('Ticket History', style: headerstyle),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _statusController.statusList.length,
                itemBuilder: (context, index) {
                  StatusModel statusModel = _statusController.statusList[index];
                  print(statusModel.filePath);
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    child: Container(
                      
                      // decoration: BoxDecoration(
                      //     border: Border(
                      //   left: BorderSide(
                      //     color: hardgrey,
                      //     width: 0,
                      //   ),
                      // )),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(statusModel.statusTime.toString(),
                                  style: subtitlestyle2),
                              const SizedBox(width: 8),
                              // Text("• ${statusModel.enterUser}", style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Text(statusModel.statusDescription.toString(),
                              style: const TextStyle(fontSize: 14)),
                          if (statusModel.filePath != null &&
                              statusModel.filePath!.isNotEmpty) ...[
                            const SizedBox(height: 10),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>ImgView(image: statusModel.filePath.toString()) ));
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  border: Border.all(color: Colors.grey[300]!),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(Icons.image, size: 20),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Text(
                                          statusModel.productName.toString(),
                                          style: const TextStyle(fontSize: 13)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
              Button(
                buttonColor: buttoncolor,
                title: 'Update Status',
                buttontextColor: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                onPressed: () {
                  // Navigate to status update screen if needed
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> 
                  Addupdatepage(
                    id: widget.t_id.toString(), 
                    ticketid: widget.ticketId.toString(), 
                    level: widget.priority.toString(), 
                    updatedstatus: 'updatedstatus', 
                  
                    status: widget.ticketStatus.toString(), 
                    date: widget.requestDateTime.toString(), 
                    peragraph: widget.ticketDescription.toString() , 
                    subtitle: widget.subject.toString(), 
                    title: widget.workType.toString(), 
                    cardstatus: widget.staff_status
                  
                    )));
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => Updateticketstatus(
                  //           id: widget.t_id.toString(),
                  //           ticketid: widget.ticketId.toString(),
                  //           level: widget.priority.toString(),
                  //           updatedstatus: 'updatedstatus',
                  //           status: widget.ticketStatus.toString(),
                  //           date: widget.requestDateTime.toString(),
                  //           peragraph: widget.ticketDescription.toString(),
                  //           subtitle: widget.subject.toString(),
                  //           title: widget.workType.toString(),
                  //           cardstatus: widget.staff_status
                            
                  //           )),
                  // );
                },
              ),
              const SizedBox(height: 10),


              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     SizedBox(
              //       height: 100,
              //       width: 120,
              //       child: Card(
              //         color: const Color(0xFFF3F4F6),
              //         child: Padding(
              //           padding: const EdgeInsets.all(16),
              //           child: Column(
              //             children: const [
              //               Icon(Icons.chat_bubble_outline,
              //                   color: Colors.black),
              //               SizedBox(height: 8),
              //               Text('Add Note'),
              //             ],
              //           ),
              //         ),
              //       ),
              //     ),
              //     SizedBox(
              //       height: 100,
              //       width: 120,
              //       child: Card(
              //         color: const Color(0xFFF3F4F6),
              //         child: Padding(
              //           padding: const EdgeInsets.all(16),
              //           child: Column(
              //             children: const [
              //               Icon(Icons.attach_file, color: Colors.black),
              //               SizedBox(height: 8),
              //               Text('Upload File'),
              //             ],
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),


              // comment 
            
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
