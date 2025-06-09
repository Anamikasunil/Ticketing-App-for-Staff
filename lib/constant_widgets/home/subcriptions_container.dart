// import 'package:crm_staff_ticketing/constant_widgets/home/button.dart';
// import 'package:crm_staff_ticketing/utils/colours.dart';
// import 'package:crm_staff_ticketing/utils/consts.dart';
// import 'package:crm_staff_ticketing/utils/curves.dart';
// import 'package:crm_staff_ticketing/utils/textstyle.dart';
// import 'package:flutter/material.dart';

// class SubcriptionsContainer extends StatelessWidget {
//   final String? image;
//   final String? title;
//   final String? subtitle;
//   final String? buttonText;
//   final double? height;
//   final double? width;
//   final double? imageheight;
//   final double? imagewidth;
//   final TextStyle Cont_titleStyle;
//   final TextStyle Cont_subtitleStyle;
//   final VoidCallback? onPressed;
//   final String? status; // Green color
//   final TextStyle? statusStyle;
//   final Color? statusColor; // Green color
//   final String? duration;
//   final Color? buttonColor; // default border radius
//   final Color? borderColor; // default border color
//   final double? buttonheight; // default border radius
//   final double? buttonwidth; // default border color
//  final Color? buttontextColor; // default border color

//   const SubcriptionsContainer({
//     super.key,
//     this.height,
//     this.width,
//     this.image,
//     this.title,
//     this.subtitle,
//     this.buttonText,
//     this.imageheight,
//     this.imagewidth,
//     required this.Cont_titleStyle,
//     required this.Cont_subtitleStyle,
//     this.onPressed,
//     this.status,
//     this.statusStyle,
//     this.statusColor,
//     this.duration,
//     this.buttonColor,
//     this.borderColor, 
//     this.buttonheight,
//     this.buttonwidth,
//     this.buttontextColor,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 2,
//       child: Container(
//         width: width ?? double.infinity,
//         height: height,
//         decoration: BoxDecoration(
//           color: Colors.white,
//            boxShadow: [
         
//       ],
//           borderRadius: BorderRadius.circular(borderRadius),
//           border: Border.all(color: lightgrey, width: .5),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(screenpadding),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//             Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Image(
//       image: NetworkImage(
//         image ??
//             'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg',
//       ),
//       height: imageheight ?? 70,
//       width: imagewidth ?? 70,
//       fit: BoxFit.cover,
//     ),
//     const SizedBox(width: 10),
//     Expanded(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Expanded(
//                 child: Text(
//                   title ?? '',
//                   style: Cont_titleStyle,
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ),
//               const SizedBox(width: 6),
//               if (status != null)
//                 Container(
//                   decoration: BoxDecoration(
//                     color: statusColor,
//                     borderRadius: BorderRadius.circular(borderRadius),
//                   ),
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//                   child: Text(status!, style: statusStyle),
//                 ),
//             ],
//           ),
//           const SizedBox(height: 4),
//           Text(
//             duration ?? '',
//             style: subheaderstyle,
//             maxLines: 1,
//             overflow: TextOverflow.ellipsis,
//           ),
//         ],
//       ),
//     ),
//   ],
// ),

//               sizedbox_const,
//                 Button(
//                   buttontextColor: buttontextColor,
//                 buttonColor: buttonColor,
//                 bordercolor: borderColor,
//                 title: buttonText ?? '',
//                 height: buttonheight ,
//                 width: buttonwidth,
//                 fontSize: 14,
//                 onPressed: onPressed!,
                
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
