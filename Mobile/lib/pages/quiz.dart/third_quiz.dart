import 'package:flutter/material.dart';
import 'package:therapy_application/pages/appointment.dart';
import 'package:therapy_application/pages/quiz.dart/fourth_quiz.dart';
import 'package:therapy_application/pages/quiz.dart/second_quiz.dart';
import 'package:therapy_application/pages/schedule.dart';
import 'package:therapy_application/pages/settings.dart';
import 'package:therapy_application/pages/welcome.dart';


class ThirdQuiz extends StatefulWidget {
  const ThirdQuiz({super.key});

  @override
  State<ThirdQuiz> createState() => _ThirdQuizState();
}

class _ThirdQuizState extends State<ThirdQuiz> {
  int myIndex = 0;
  int selectedAnswerIndex = -1; // initialize with -1 to indicate no answer selected
  
  @override
  Widget build(BuildContext context) {
    double kDefaultPadding = 12.0;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        
        elevation: 0,
        // ignore: deprecated_member_use
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>  const SecondQuiz()));
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
              text: "Question 3",
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
                  "What is your realtionship status?",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Container(
                  margin: EdgeInsets.only(top: kDefaultPadding),
                  padding: EdgeInsets.all(kDefaultPadding),
                  decoration: BoxDecoration(
                    border: Border.all(color: selectedAnswerIndex == 0 ? Colors.red : Colors.black), // highlight if selected
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      const Text(
                        " Single",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16
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
                          border: Border.all(color: selectedAnswerIndex == 0 ? Colors.red : Colors.black), // highlight if selected
                          
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
                    border: Border.all(color: selectedAnswerIndex == 1 ? Colors.red : Colors.black),// highlight if selected
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      const Text(
                        " Married",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16
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
                          border: Border.all(color: selectedAnswerIndex == 1 ? Colors.red : Colors.black), 
                          
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
                        " In a relationship",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16
                        ),
                      ),
                      GestureDetector( // wrap the container with GestureDetector to add the onPressed callback
                      onTap: () {
                        setState(() {
                          selectedAnswerIndex =2; // update selected answer index
                        });
                      },
                      child:Container(
                        height: 26,
                        width: 26,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: selectedAnswerIndex == 2 ? Colors.red : Colors.black), 
                          
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
                    border: Border.all(color: selectedAnswerIndex == 3 ? Colors.red : Colors.black), 
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      const Text(
                        " Seperated",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16
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
                          border: Border.all(color: selectedAnswerIndex == 3 ? Colors.red : Colors.black), 
                          
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
                    border: Border.all(color: selectedAnswerIndex == 4 ? Colors.red : Colors.black), 
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      const Text(
                        " Divorced",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16
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
                          border: Border.all(color: selectedAnswerIndex == 4 ? Colors.red : Colors.black), 
                          
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
                    border: Border.all(color: selectedAnswerIndex == 5 ? Colors.red : Colors.black), 
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      const Text(
                        " Widwowed",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16
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
                          border: Border.all(color: selectedAnswerIndex == 5 ? Colors.red : Colors.black), 
                          
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
                        MaterialPageRoute(builder: (context) => const FourthQuiz()),
                      );
                   
                  },
                  child:Container(
                    width:double.maxFinite,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(kDefaultPadding*0.6),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 180, 109, 163),
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: const Text("NEXT",
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