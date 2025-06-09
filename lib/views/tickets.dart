import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:crm_staff_ticketing/constant_widgets/home/dropdowncontainer.dart';
import 'package:crm_staff_ticketing/constant_widgets/home/home_appbar.dart';
import 'package:crm_staff_ticketing/constant_widgets/home/searchbox.dart';
import 'package:crm_staff_ticketing/constant_widgets/home/ticketpagecard.dart';
import 'package:crm_staff_ticketing/controller/controller.dart';
import 'package:crm_staff_ticketing/dummy_tools/controlers_dummy.dart/controller_dummy.dart';
import 'package:crm_staff_ticketing/dummy_tools/models_dummy.dart/model_dummy.dart';
import 'package:crm_staff_ticketing/model/model.dart';
import 'package:crm_staff_ticketing/utils/colours.dart';
import 'package:crm_staff_ticketing/utils/textstyle.dart';
import 'package:crm_staff_ticketing/views/ticketdetails.dart';

List<String> priorityList = [
  'All',
  'High',
  'Medium',
  'Low',
];

List<String> statusList = [
  'All',
  'Open',
  'In Progress',
  'Resolved',
  'Closed',
];

List<String> sortList = [
  'Ascending',
  'Descending',
];

class TicketPage extends StatefulWidget {
  String? status ;
  TicketPage({super.key , this.status});

  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  bool isLoading = true;
  final DropdownController _dropdowncontroller = DropdownController();
  final TicketController _ticketController = TicketController();

  // New state variables for filtering and sorting.
  String _selectedPriority = 'All';

  late String _selectedStatus;

  @override
  void initState() {
    super.initState();
    _selectedStatus = widget.status ?? 'All';
    initializeCorrectly();
  }
  // String _selectedStatus = 'All';
  String _selectedSort = 'Ascending';

  // @override
  // void initState() {
  //   super.initState();
  //   initializeCorrectly();
  // }

  Future<void> initializeCorrectly() async {
    //  _dropdowncontroller.fetchDatabase();
    await _ticketController.fetchDatabase('2');
    setState(() {
      isLoading = false;
    });
  }

  String _searchQuery = '';

  // Helper to determine ticket color based on its status.
  Color getStatusColor(String status) {
    switch (status) {
      case "Open":
        return lowpriority;
      case "In Progress":
        return mediumpriority;
      case "Resolved":
        return resolvedprority;
      case "Closed":
        return highpriority;
      default:
        return Colors.grey;
    }
  }
// A getter to return the filtered and sorted list of tickets.
List<TicketModel> get filteredTickets {
  List<TicketModel> tickets = _ticketController.ticketList;

  // First filter by search query if one exists
  if (_searchQuery.isNotEmpty) {
    tickets = tickets.where((ticket) =>
        ticket.productName?.toLowerCase().contains(_searchQuery.toLowerCase()) == true ||
        ticket.ticketId?.toLowerCase().contains(_searchQuery.toLowerCase()) == true ||
        ticket.workType?.toLowerCase().contains(_searchQuery.toLowerCase()) == true ||
        ticket.ticketDescription?.toLowerCase().contains(_searchQuery.toLowerCase()) == true ||
        ticket.subject?.toLowerCase().contains(_searchQuery.toLowerCase()) == true
    ).toList();
  }

  // Then filter by priority if a specific priority is selected.
  if (_selectedPriority != 'All') {
    tickets = tickets
        .where((ticket) => ticket.priority.toString() == _selectedPriority)
        .toList();
  }

  // Then filter by status if a specific status is selected.
  if (_selectedStatus != 'All') {
    tickets = tickets
        .where((ticket) => ticket.ticketStatus.toString() == _selectedStatus)
        .toList();
  }

  // Finally sort tickets by date based on the chosen sort order.
  tickets.sort((a, b) {
    DateTime aDate = DateTime.tryParse(a.requestDateTime.toString()) ?? DateTime.now();
    DateTime bDate = DateTime.tryParse(b.requestDateTime.toString()) ?? DateTime.now();
    return aDate.compareTo(bDate);
  });
  
  if (_selectedSort == 'Descending') {
    tickets = tickets.reversed.toList();
  }
  
  return tickets;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scafoldcolor,
      appBar: HomeAppbar(
        titletext: 'Tickets',
        notificationIcon: Icon(Icons.notifications_none_rounded),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  // Search Bar
                  Container(
                    color: Colors.white,
                    height: 80,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(screenpadding),
                      child:  Searchbox(
                        hintText: 'Search Tickets',
                        onSearchChanged: (value) {
                          setState(() {
                            _searchQuery = value;
                          });
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(screenpadding),
                    child: Column(
                      children: [
                      
                        // SizedBox(
                        //   height: 40,
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //     children: _dropdowncontroller.DropdownList.map((item) {
                        //       return Expanded(
                        //         child: Padding(
                        //           padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        //           child: DropdownContainer(
                                    
                        //             texts: item.drop,
                        //             widget: DropdownButtonHideUnderline(
                        //               child: Padding(
                        //                 padding: const EdgeInsets.all(0.0),
                        //                 child: DropdownButton<String>(
                        //                   underline: Container(
                        //                     color: Colors.transparent,
                        //                   ),
                        //                   isExpanded: true,
                        //                   icon: const Icon(Icons.keyboard_arrow_down),
                        //                   value: item.selectedValue,
                        //                   style: const TextStyle(fontSize: 14, color: Colors.black),
                        //                   items: item.values.map<DropdownMenuItem<String>>((String value) {
                        //                     return DropdownMenuItem<String>(
                                              
                        //                       value: value,
                        //                       child: Text(value),
                        //                     );
                        //                   }).toList(),
                        //                   onChanged: (String? newValue) {
                        //                     setState(() {
                        //                       item.selectedValue = newValue!;
                        //                     });
                        //                   },
                        //                 ),
                        //               ),
                        //             ),
                        //           ),
                        //         ),
                        //       );
                        //     }).toList(),
                        //   ),
                        // ),
                        // New dropdowns for filtering and sorting.
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                  decoration: BoxDecoration(
                                        color: Colors.white,
                                borderRadius: BorderRadius.circular(16)
                              ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal:  screenpadding),
                                  child: DropdownButton<String>(
                                    dropdownColor: Colors.white,
                                    underline: Container(
                                      color: Colors.transparent,
                                    ),
                                    isExpanded: true,
                                    value: _selectedPriority,
                                    icon: const Icon(Icons.keyboard_arrow_down),
                                    items: priorityList
                                        .map<DropdownMenuItem<String>>(
                                          (String value) => DropdownMenuItem<String>(
                                            
                                            value: value,
                                      child: Text(value, style: subtitlestyle,overflow: TextOverflow.ellipsis,softWrap: true,maxLines: 2,),                                          ),
                                        )
                                        .toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        _selectedPriority = newValue!;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Container(
                                  decoration: BoxDecoration(
                                        color: Colors.white,
                                borderRadius: BorderRadius.circular(16)
                              ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal:  screenpadding),
                                  child: DropdownButton<String>(
                                    dropdownColor: Colors.white,
                                       underline: Container(
                                      color: Colors.transparent,
                                    ),
                                    isExpanded: true,
                                    value: _selectedStatus,
                                    icon: const Icon(Icons.keyboard_arrow_down),
                                    items: statusList
                                        .map<DropdownMenuItem<String>>(
                                          (String value) => DropdownMenuItem<String>(
                                            value: value,
                                               child: Text(value, style: subtitlestyle,overflow: TextOverflow.ellipsis,softWrap: true,maxLines: 2,),                                          ),
                                        )
                                        .toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        _selectedStatus = newValue!;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Container(
                        
                              decoration: BoxDecoration(
                                        color: Colors.white,
                                borderRadius: BorderRadius.circular(16)
                              ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: screenpadding),
                                  child: DropdownButton<String>(
                                    dropdownColor: Colors.white,
                                       underline: Container(
                                      color: Colors.transparent,
                                    ),
                                    isExpanded: true,
                                    value: _selectedSort,
                                    icon: const Icon(Icons.keyboard_arrow_down),
                                    items: sortList
                                        .map<DropdownMenuItem<String>>(
                                          (String value) => DropdownMenuItem<String>(
                                            value: value,
                                          child: Text(value, style: subtitlestyle,overflow: TextOverflow.ellipsis,softWrap: true,maxLines: 2,),
                                          ),
                                        )
                                        .toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        _selectedSort = newValue!;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        // List of filtered and sorted tickets.
                        ListView.builder(
                          itemCount: filteredTickets.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            TicketModel ticketModel = filteredTickets[index];
                            Color statusColor = getStatusColor(ticketModel.ticketStatus.toString());

                            return Padding(
                              padding: const EdgeInsets.only(top: 2, bottom: 0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return TicketDetails(
                                      t_id: ticketModel.t_id,
                                      ticketId: ticketModel.ticketId,
                                      subject: ticketModel.subject,
                                      ticketDescription: ticketModel.ticketDescription,
                                      priority: ticketModel.priority,
                                      contactPerson: ticketModel.contactPerson,
                                      contactNo: ticketModel.contactNo,
                                      staffAssigned: ticketModel.staffAssigned,
                                      workType: ticketModel.workType,
                                      estimatedTime: ticketModel.estimatedTime,
                                      ticketStatus: ticketModel.ticketStatus,
                                      finalStatus: ticketModel.finalStatus,
                                      closingRemarks: ticketModel.closingRemarks,
                                      closingDatetime: ticketModel.closingDatetime,
                                      enterUser: ticketModel.enterUser,
                                      requestDateTime: ticketModel.requestDateTime,
                                      deleteStatus: ticketModel.deleteStatus,
                                      filePath: ticketModel.filePath,
                                      uploadedAt: ticketModel.uploadedAt,
                                      ticketAttachmentsId: ticketModel.ticketAttachmentsId,
                                      productDescription: ticketModel.productDescription,
                                      productId: ticketModel.productId,
                                      productName: ticketModel.productName,
                                      commenterId: ticketModel.commenterId,
                                      comment: ticketModel.comment,
                                      commentTime: ticketModel.commentTime,
                                      staff_id: ticketModel.staff_id,
                                      staff_name: ticketModel.staff_name,
                                      staff_position: ticketModel.staff_position,
                                      staff_image: ticketModel.staff_image,
                                      staff_status: ticketModel.staff_status,
                                      color: ticketModel.ticketStatus == 'In Progress'
                                          ? mediumpriority
                                          : ticketModel.ticketStatus == 'Open'
                                              ? lowpriority
                                              : ticketModel.ticketStatus == 'Resolved'
                                                  ? resolvedprority
                                                  : ticketModel.ticketStatus == 'Closed'
                                                      ? highpriority
                                                      : Colors.blueGrey,
                                      colorss: ticketModel.ticketStatus == 'In Progress'
                                          ? mediumpriority
                                          : ticketModel.ticketStatus == 'Open'
                                              ? lowpriority
                                              : ticketModel.ticketStatus == 'Resolved'
                                                  ? resolvedprority
                                                  : ticketModel.ticketStatus == 'Closed'
                                                      ? highpriority
                                                      : Colors.blueGrey,
                                      clientEmail: ticketModel.clientEmail,
                                      clientName: ticketModel.clientName,
                                      clientPhone: ticketModel.clientPhone,
                                      companyAddress: ticketModel.companyAddress,
                                      companyName: ticketModel.companyName,
                                      companyStatus: ticketModel.companyStatus,
                                    );
                                  }));
                                },
                                child: Ticketpagecard(
                                  Cont_titleStyle: titlestyle,
                                  Cont_subtitleStyle: subtitlestyle,
                                  ticketid: ticketModel.ticketId.toString(),
                                  status: ticketModel.ticketStatus,
                                  statusColor: statusColor,
                                  title: ticketModel.productName,
                                  subtitle: ticketModel.workType,
                                  peragraph: ticketModel.ticketDescription,
                                  widget: Icon(
                                    Icons.fiber_manual_record,
                                    color: statusColor,
                                    size: 14,
                                  ),
                                  level: ticketModel.priority,
                                  date: ticketModel.requestDateTime,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
