import 'package:flutter/material.dart';
import 'package:therapy_application/pages/Chat/Messages.dart';
import 'package:therapy_application/pages/MessagePage.dart';
import 'package:therapy_application/pages/Settings/profile.dart';
import 'package:therapy_application/pages/appointment.dart';
import 'package:therapy_application/pages/confirm.dart';
import 'package:therapy_application/pages/list.dart';
import 'package:therapy_application/pages/schedule.dart';
import 'package:therapy_application/pages/welcome.dart';


class start extends StatefulWidget {
  const start({super.key});

  @override
  State<start> createState() => _startState();
}

class _startState extends State<start> {
  int myIndex = 0;
  
  @override
  Widget build(BuildContext context) {
     double kDefaultPadding = 12.0;
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        // ignore: deprecated_member_use
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        
        
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
                    Text("We're waiting for you",
                     
                    style: TextStyle(
                      fontSize: 35,
                      color: Color.fromARGB(255, 234, 180, 199),
                      fontWeight: FontWeight.w700
                      
                    ),
                  
                    
                    ),
                    
                     const Spacer(),
                     const Spacer(),
                    

                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>  const Lists()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Next",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          Icon(Icons.arrow_forward)
                        ],
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),

            Expanded(
              flex: 3,
              child: Container(
                child: Image.asset('assets/Images/start.jpg',
                fit: BoxFit.cover
                
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Welcome()),
            );
          }
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Lists()),
            );
          }
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Appointment ()),
            );
          }
          if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Profile()),
            );
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
            icon: Icon(Icons.schedule_outlined),
            label: 'Schedule',
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
      
   

    
      
         
       

  
