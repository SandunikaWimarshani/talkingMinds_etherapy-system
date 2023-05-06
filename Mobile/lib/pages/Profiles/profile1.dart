import 'package:flutter/material.dart';
import 'package:therapy_application/pages/appointment.dart';
import 'package:therapy_application/pages/feedback.dart';
import 'package:therapy_application/pages/list.dart';
import 'package:therapy_application/pages/schedule.dart';
import 'package:therapy_application/pages/settings.dart';
import 'package:therapy_application/pages/welcome.dart';

class profileOne extends StatefulWidget {
  const profileOne({Key? key}) : super(key: key);

  @override
  _profileOneState createState() => _profileOneState();
}

class _profileOneState extends State<profileOne> {
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
                  image: AssetImage('assets/pro1.jpg'),
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
                  
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children:  [
                  const Text("Mr. Henry Wilson",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 83, 58, 80)
                  ),
                  
                  ),
                  const SizedBox(height: 5,),
                  Row(
                    children: const [
                      Text("Specialties : Depression, Coping with life changes, \nFamily of Origin Issues, Forgiveness, Men's Issues, \nSexuality, Social Anxiety and Phobia")
                    ],
                  ),

                

                  const SizedBox(height: 5,),
                  Row(
                    children: const [
                      Text("I have 12 years of professional work experience \nI have expertise assisting people with difficulties \nrelating to stress and anxiety, relationships, and \nintimate relationships. In my opinion, you are \nthe authority on your experience, and you possess \na variety of skills that will help you go through \ndifficult situations. \nIt requires bravery to start the process of looking for \na more rewarding and happy \nexistence. To help you with that process,\n I'm here.")
                    ],
                  ),
                  const SizedBox(height: 15,),
                  const Text(
                    "License number : KY LPCC 103842",
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