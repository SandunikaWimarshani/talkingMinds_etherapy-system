import 'package:flutter/material.dart';
import 'package:therapy_application/pages/appointment.dart';
import 'package:therapy_application/pages/feedback.dart';
import 'package:therapy_application/pages/list.dart';
import 'package:therapy_application/pages/schedule.dart';
import 'package:therapy_application/pages/settings.dart';
import 'package:therapy_application/pages/welcome.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int myIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Lists()),
            );
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
                  backgroundImage: AssetImage('assets/cover.png'),
                ),
                SizedBox(width: 10),
                Text(
                  'talkingMinds',
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
        actions: [
          TextButton(
            child: const Text(
              'Next',
              style: TextStyle(fontSize: 10, color: Colors.black),
            ),
            style: TextButton.styleFrom(
              backgroundColor: Colors.transparent,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Schedule()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/pro2.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                  ),
                  SizedBox(
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                     
            ),
                  ),
                
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children:  [
                  const Text("Mr. Allan Lewis",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 83, 58, 80)
                  ),
                  
                  ),
                  const SizedBox(height: 5,),
                  Row(
                    children: const [
                      Text(" Specialties : Relationship issues, Family conflicts, Sleeping disorders, Parenting issues, Anger management")
                    ],
                  ),

                  const SizedBox(height: 15,),
                  const Text(
                    "I have been a licensed mental health counselor (LMHC) for more than six years. I have worked with individuals, couples, families, and groups in non-profit, residential, and clinical practice settings. I also have expertise assisting individuals. I've had a lot of experience working with folks who want to improve their lives. I've developed a broad range of abilities, expertise, and solutions to help with problems like depression, anxiety, addiction, finding one's purpose, trauma, grief/loss issues, and low self-esteem.",
                    style: TextStyle(
                      color: Color.fromARGB(255, 78, 52, 80),
                      fontWeight: FontWeight.w400
                    ),
                    textAlign: TextAlign.justify,

                    ),
                  const SizedBox(height: 15,),
                  const Text(
                    "OR LCSW L9824",
                    style: TextStyle(
                      color: Color.fromARGB(255, 78, 52, 80),
                      fontWeight: FontWeight.w400
                    ),
                    textAlign: TextAlign.justify,

                    ),
                    
                    
              
                

                  const SizedBox(height: 30,),
          // ignore: sized_box_for_whitespace
          Container(
            width: MediaQuery.of(context).size.width*0.8,
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(40)),
              color: Color.fromARGB(255, 167, 77, 141)
    
            ),
            
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                
                 Expanded(
                  child: Text(
                    'Join with Me',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    
                  ),
    
                )
                
              ],
            ),
          )
          
          
          ]
          )
          )
          ]
          ),
                    

               
              ),
          ]
        )
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