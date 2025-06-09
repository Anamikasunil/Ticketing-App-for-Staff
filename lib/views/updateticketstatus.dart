import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:crm_staff_ticketing/API/api.dart';
import 'package:crm_staff_ticketing/constant_widgets/home/button.dart';
import 'package:crm_staff_ticketing/constant_widgets/home/home_appbar.dart';
import 'package:crm_staff_ticketing/utils/colours.dart';
import 'package:crm_staff_ticketing/utils/curves.dart';
import 'package:crm_staff_ticketing/utils/textstyle.dart';
import 'package:crm_staff_ticketing/views/addupdate.dart';
import 'package:http/http.dart' as http;
import 'package:crm_staff_ticketing/views/homepages.dart';

import 'package:path/path.dart' as path;


class Updateticketstatus extends StatefulWidget {
  String id;
  String ticketid;
  String level;
  String updatedstatus;
  String status;
  String date;
  String title;
  String subtitle;
  String peragraph;
  String cardstatus;
  String? staffname;

  Updateticketstatus({
    super.key,
    required this.id,
    required this.ticketid,
    required this.level,
    required this.updatedstatus,
    
    required this.status,
    required this.date,
    required this.peragraph,
    required this.subtitle,
    required this.title,
    required this.cardstatus,
    this.staffname,
  });

  @override
  State<Updateticketstatus> createState() => _UpdateticketstatusState();
}

class _UpdateticketstatusState extends State<Updateticketstatus> {
  bool isLoading = true;
  String? _selectedItem;
  File? _image;
  final TextEditingController _notesController = TextEditingController();

  List<String> statusOptions = ['Open', 'In Progress', 'Resolved', 'Closed'];

  @override
  void initState() {
    super.initState();

    final normalizedStatus = widget.status.toLowerCase().replaceAll('-', ' ');
    _selectedItem = statusOptions.firstWhere(
      (status) => status.toLowerCase() == normalizedStatus,
      orElse: () => '',
    );

    setState(() {
      isLoading = false;
    });
  }

String encodeImageToBase64() {
  if (_image != null) {
    List<int> imageBytes = _image!.readAsBytesSync();
    String base64Image = base64Encode(imageBytes);
    return base64Image;
  }
  return '';
}

Future<void> _submitComment(BuildContext cntx) async {
  String encodedImage = encodeImageToBase64();

  String _closingStatus = _selectedItem == 'Closed' ? 'Closed' : '';
  String _closingDatetime = _selectedItem == 'Closed' ? DateTime.now().toString() : '';

  var response = await http.post(
    Uri.parse(UPDATETICKET),
    body: {
      "id": widget.id,
      "ticketid": widget.ticketid,
      "status": _selectedItem,
      "final_status": _closingStatus,
      "closing_remarks": _notesController.text,
      "closing_datetime": _closingDatetime,
      "filepath": _image != null ? path.basename(_image!.path) : '',
      "image": encodedImage,
      "current_datetime": DateTime.now().toString(),
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
    ScaffoldMessenger.of(cntx).showSnackBar(SnackBar(content: Text("Failed")));
  }
}



  void SelectImage() async {
    final picker = ImagePicker();
    final pickedimage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedimage != null) {
        _image = File(pickedimage.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scafoldcolor,
      appBar: HomeAppbar(titletext: 'Update Ticket Status'),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(screenpadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(borderRadius),
                        border: Border.all(color: lightgrey),
                        color: Colors.white,
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
                                Text(widget.ticketid, style: headerstyle),
                                Row(
                                  children: [
                                    // Icon(Icons.fiber_manual_record,
                                    //     color: widget.colorss, size: 14),
                                  
                                    Icon(
                                      Icons.circle,
                                      color: widget.cardstatus == 'Open'
                                          ? Colors.green
                                          : widget.cardstatus == 'In Progress'
                                              ? Colors.yellow
                                              : widget.cardstatus == 'Resolved'
                                                  ? Colors.blue
                                                  : Colors.red,
                                      size: 10,
                                    ),
                                      SizedBox(width: 4),
                                    Text(widget.level, style: subtitlestyle, ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Text('Created :', style: thirdstyles),
                                SizedBox(width: 5),
                                Text(widget.date, style: thirdstyles),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    Text('Current Status', style: titlestyle),
                    SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      dropdownColor: Colors.white,
                      value: _selectedItem,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: lightgrey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: lightgrey, width: 2),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      icon: Icon(Icons.arrow_drop_down),
                      items: statusOptions
                          .map((status) => DropdownMenuItem(
                                value: status,
                                child: Text(status, style: subtitlestyle),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedItem = value!;
                        });
                      },
                    ),

                    SizedBox(height: 20),

                    Text('Update Status', style: titlestyle),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: _notesController,
                      maxLines: 5,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Add your notes here...',
                        hintStyle:
                            TextStyle(color: hardgrey.withOpacity(0.8)),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(borderRadius),
                          borderSide: BorderSide(color: lightgrey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(borderRadius),
                          borderSide: BorderSide(color: lightgrey),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),

                    Text('Attachments', style: titlestyle),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        SelectImage();
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: const Color(0xFFD1D5DB),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.attach_file,
                              color: const Color(0xFF9CA3AF),
                              size: 32,
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Add Files',
                              style: TextStyle(
                                color: Color(0xFF4B5563),
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              'Max size: 10MB',
                              style: TextStyle(
                                color: Color(0xFF9CA3AF),
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            const SizedBox(height: 16),
                            if (_image != null)
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(color: Colors.grey.shade300),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.file(
                                    _image!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    Button(
                      buttonColor: buttoncolor,
                      title: 'Update Ticket',
                      buttontextColor: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      onPressed: () {
                        _submitComment(context);
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (BuildContext) {
                        //   return Addupdatepage(
                        //     id: widget.id,
                        //     ticketid: widget.ticketid,
                        //     level: widget.level,
                        //     updatedstatus: widget.updatedstatus,
                        //     // color: widget.color,
                        //     // colorss: widget.colorss,
                        //     status: widget.status,
                        //     date: widget.date,
                        //     title: widget.title,
                        //     cardstatus: widget.cardstatus,
                        //     subtitle: widget.subtitle,
                        //     peragraph: widget.peragraph,
                        //     staffname: widget.staffname,
                        //   );
                        // }));
                      },
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
