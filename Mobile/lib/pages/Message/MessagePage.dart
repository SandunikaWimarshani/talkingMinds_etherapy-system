import 'package:flutter/material.dart';
import 'package:therapy_application/pages/Chat/Messages.dart';
import 'package:therapy_application/pages/Chat/chatScreen.dart';
import 'package:therapy_application/pages/Video/videocall.dart';
import 'package:therapy_application/pages/appointment.dart';
import 'package:therapy_application/pages/confirm.dart';
import 'package:therapy_application/pages/list.dart';
import 'package:therapy_application/pages/meeting.dart';
import 'package:therapy_application/pages/schedule.dart';
import 'package:therapy_application/pages/settings.dart';
import 'package:therapy_application/pages/welcome.dart';



class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  int myIndex = 0;

  Widget _headBar(){
    return Center(
      child: Container(
        width: 320,
        height: 44,
        margin: EdgeInsets.only(bottom: 20, top: 20),
       
        child: Row(
          children: [
            Stack(
              children: [
                GestureDetector(
              child: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(22)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red.withOpacity(0.5),
                      spreadRadius: 10,
                      blurRadius: 20,
                      offset: const Offset(0, -10)
                    )
                  ]
                ),
              ),
            )
                
              ],
            )
            
          ],
        ),
      ),

    );
  }
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        // ignore: deprecated_member_use
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>  const Meeting()));
          },
          icon: const Icon(Icons.arrow_back_ios_new_sharp),
          iconSize: 20,
          color: Colors.black,
        ),
        actions: [
          TextButton(
            // ignore: sort_child_properties_last
            child: const Text('Next'),
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 10,
              color: Colors. black
              ),
              
              backgroundColor: Colors.transparent
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>  const Meeting()));
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
     body: SafeArea(
      child: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                title: _headBar(),
              )
            ],
          )
        ],
      ),
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Appointment()));
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
            icon: Icon(Icons.task_alt),
            label: 'Schedule'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings'
          )
      
        ])
         );
       
   
  }
}