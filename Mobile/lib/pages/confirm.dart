import 'package:flutter/material.dart';
import 'package:therapy_application/pages/Chat/Messages.dart';
import 'package:therapy_application/pages/Chat/chatScreen.dart';
import 'package:therapy_application/pages/MessagePage.dart';
import 'package:therapy_application/pages/Video/videocall.dart';
import 'package:therapy_application/pages/Video/Videocall.dart';
import 'package:therapy_application/pages/appointment.dart';
import 'package:therapy_application/pages/chatScreen.dart';
import 'package:therapy_application/pages/confirm.dart';
import 'package:therapy_application/pages/list.dart';
import 'package:therapy_application/pages/meeting.dart';
import 'package:therapy_application/pages/schedule.dart';
import 'package:therapy_application/pages/settings.dart';
import 'package:therapy_application/pages/welcome.dart';

class Confirm extends StatefulWidget {
  const Confirm({Key? key});

  @override
  State<Confirm> createState() => _ConfirmState();
}

class _ConfirmState extends State<Confirm> {
  int myIndex = 0;

  @override
  Widget build(BuildContext context) {
    double kDefaultPadding = 12.0;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => chatScreen()));
          },
          icon: const Icon(Icons.arrow_back_ios_new_sharp),
          iconSize: 20,
          color: Colors.black,
        ),
        actions: [
          TextButton(
            child: const Text('Next'),
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 10, color: Colors.black),
              backgroundColor: Colors.transparent,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => chatScreen()));
            },
          ),
        ],
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/Images/cover.png'),
                ),
                Text(
                  "talkingMinds",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Color.fromARGB(255, 97, 3, 72),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                child: Column(
                  children: [
                    Spacer(
                      flex: 2,
                    ),
                    Text(
                      "Chat with a Counselor Now",
                      style: TextStyle(
                        fontSize: 35,
                        color: Color.fromARGB(255, 234, 180, 199),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Spacer(),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => chatScreen()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Chat with Me",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                child: Image.asset(
                  'assets/Images/chat.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Welcome()));
          }
          if (index == 1) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Lists()));
          }
          if (index == 2) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ChatApp()));
          }
          if (index == 3) {
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
            label: 'List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
