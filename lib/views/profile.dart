import 'package:flutter/material.dart';
import 'package:crm_staff_ticketing/constant_widgets/home/button.dart';
import 'package:crm_staff_ticketing/constant_widgets/home/listtilewidget.dart';
import 'package:crm_staff_ticketing/constant_widgets/home/home_appbar.dart';
import 'package:crm_staff_ticketing/utils/colours.dart';
import 'package:crm_staff_ticketing/views/changepassword.dart';
import 'package:crm_staff_ticketing/views/contactsupport.dart';
import 'package:crm_staff_ticketing/views/editprofile.dart';
import 'package:crm_staff_ticketing/views/helpcenter.dart';
import 'package:crm_staff_ticketing/views/homepages.dart';
import 'package:crm_staff_ticketing/views/language.dart';
import 'package:crm_staff_ticketing/views/notificationpreference.dart';
import 'package:crm_staff_ticketing/views/theme.dart';

class Profilepage extends StatelessWidget {

  final String? image;
  Profilepage({super.key,required this.image});

  // Helper method to create sections
  Widget buildSection(List<Widget> children) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 4,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: children
            .asMap()
            .entries
            .map(
              (entry) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  entry.key == 0
                      ? ClipRRect(
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(16)),
                          child: entry.value,
                        )
                      : entry.key == children.length - 1
                          ? ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(16)),
                              child: entry.value,
                            )
                          : entry.value,
                  if (entry.key != children.length - 1)
                    const Divider(height: 1, color: Color(0xFFE5E7EB)),
                ],
              ),
            )
            .toList(),
      ),
    );
  }

  // Helper method to create each list item
  Widget buildListItem({
    required IconData icon,
    required String title,
    String? trailingText,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.grey.withOpacity(0.1),
      highlightColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xFF9CA3AF), size: 20),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF111827),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            if (trailingText != null)
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Text(
                  trailingText!,
                  style: const TextStyle(
                    color: Color(0xFF9CA3AF),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            const Icon(Icons.chevron_right, color: Color(0xFF9CA3AF)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scafoldcolor,
      appBar: HomeAppbar(
        titletext: 'Profile & Settings',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                    width: double.infinity,
                    color: Colors.white,
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(
                            image!,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Sarah Johnson',
                          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Senior Support Specialist',
                          style: TextStyle(fontSize: 16.0, color: Colors.grey[600]),
                        ),
                        Text(
                          'ID:Sp123455',
                          style: TextStyle(fontSize: 16.0, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 15),
              child: Column(
                children: [
                  // Profile Information Section
                  
                  SizedBox(height: 10),
            
                  // Settings Section - Buttons for different options
                  buildSection([
                    buildListItem(
                      icon: Icons.person_outline,
                      title: 'Edit Profile',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Editprofilepage()),
                        );
                      },
                    ),
                    buildListItem(
                      icon: Icons.lock_outline,
                      title: 'Change Password',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Changepassword()),
                        );
                      },
                    ),
                    buildListItem(
                      icon: Icons.notifications_none,
                      title: 'Notification Preferences',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => notificationpreference()),
                        );
                      },
                    ),
                  ]),
            
                  buildSection([
                    buildListItem(
                      icon: Icons.language,
                      title: 'Language',
                      trailingText: 'English',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Languagepage()),
                        );
                      },
                    ),
                    buildListItem(
                      icon: Icons.palette_outlined,
                      title: 'Theme',
                      trailingText: 'Light',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Themepage()),
                        );
                      },
                    ),
                  ]),
            
                  buildSection([
                    buildListItem(
                      icon: Icons.help_outline,
                      title: 'Help Center',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Helpcenterpage()),
                        );
                      },
                    ),
                    buildListItem(
                      icon: Icons.headset_mic_outlined,
                      title: 'Contact Support',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Contactsupportpage()),
                        );
                      },
                    ),
                  ]),
             Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Button(
                    buttonColor: Colors.red,
                    buttontextColor: Colors.white,
                    fontSize: 16,
                   
                    title: 'Logout',
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Homepages()));
                    },
                  ),
                )
            
            
            
            
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
