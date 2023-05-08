import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:therapy_application/pages/appointment.dart';
import 'package:therapy_application/pages/first.dart';
import 'package:therapy_application/pages/list.dart';
import 'package:therapy_application/pages/quiz.dart/second_quiz.dart';
import 'package:therapy_application/pages/schedule.dart';
import 'package:therapy_application/pages/settings.dart';
import 'package:therapy_application/pages/welcome.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // add Firebase Cloud Firestore dependency

class FirstQuiz extends StatefulWidget {
  const FirstQuiz({super.key});

  @override
  State<FirstQuiz> createState() => _FirstQuizState();
}

class _FirstQuizState extends State<FirstQuiz> {
  int myIndex = 0;
   int selectedAnswerIndex = -1; // initialize with -1 to indicate no answer selected
  final FirebaseFirestore _db = FirebaseFirestore.instance; // create a Firebase Cloud Firestore instance

  void _storeAnswer() async {
    await _db.collection('Clients').add({
      'question': 'What type of therapy are you looking for?',
      'answer': selectedAnswerIndex >= 0 ? selectedAnswerIndex + 1 : null, // store answer index (1-based) or null if no answer selected
    }); // store answer in the "Clients" collection
  }
  
  @override
  Widget build(BuildContext context) {
    double kDefaultPadding = 22.0;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        
        elevation: 0,
        // ignore: deprecated_member_use
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>  const First()));
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
              text: "Question 1",
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
                  "What type of therapy are you looking for?",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Container(
                  margin: EdgeInsets.only(top: kDefaultPadding),
                  padding: EdgeInsets.all(kDefaultPadding),
                  decoration: BoxDecoration(
                    border: Border.all(color: selectedAnswerIndex == 0 ? Colors.red : Colors.black), // highlight if selected),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      const Text(
                        " Individual",
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
                          border: Border.all(color: selectedAnswerIndex == 0 ? Colors.red : Colors.black) // highlight if selected
                          
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
                    border: Border.all(color: selectedAnswerIndex == 1 ? Colors.red : Colors.black), // highlight if selected
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      const Text(
                        " Couple",
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
                      child: Container(
                        height: 26,
                        width: 26,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: selectedAnswerIndex == 1 ? Colors.red : Colors.black) // highlight if selected
                          
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
                    border: Border.all(color: selectedAnswerIndex == 2 ? Colors.red : Colors.black), // highlight if selected
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      const Text(
                        " Group",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16
                        ),
                      ),
                      GestureDetector( // wrap the container with GestureDetector to add the onPressed callback
                      onTap: () {
                        setState(() {
                          selectedAnswerIndex = 2; // update selected answer index
                        });
                      },
                      child: Container(
                        height: 26,
                        width: 26,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: selectedAnswerIndex == 2 ? Colors.red : Colors.black) // highlight if selected
                          
                        ),
                      )
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
                        MaterialPageRoute(builder: (context) => const SecondQuiz()),
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
    // bottomNavigationBar: BottomNavigationBar(
    //   type: BottomNavigationBarType.fixed,
    //       onTap: (index) {
    //         if(index == 0){
    //           Navigator.push(context, MaterialPageRoute(builder: (context) => const Welcome()));
    //         } 
    //         if(index ==1){
    //           Navigator.push(context, MaterialPageRoute(builder: (context) => const Lists()));
    //         }
    //         if(index ==2){
    //           Navigator.push(context, MaterialPageRoute(builder: (context) => const Appointment()));
    //         }
    //         if(index ==3){
    //           Navigator.push(context, MaterialPageRoute(builder: (context) => const Appointment()));
    //         }
    //         setState(() {
    //           myIndex = index;
    //         });
            
    //       },
    //       currentIndex: myIndex,
    //       items: const [
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.home),
    //         label: 'Home',
    //         ),
          
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.list_alt_outlined),
    //         label: 'List'
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.feedback_outlined),
    //         label: 'Feedback'
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.settings),
    //         label: 'Settings'
    //       )
    //     ]),
    
    
    );
    
  }
}