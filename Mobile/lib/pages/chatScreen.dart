import 'package:flutter/material.dart';
import 'package:therapy_application/pages/Chat/Messages.dart';
import 'package:therapy_application/pages/Chat/chatScreen.dart';
import 'package:therapy_application/pages/MessagePage.dart';
import 'package:therapy_application/pages/Video/videocall.dart';
import 'package:therapy_application/pages/Video/Videocall.dart';
import 'package:therapy_application/pages/appointment.dart';
import 'package:therapy_application/pages/confirm.dart';
import 'package:therapy_application/pages/list.dart';
import 'package:therapy_application/pages/meeting.dart';
import 'package:therapy_application/pages/schedule.dart';
import 'package:therapy_application/pages/settings.dart';
import 'package:therapy_application/pages/welcome.dart';

class chatScreen extends StatefulWidget {
  const chatScreen({Key? key});

  @override
  State<chatScreen> createState() => _chatScreenState();
}

class _chatScreenState extends State<chatScreen> {
  int myIndex = 0;

  void showMeetingOptionsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Meeting Options'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Handle chat with counselor now
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ChatApp()));
                },
                child: const Text('Chat with a Counselor Now'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle join meeting
                  Navigator.push(context, MaterialPageRoute(builder: (context) => chatScreen()));
                },
                child: const Text('Join Meeting'),
              ),
            ],
          ),
        );
      },
    );
  }

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
            Navigator.push(context, MaterialPageRoute(builder: (context) =>  chatScreen()));
          },
          icon: const Icon(Icons.arrow_back_ios_new_sharp),
          iconSize: 20,
          color: Colors.black,
        ),
        actions: [
          TextButton(
            child: const Text('Next'),
            style: TextButton.styleFrom(
              textStyle: const TextStyle(
                fontSize: 10,
                color: Colors.black,
              ),
              backgroundColor: Colors.transparent,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>  chatScreen()));
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 5,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/Images/cover.png'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Welcome to the chat!!",
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const Text("Let's talk with your therapist"),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ChatApp()));
                        },
                        child: const Text('Chat with message'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showMeetingOptionsDialog();
                        },
                        child: const Text('Lets Meeting'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
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
