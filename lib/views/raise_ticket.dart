// import 'package:crm_staff_ticketing/constant_widgets/home/home_appbar.dart';
// import 'package:crm_staff_ticketing/dummy_tools/controlers_dummy.dart/controller_dummy.dart';
// import 'package:crm_staff_ticketing/utils/colours.dart';
// import 'package:crm_staff_ticketing/utils/textstyle.dart';
// import 'package:flutter/material.dart';

// class RaiseTicket extends StatefulWidget {
//   const RaiseTicket({super.key});

//   @override
//   State<RaiseTicket> createState() => _RaiseTicketState();
// }

// class _RaiseTicketState extends State<RaiseTicket> {
//   final DropdownTicketController _dropdownTicketController = DropdownTicketController();

//   String? _selectedItem;
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     initialize();
//   }

//   Future<void> initialize() async {
//      _dropdownTicketController.fetchDatabase(); 
//     setState(() {
//       isLoading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: HomeAppbar(titletext: 'Raise a Ticket'),
//       body: Padding(
//         padding: const EdgeInsets.all(screenpadding),
//         child: isLoading
//             ? Center(child: CircularProgressIndicator())
//             : Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text('For Active Subscriptions', style: headerstyle),
//                   const SizedBox(height: 12),
//               DropdownButton<String>(
//   hint: Text('Choose software'),
//   value: _selectedItem,
//   isExpanded: true,
//   items: _dropdownTicketController.dropdownTicketList
//        // Optional: filter only active ones
//       .map((item) {
//         return DropdownMenuItem<String>(
//           value: item.software,
//           child: Row(
//             children: [
//               Image.network(item.image, width: 24, height: 24, fit: BoxFit.cover),
//               const SizedBox(width: 8),
//               Text(item.software),
//             ],
//           ),
//         );
//       }).toList(),
//   onChanged: (String? newValue) {
//     setState(() {
//       _selectedItem = newValue;
//     });
//   },
// ),

//                 ],
//               ),
//       ),
//     );
//   }
// }
