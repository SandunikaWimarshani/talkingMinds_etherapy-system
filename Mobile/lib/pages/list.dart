// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:therapy_application/pages/Profiles/profile1.dart';
import 'package:therapy_application/pages/Profiles/profile2.dart';
import 'package:therapy_application/pages/Profiles/profile3.dart';
import 'package:therapy_application/pages/Profiles/profile4.dart';
import 'package:therapy_application/pages/Profiles/profile5.dart';
import 'package:therapy_application/pages/Profiles/profile6.dart';
import 'package:therapy_application/pages/appointment.dart';

import 'package:therapy_application/pages/schedule.dart';
import 'package:therapy_application/pages/settings.dart';
import 'package:therapy_application/pages/welcome.dart';


class Lists extends StatefulWidget {
  const Lists({super.key});

  @override
  State<Lists> createState() => _ListsState();
}

class _ListsState extends State<Lists> {
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
        /*actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
            color: Colors.black,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            color: Colors.black,
              
            
          )
        ],*/
        
      ),
      body: ListView(
        padding: const EdgeInsets.all(14),
        children:  [
          
          
          

          //Counselor list
          const SizedBox(height: 15,),
          const Text("Choose your Counselors",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold
          ),
          
          ),
          const Spacer(),
         
          
          Column(
            children: [
              GestureDetector(
                
              child:Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: AssetImage('assets/Images/pro1.jpg'),
                        fit: BoxFit.cover
                      )
                    ),
                  ),

                
                  
                  const SizedBox(width: 35,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:   [
                      Text("Mr. Henry Wilson",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        
                      ),
                      
                      
                      ),
                      Row(
                       children: [
                        Text('5.3'),
                    Icon(Icons.star, color: Color.fromARGB(255, 226, 209, 56)),
                    
                    ],

                ),
         
                      
                     
                      
                    ],
                  ),
                ],
              ),
              
              ),
              
            ],
          ),
          
          Container(
            width: MediaQuery.of(context).size.width*0.1,
            padding: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 5,
            ),
         
         
         child:ElevatedButton(
          
          style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(255, 84, 71, 88),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(200)
            )
          ),
          child: const Text("View Profile",
          style: TextStyle(
            color: Colors.white
          ),
          
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const profileOne()),
            );
          },
         ),
          ),

          Column(
            children: [
              GestureDetector(
                
              child:Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: AssetImage('assets/Images/pro2.jpg'),
                        fit: BoxFit.cover
                      )
                    ),
                  ),

                
                  
                  const SizedBox(width: 35,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:   [
                      Text("Mr. Allan Lewis",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        
                      ),
                      
                      
                      ),
                      Row(
                       children: [
                    Text('4.2'),
                    Icon(Icons.star, color: Color.fromARGB(255, 226, 209, 56)),
                    
                    ],

                ),
                     
                      
                    ],
                  )
                ],
              )
              )
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width*0.1,
            padding: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 5,
            ),
         
         
         child:ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(255, 84, 71, 88),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(200)
            )
          ),
          child: const Text("View Profile",
          style: TextStyle(
            color: Colors.white
          ),
          
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const profileTwo()),
            );
          },
         ),
          ),

          Column(
            children: [
              GestureDetector(
                
              child:Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: AssetImage('assets/Images/pro3.jpg'),
                        fit: BoxFit.cover
                      )
                    ),
                  ),

                
                  
                  const SizedBox(width: 35,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:  [
                      Text("Mrs. Jessica Megan",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        
                      ),
                      
                      
                      ),
                      Row(
                       children: [
                    Text('4.7'),
                    Icon(Icons.star, color: Color.fromARGB(255, 226, 209, 56)),
                    
                    ],

                ),
                     
                      
                    ],
                  )
                ],
              )
              )
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width*0.1,
            padding: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 5,
            ),
         
         
         child:ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(255, 84, 71, 88),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(200)
            )
          ),
          child: const Text("View Profile",
          style: TextStyle(
            color: Colors.white
          ),
          
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const profileThree()),
            );
          },
         ),
          ),
          Column(
            children: [
              GestureDetector(
                
              child:Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: AssetImage('assets/Images/pro4.jpg'),
                        fit: BoxFit.cover
                      )
                    ),
                  ),

                
                  
                  const SizedBox(width: 35,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:  [
                      Text("Mr. Harry Jake",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        
                      ),
                      
                      
                      ),
                      Row(
                       children: [
                    Text('3.6'),
                    Icon(Icons.star, color: Color.fromARGB(255, 226, 209, 56)),
                    
                    ],

                ),
                     
                      
                    ],
                  )
                ],
              )
              )
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width*0.1,
            padding: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 5,
            ),
         
         
         child:ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(255, 84, 71, 88),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(200)
            )
          ),
          child: const Text("View Profile",
          style: TextStyle(
            color: Colors.white
          ),
          
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const profileFour()),
            );
          },
         ),
          ),
           Column(
            children: [
              GestureDetector(
                
              child:Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: AssetImage('assets/Images/pro5.jpg'),
                        fit: BoxFit.cover
                      )
                    ),
                  ),

                
                  
                  const SizedBox(width: 35,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:   [
                      Text("Mrs. Jessica Megan",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        
                      ),
                      
                      
                      ),
                      Row(
                       children: [
                    Text('4.0'),
                    Icon(Icons.star, color: Color.fromARGB(255, 226, 209, 56)),
                    
                    ],

                ),
                     
                      
                    ],
                  )
                ],
              )
              )
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width*0.1,
            padding: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 5,
            ),
         
         
         child:ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(255, 84, 71, 88),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(200)
            )
          ),
          child: const Text("View Profile",
          style: TextStyle(
            color: Colors.white
          ),
          
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const profileFive()),
            );
          },
         ),
          ),

          Column(
            children: [
              GestureDetector(
                
              child:Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: AssetImage('assets/Images/pro6.jpg'),
                        fit: BoxFit.cover
                      )
                    ),
                  ),

                
                  
                  const SizedBox(width: 35,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:   [
                      Text("Mr. Peter Nelson",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        
                      ),
                      
                      
                      ),
                      Row(
                       children: [
                    Text('3.2'),
                    Icon(Icons.star, color: Color.fromARGB(255, 226, 209, 56)),
                    
                    ],

                ),
                     
                      
                    ],
                  )
                ],
              )
              )
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width*0.1,
            padding: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 5,
            ),
         
         
         child:ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(255, 84, 71, 88),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(200)
            )
          ),
          child: const Text("View Profile",
          style: TextStyle(
            color: Colors.white
          ),
          
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const profileSix()),
            );
          },
         ),
          ),

          
        ],
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
        ]),
    
    );
  }
}

/*class CounselorModel {
  final String name;
  final String position;
  final int averageReview;
  final int totaleReview;
  final String profile;

  CounselorModel(
    this.name, 
    this.position, 
    this.averageReview, 
    this.totaleReview, 
    this.profile
    );
}*/


