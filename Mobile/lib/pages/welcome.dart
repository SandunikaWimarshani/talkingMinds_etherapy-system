import 'package:flutter/material.dart';
import 'package:therapy_application/pages/appointment.dart';
import 'package:therapy_application/pages/first.dart';
import 'package:therapy_application/pages/list.dart';
import 'package:therapy_application/pages/schedule.dart';


class Welcome extends StatefulWidget {
  const Welcome({super.key});
  

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
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
        
       
      ),
      
    body: SingleChildScrollView(
      child: SafeArea(
        
        child: Container(
          
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: const [
                  Text("talkingMinds",
                  selectionColor: Color.fromARGB(255, 67, 36, 36),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    fontStyle: FontStyle.italic
                    
                 
                  ),
                  
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("People who talk about their mental health struggles are not attention seeking, \nthey are Support Seeking.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 6, 117, 106),
                    fontSize: 15,
                  ),
                  
                  )
                  
                ],
                
              ),
              
              
              Container(
                height: MediaQuery.of(context).size.height/2,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/Images/cover.png'),
                  ),
                  
    
                ),
          ),
          
          const SizedBox(height: 10,),
          // ignore: sized_box_for_whitespace
          Container(
            width: MediaQuery.of(context).size.width*0.8,
            padding: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 5,
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              color: Color.fromARGB(255, 159, 95, 159)
    
            ),
            child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const First()),
                      );
                    },

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white,
                  ),
                  child: const Icon(Icons.chevron_right,
                  size: 30,
                  
                  ),
                ),
                
                
                 // ignore: prefer_const_constructors
                 Expanded(
                  child:TweenAnimationBuilder(
                    tween: Tween<double>(begin: 1, end: 0.9),
                    duration: const Duration(milliseconds: 500),
                    builder: (context, value, child) {
                      return Transform.scale(
                        scale: value,
                        child: child,
                      );
                    },
                 
                  child: const Text(
                    'Get Started',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  
                  
    
                ),
                
                 )
              ],
            ),
          )
          
          )
          ]
          )
          )
          
          ),
    ),
        

        
        // bottomNavigationBar: BottomNavigationBar(
        //   type: BottomNavigationBarType.fixed,
        //   onTap: (index) {
        //     if(index == 0){
        //       Navigator.push(context, MaterialPageRoute(builder: (context) => const Welcome()));
        //     } 
        //     if(index ==1){
        //       Navigator.push(context, MaterialPageRoute(builder: (context) => const Lists()));
        //     }
        //     if(index ==2){
        //       Navigator.push(context, MaterialPageRoute(builder: (context) => const Appointment()));
        //     }
        //     if(index ==3){
        //       Navigator.push(context, MaterialPageRoute(builder: (context) => const Settings()));
        //     }
        //     setState(() {
        //       myIndex = index;
        //     });
            
        //   },
        //   currentIndex: myIndex,
        //   items: const [
        //   BottomNavigationBarItem(
            
        //     icon: Icon(Icons.home),
        //     label: 'Home',
        //     ),
            
          
        //   BottomNavigationBarItem(
        //     icon: Icon(Icons.list_alt_outlined),
        //     label: 'List'
        //   ),
        //   BottomNavigationBarItem(
        //     icon: Icon(Icons.feedback_outlined),
        //     label: 'Feedback'
        //   ),
        //   BottomNavigationBarItem(
        //     icon: Icon(Icons.settings),
        //     label: 'Settings'
        //   )
        // ]),
        
        );


  }
}