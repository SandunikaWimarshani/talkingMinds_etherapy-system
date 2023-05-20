import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:therapy_application/pages/Chat/feedbackPage.dart';
import 'package:therapy_application/pages/MessagePage.dart';

import 'package:therapy_application/pages/Settings/event.dart';
import 'package:therapy_application/pages/Settings/profile.dart';
import 'package:therapy_application/pages/appointment.dart';
import 'package:therapy_application/pages/list.dart';
import 'package:therapy_application/pages/schedule.dart';
import 'package:therapy_application/pages/welcome.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int myIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        // ignore: deprecated_member_use
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>  const Appointment()));
          },
          icon: const Icon(Icons.arrow_back_ios_new_sharp),
          iconSize: 20,
          color: Colors.black,
        ),
        
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                  Row(
                    children: const [
                       CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage('assets/Images/cover.png'),
                      ),
                       Text("talkingMinds",
                       textAlign: TextAlign.start,
                       style: TextStyle(
                        color: Color.fromARGB(255, 97, 3, 72),
                        fontWeight: FontWeight.bold
                       ),
                       )
                      
                    ],
                  ),
                  
                ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16, top: 16, bottom: 8),
            child: Text(
              'Settings',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255,144,41,103),
              ),
            ),
          ),

          const Divider(
            color: Colors.black,
            height: 0,
            thickness: 0.5,
            indent: 16,
            endIndent: 16,
          ),

            ListTile(
            onTap: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Profile()),
            );
            },
            leading: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 224, 157, 179),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.person,
                size: 25,
              ),
            ),
            title: const Text(
              'Profile',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          ),
          const Divider(
            color: Colors.black,
            height: 0,
            
            indent: 16,
            endIndent: 16,
          ),

          ListTile(
            onTap: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Event()),
            );
            },
            leading: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 224, 157, 179),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.notifications,
                size: 25,
              ),
            ),
            title: const Text(
              'Notification',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          ),
          const Divider(
            color: Colors.black,
            height: 0,
           
            indent: 16,
            endIndent: 16,
          ),

          ListTile(
            onTap: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FeedbackPage()),
            );
            },
            leading: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 224, 157, 179),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.feedback,
                size: 25,
              ),
            ),
            title: const Text(
              'Feedback',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          ),
          const Divider(
            color: Colors.black,
            height: 0,
           
            indent: 16,
            endIndent: 16,
          ),

          ListTile(
            onTap: () {},
            leading: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 224, 157, 179),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.privacy_tip,
                size: 25,
              ),
            ),
            title: const Text(
              'Policy Privacy',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          ),
          const Divider(
            color: Colors.black,
            height: 0,
            thickness: 0.5,
            indent: 16,
            endIndent: 16,
          ),

          


        ],

        
      ),
      


      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
          onTap: (index) {
            if(index == 0){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Welcome()));
            } 
            if(index ==1){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Lists()));
            }
            if(index ==2){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ChatApp()));
            }
            if(index ==3){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Settings()));
            }
            setState(() {
              myIndex = index;
            });
            
          },
          currentIndex: myIndex,
          items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            ),
          
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined),
            label: 'List'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'Chat'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings'
          )
        ]),
    
    );
  }
}