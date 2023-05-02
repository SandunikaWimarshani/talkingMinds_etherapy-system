import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:therapy_application/pages/appointment.dart';
import 'package:therapy_application/pages/profile.dart';
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
            Navigator.push(context, MaterialPageRoute(builder: (context) =>  const Profile()));
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
              Navigator.push(context, MaterialPageRoute(builder: (context) =>  const Schedule()));
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
                        backgroundImage: AssetImage('assets/cover.png'),
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
        children:  [
          const Text("Settings",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 144, 41, 103)
          ),
          
          ),
          const SizedBox(height: 30,),
          const ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/logo.jpg'),
            ),
            title: Text("",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 25,
            ),
            
            ),
            
          ),
          const Divider(height: 50,),
          ListTile(
            onTap: () {},
            leading: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 224, 157, 179),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                CupertinoIcons.person,
                size:25,
              ),
            ),
            title: const Text("Profile",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
            
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
              
            
          ),
          const SizedBox(height: 20,),
          ListTile(
            onTap: () {},
            leading: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 224, 157, 179),
                shape: BoxShape.circle,
              ),
              child: const Icon(
               Icons.notifications_none_outlined,
                size:25,
              ),
            ),
            title: const Text("Notification",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
            
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
              
            
          ),
          const SizedBox(height: 20,),
          ListTile(
            onTap: () {},
            leading: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 224, 157, 179),
                shape: BoxShape.circle,
              ),
              child: const Icon(
               Icons.privacy_tip_outlined,
                size:25,
              ),
            ),
            title: const Text("Privacy",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
            
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
              
            
          ),
          const SizedBox(height: 20,),
          ListTile(
            onTap: () {},
            leading: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 224, 157, 179),
                shape: BoxShape.circle,
              ),
              child: const Icon(
               Icons.logout_outlined,
                size:25,
              ),
            ),
            title: const Text("Log out",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
            
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
              
            
          ),

        ]   
        
      ),
      


      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
          onTap: (index) {
            if(index == 0){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Welcome()));
            } 
            if(index ==1){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Schedule()));
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
            icon: Icon(Icons.event_available_outlined),
            label: 'Appoinmnets'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feedback_outlined),
            label: 'Feedback'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings'
          )
        ]),
    
    );
  }
}