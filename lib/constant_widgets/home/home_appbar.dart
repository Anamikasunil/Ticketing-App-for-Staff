
import 'package:flutter/material.dart';
import 'package:crm_staff_ticketing/utils/textstyle.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String titletext;
  final Widget? notificationIcon;
  final Widget? profileIcon;
  final VoidCallback? ontap;

  const HomeAppbar({
    super.key,
    required this.titletext,
    this.notificationIcon,
    this.profileIcon,
    this.ontap
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      shadowColor: Colors.white,
      // elevation: 1,  

      title: Text(titletext, style: appBarTitleStyle),
      actions: [
        IconButton(
          icon: notificationIcon ?? Text(''),
          onPressed: () {
            ontap ;
            print(notificationIcon);
            print('object');
          },
        ),

        // const Icon(  
        const SizedBox(width: 10),
    
        Padding(
          padding: const EdgeInsets.only(right: 12.0 ),
          child: profileIcon ?? Text('')
              // const CircleAvatar(
              //   radius: 20,
              //   backgroundImage: NetworkImage(
              //     'https://techcrunch.com/wp-content/uploads/2025/01/GettyImages-2173579179.jpg?resize=1280,853',
              //   ),
              // ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
