// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:therapy_application/pages/appointment.dart';
import 'package:therapy_application/pages/list.dart';
import 'package:therapy_application/pages/new.dart';
import 'package:therapy_application/pages/quiz.dart/fourth_quiz.dart';
import 'package:therapy_application/pages/schedule.dart';
import 'package:therapy_application/pages/settings.dart';
import 'package:therapy_application/pages/welcome.dart';


class FivethQuiz extends StatefulWidget {
  const FivethQuiz({super.key});

  @override
  State<FivethQuiz> createState() => _FivethQuizState();
}

class _FivethQuizState extends State<FivethQuiz> {
  int myIndex = 0;
  int selectedAnswerIndex = -1; // initialize with -1 to indicate no answer selected
  
  @override
  Widget build(BuildContext context) {
    double kDefaultPadding = 6.0;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        
        elevation: 0,
        // ignore: deprecated_member_use
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>  const FourthQuiz()));
          },
          icon: const Icon(Icons.arrow_back_ios_new_sharp),
          iconSize: 20,
          color: Colors.black,
        ),
       
        
    ),

    body: SafeArea(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
        children: [
          Text.rich(
            TextSpan(
              text: "Question 5",
              style: Theme.of(context).textTheme.headlineMedium,
              children: [
                TextSpan(
                  text: "/5",
                  style: Theme.of(context).textTheme.headlineMedium,
                )
              ],
            )
          ),
          const Divider(thickness: 1.5,),
          SizedBox(height: kDefaultPadding,),
          Container(
            padding: EdgeInsets.all(kDefaultPadding),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25)
            ),
            child: Column(
              children:  [
                Text(
                  "Please select all issues you have experienced or been concerned with recently.",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Container(
                  margin: EdgeInsets.only(top: kDefaultPadding),
                  padding: EdgeInsets.all(kDefaultPadding),
                  decoration: BoxDecoration(
                    border: Border.all(color: selectedAnswerIndex ==0 ? Colors.red : Colors.black), 
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      const Text(
                        " Trouble concentrating on simple things",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15
                        ),
                      ),
                      GestureDetector( // wrap the container with GestureDetector to add the onPressed callback
                      onTap: () {
                        setState(() {
                          selectedAnswerIndex = 0; // update selected answer index
                        });
                      },
                      child:Container(
                        height: 26,
                        width: 26,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: selectedAnswerIndex ==0 ? Colors.red : Colors.black),
                          
                        ),
                      )
                      )
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: kDefaultPadding),
                  padding: EdgeInsets.all(kDefaultPadding),
                  decoration: BoxDecoration(
                    border: Border.all(color: selectedAnswerIndex ==1 ? Colors.red : Colors.black),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      const Text(
                        " Depression",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15
                        ),
                      ),
                      GestureDetector( // wrap the container with GestureDetector to add the onPressed callback
                      onTap: () {
                        setState(() {
                          selectedAnswerIndex = 1; // update selected answer index
                        });
                      },
                      child:Container(
                        height: 26,
                        width: 26,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: selectedAnswerIndex ==1 ? Colors.red : Colors.black),
                          
                        ),
                      ),
                      )
                      
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: kDefaultPadding),
                  padding: EdgeInsets.all(kDefaultPadding),
                  decoration: BoxDecoration(
                    border: Border.all(color: selectedAnswerIndex ==2 ? Colors.red : Colors.black),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      const Text(
                        " Feeling like a failure",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15
                        ),
                      ),
                      GestureDetector( // wrap the container with GestureDetector to add the onPressed callback
                      onTap: () {
                        setState(() {
                          selectedAnswerIndex = 2; // update selected answer index
                        });
                      },
                      child:Container(
                        height: 26,
                        width: 26,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: selectedAnswerIndex ==2 ? Colors.red : Colors.black),
                          
                        ),
                      )
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: kDefaultPadding),
                  padding: EdgeInsets.all(kDefaultPadding),
                  decoration: BoxDecoration(
                    border: Border.all(color: selectedAnswerIndex ==3 ? Colors.red : Colors.black),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      const Text(
                        " Feeling tired or low energy",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15
                        ),
                      ),
                      GestureDetector( // wrap the container with GestureDetector to add the onPressed callback
                      onTap: () {
                        setState(() {
                          selectedAnswerIndex = 3; // update selected answer index
                        });
                      },
                      child:Container(
                        height: 26,
                        width: 26,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: selectedAnswerIndex ==3 ? Colors.red : Colors.black),
                          
                        ),
                      )
                      )
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: kDefaultPadding),
                  padding: EdgeInsets.all(kDefaultPadding),
                  decoration: BoxDecoration(
                    border: Border.all(color: selectedAnswerIndex ==4 ? Colors.red : Colors.black),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      const Text(
                        " Anxiety or panic attacts",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15
                        ),
                      ),
                      GestureDetector( // wrap the container with GestureDetector to add the onPressed callback
                      onTap: () {
                        setState(() {
                          selectedAnswerIndex = 4; // update selected answer index
                        });
                      },
                      child:Container(
                        height: 26,
                        width: 26,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: selectedAnswerIndex ==4 ? Colors.red : Colors.black),
                          
                        ),
                      ),
                      )
                      
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: kDefaultPadding),
                  padding: EdgeInsets.all(kDefaultPadding),
                  decoration: BoxDecoration(
                    border: Border.all(color: selectedAnswerIndex ==5 ? Colors.red : Colors.black),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      const Text(
                        " Moving or speaking slowly",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15
                        ),
                      ),
                      GestureDetector( // wrap the container with GestureDetector to add the onPressed callback
                      onTap: () {
                        setState(() {
                          selectedAnswerIndex = 5; // update selected answer index
                        });
                      },
                      child:Container(
                        height: 26,
                        width: 26,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: selectedAnswerIndex ==5 ? Colors.red : Colors.black),
                          
                        ),
                      ),
                      )
                      
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: kDefaultPadding),
                  padding: EdgeInsets.all(kDefaultPadding),
                  decoration: BoxDecoration(
                    border: Border.all(color: selectedAnswerIndex ==6 ? Colors.red : Colors.black),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      const Text(
                        " None of the above",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15
                        ),
                      ),
                      GestureDetector( // wrap the container with GestureDetector to add the onPressed callback
                      onTap: () {
                        setState(() {
                          selectedAnswerIndex = 6; // update selected answer index
                        });
                      },
                      child:Container(
                        height: 26,
                        width: 26,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: selectedAnswerIndex ==6 ? Colors.red : Colors.black),
                          
                        ),
                      ),
                      )

                      
                    ],
                  ),
                ),
                
              
              ],
              
            ),
          ),
          
          InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Lists()),
                      );
                   
                  },
                  child:Container(
                  width:double.maxFinite,
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.all(kDefaultPadding*1.2),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 180, 109, 163),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: const Text("DONE",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                  
                  ),
                  
                    
                  ),
                 )
          
        ],
        ),
        
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