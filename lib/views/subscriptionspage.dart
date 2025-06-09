// import 'package:crm_staff_ticketing/constant_widgets/home/home_appbar.dart';
// import 'package:crm_staff_ticketing/constant_widgets/home/subcriptions_container.dart';
// import 'package:crm_staff_ticketing/dummy_tools/controlers_dummy.dart/controller_dummy.dart';
// import 'package:crm_staff_ticketing/dummy_tools/models_dummy.dart/model_dummy.dart';
// import 'package:crm_staff_ticketing/utils/colours.dart';
// import 'package:crm_staff_ticketing/utils/consts.dart';
// import 'package:crm_staff_ticketing/utils/textstyle.dart';
// import 'package:flutter/material.dart';

// class Subscriptionspage extends StatefulWidget {
//   const Subscriptionspage({super.key});

//   @override
//   State<Subscriptionspage> createState() => _SubscriptionspageState();
// }

// class _SubscriptionspageState extends State<Subscriptionspage> {

//     final MysubcriptionController _mysubcriptionController = MysubcriptionController();

//   String username = '';

//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     initialize();
//   }

//   Future<void> initialize() async {

//     _mysubcriptionController.fetchDatabase();


//     setState(() {
//       isLoading = false;
 
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//             appBar: HomeAppbar(
//         titletext: 'My subscriptions',
      
//       ),

//       body: Padding(
//         padding: const EdgeInsets.all(screenpadding),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//              Text('For Active Subscriptions', style: headerstyle),
//                     Text(
//                       'Manage your software subscriptions',
//                       style: subheaderstyle,
//                     ),

//                     sizedbox_const,

//     Expanded(
//       child: ListView.builder(
//         itemCount: _mysubcriptionController.subList.length,
//         itemBuilder: (context, index) {
//                           SubcriptionModel subcriptionModel =
//                               _mysubcriptionController.subList[index];
//                           return
//        Padding(
//          padding: const EdgeInsets.symmetric(vertical:  8.0),
//          child: SubcriptionsContainer(
//             Cont_titleStyle: titlestyle,
//            Cont_subtitleStyle: subheaderstyle,
//            title: subcriptionModel.software,
//            status: subcriptionModel.active=='yes'?'Active':'Inactive',
          
//            statusStyle: subcriptionModel.active=='yes' ? subscriptionstyle : inactiveStyle, 
//            statusColor:  subcriptionModel.active=='yes' ?  activeColor.withOpacity(0.4) : inactiveColor.withOpacity(0.4),
//            duration: '${subcriptionModel.startDate} - ${subcriptionModel.endDate}',
//            image: subcriptionModel.image,
//            buttonColor: Colors.white,
//            buttonText: 'Raise Ticket',
//            buttontextColor: buttoncolor,
//            buttonheight: 45,
//            buttonwidth: double.infinity,
//            borderColor: buttoncolor,
           
//             onPressed: (){
          
//             },
           
//            ),
//        );
      
//         }
//       ),
//     )
//           ],
//         ),
//       ),

//     );
//   }
// }