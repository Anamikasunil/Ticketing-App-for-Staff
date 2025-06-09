import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:crm_staff_ticketing/API/api.dart';
import 'package:crm_staff_ticketing/constant_widgets/home/button.dart';
import 'package:crm_staff_ticketing/constant_widgets/home/card.dart';
import 'package:crm_staff_ticketing/constant_widgets/home/home_appbar.dart';
import 'package:crm_staff_ticketing/utils/colours.dart';
import 'package:crm_staff_ticketing/utils/curves.dart';
import 'package:crm_staff_ticketing/utils/textstyle.dart';
import 'package:crm_staff_ticketing/views/homepages.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

class Addupdatepage extends StatefulWidget {
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

  Addupdatepage({
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
  State<Addupdatepage> createState() => _AddupdatepageState();
}

class _AddupdatepageState extends State<Addupdatepage> {
  bool isLoading = true;
  File? _image;
  PlatformFile? _pickedDocument;
  File? _screenshot;
   TextEditingController _textformController = TextEditingController();
   TextEditingController _titleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      isLoading = false;
    });

    print(
      widget.id +
          widget.ticketid +
          widget.level +
          widget.updatedstatus +
          widget.status +
          widget.date +
          widget.peragraph +
          widget.subtitle +
          widget.title +
          widget.cardstatus,
    );
  }

  void selectImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  void selectScreenshot() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _screenshot = File(pickedImage.path);
      });
    }
  }

  void selectDocument() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );
    if (result != null) {
      setState(() {
        _pickedDocument = result.files.first;
      });
    }
  }

  String encodeFileToBase64(File? file) {
    if (file != null) {
      List<int> bytes = file.readAsBytesSync();
      return base64Encode(bytes);
      
    }
    return '';

    
  }


  Future<void> _submitComment(BuildContext context) async {
  String encodedImage = encodeFileToBase64(_image);
  String encodedScreenshot = encodeFileToBase64(_screenshot);
  String? encodedDocument;

  if (_pickedDocument != null && _pickedDocument!.bytes != null) {
    encodedDocument = base64Encode(_pickedDocument!.bytes!);
  }

  print('hihiiiiiiiiiiiiiiiiiiii');
  print(
    '${widget.id}\n'
    '${widget.status}\n'
    '${_titleController.text}\n'
    '${_textformController.text}\n'
    '${_pickedDocument?.path}\n'
    '${encodedDocument ?? ''}\n'
  );

  try {
    var response = await http.post(
      Uri.parse(STATUSUPDATE),
      body: {
        "id": widget.id,
        "ticketid": widget.ticketid,
        "title": _titleController.text,
        "status": _textformController.text,
        "doc_path": _pickedDocument?.path ?? '',
        "document": encodedDocument ?? '',
        "screenshot_path": _screenshot != null ? path.basename(_screenshot!.path) : '',
        "screenshot": encodedScreenshot,
        "image_path": _image != null ? path.basename(_image!.path) : '',
        "image": encodedImage,
        "current_datetime": DateTime.now().toString()
      },
    );

    var jsonData = jsonDecode(response.body);
    var jsonString = jsonData['message'];
    print(response.body);

    if (jsonString == 'success') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Successfully Added")),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Homepages()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to Add")),
      );
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Error: ${e.toString()}")),
    );
    print('Error: $e');
  }
}
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scafoldcolor,
      appBar: HomeAppbar(
        titletext: 'Add Update',
        profileIcon: Text('Cancel',
            style: TextStyle(
                color: buttoncolor,
                fontWeight: FontWeight.w500,
                fontSize: 14)),
      ),
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(widget.ticketid, style: addticketstyle),
                                  Text(widget.title, style: titlestyle),
                                ]),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(borderRadius),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 4),
                              child: Text(
                                widget.status,
                                style: TextStyle(
                                  color: widget.status == 'Open'
                                      ? lowpriority
                                      : widget.status == 'In Progress'
                                          ? mediumpriority
                                          : widget.status == 'Closed'
                                              ? highpriority
                                              : widget.status == 'Resolved'
                                                  ? resolvedprority
                                                  : Colors.black,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    CardPage(
                      text: 'Title',
                      textformfields: TextFormField(
                        controller: _titleController,
                        maxLines: 1,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Add your title here...',
                          hintStyle:
                              TextStyle(color: hardgrey.withOpacity(0.8)),
                          contentPadding: const EdgeInsets.symmetric(
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
                    ),
                    const SizedBox(height: 10),
                    CardPage(
                      text: 'Notes',
                      textformfields: TextFormField(
                        controller: _textformController,
                        maxLines: 5,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Add your notes here...',
                          hintStyle:
                              TextStyle(color: hardgrey.withOpacity(0.8)),
                          contentPadding: const EdgeInsets.symmetric(
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
                    ),
                    const SizedBox(height: 10),
                    Card(
                      elevation: 2,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(borderRadius),
                          border: Border.all(color: lightgrey, width: .5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(screenpadding),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Attachment', style: titlestyle),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  buildAttachmentButton(
                                      icon: Icons.photo,
                                      label: 'Photo',
                                      onTap: selectImage),
                                  buildAttachmentButton(
                                      icon: Icons.file_copy_outlined,
                                      label: 'Document',
                                      onTap: selectDocument),
                                  buildAttachmentButton(
                                      icon: Icons.screenshot_rounded,
                                      label: 'Screenshot',
                                      onTap: selectScreenshot),
                                ],
                              ),
                              const SizedBox(height: 10),
                              if (_image != null ||
                                  _pickedDocument != null ||
                                  _screenshot != null)
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    if (_image != null)
                                      buildPreviewTile(_image!),
                                    if (_pickedDocument != null)
                                      buildDocPreviewTile(),
                                    if (_screenshot != null)
                                      buildPreviewTile(_screenshot!),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Button(
                      buttonColor: buttoncolor,
                      title: 'Submit Update',
                      buttontextColor: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      onPressed: () => _submitComment(context),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Widget buildAttachmentButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Card(
            elevation: 2,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(borderRadius),
                border: Border.all(color: lightgrey, width: .5),
              ),
              child: Center(
                child: Icon(icon, color: Colors.black, size: 25),
              ),
            ),
          ),
        ),
        Text(label, style: subtitlestyle),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget buildPreviewTile(File file) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade300),
              image: DecorationImage(
                image: FileImage(file),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDocPreviewTile() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Icon(Icons.insert_drive_file, size: 60, color: Colors.grey),
          // Text(_pickedDocument!.name,
          //     style: TextStyle(fontSize: 12), overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }
}
