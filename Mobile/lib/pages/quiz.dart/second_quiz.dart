import 'package:flutter/material.dart';
import 'package:therapy_application/pages/appointment.dart';
import 'package:therapy_application/pages/list.dart';
import 'package:therapy_application/pages/quiz.dart/first_quiz.dart';
import 'package:therapy_application/pages/quiz.dart/third_quiz.dart';
import 'package:therapy_application/pages/schedule.dart';
import 'package:therapy_application/pages/welcome.dart';


class SecondQuiz extends StatefulWidget {
  const SecondQuiz({super.key});

  @override
  State<SecondQuiz> createState() => _SecondQuizState();
}

class _SecondQuizState extends State<SecondQuiz> {
  int myIndex = 0;
  int selectedAnswerIndex = -1; // initialize with -1 to indicate no answer selected
  
  @override
  Widget build(BuildContext context) {
    double kDefaultPadding = 18.0;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        
        elevation: 0,
        // ignore: deprecated_member_use
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>  const FirstQuiz()));
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
              text: "Question 2",
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
                  "How old are you?",
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
                        " Below 10",
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
                          border: Border.all(color: selectedAnswerIndex == 0 ? Colors.red : Colors.black), // highlight if selected),
                          
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
                    border: Border.all(color: selectedAnswerIndex == 1 ? Colors.red : Colors.black), // highlight if selected),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      const Text(
                        " 10-18",
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
                          border: Border.all(color: selectedAnswerIndex == 1 ? Colors.red : Colors.black), // highlight if selected),
                          
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
                    border: Border.all(color: selectedAnswerIndex == 2 ? Colors.red : Colors.black), // highlight if selected),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      const Text(
                        " 18-30",
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
                      child:Container(
                        height: 26,
                        width: 26,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: selectedAnswerIndex == 2 ? Colors.red : Colors.black), // highlight if selected),
                          
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
                    border: Border.all(color: selectedAnswerIndex == 3 ? Colors.red : Colors.black), // highlight if selected),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      const Text(
                        "30-50",
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
                          border: Border.all(color: selectedAnswerIndex == 3 ? Colors.red : Colors.black), // highlight if selected),
                          
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
                    border: Border.all(color: selectedAnswerIndex ==4 ? Colors.red : Colors.black), // highlight if selected),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      const Text(
                        " Above 50",
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
                          border: Border.all(color: selectedAnswerIndex == 4 ? Colors.red : Colors.black), // highlight if selected),
                          
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
                        MaterialPageRoute(builder: (context) => const ThirdQuiz()),
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
    
    
    
    );
    
  }
}