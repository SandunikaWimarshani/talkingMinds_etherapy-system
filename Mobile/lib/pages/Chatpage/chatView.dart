// import 'package:flutter/material.dart';
// import 'package:therapy_application/pages/Chat/Messages.dart';
// import 'package:therapy_application/pages/Chat/chatScreen.dart';
// import 'package:therapy_application/pages/Message/MessagePage.dart';
// import 'package:therapy_application/pages/Video/videocall.dart';
// import 'package:therapy_application/pages/appointment.dart';
// import 'package:therapy_application/pages/confirm.dart';
// import 'package:therapy_application/pages/list.dart';
// import 'package:therapy_application/pages/meeting.dart';
// import 'package:therapy_application/pages/schedule.dart';
// import 'package:therapy_application/pages/settings.dart';
// import 'package:therapy_application/pages/welcome.dart';


// class chatView extends StatefulWidget {
//   const chatView({super.key});

//   @override
//   State<chatView> createState() => _chatViewState();
// }

// class _chatViewState extends State<chatView> {
//   int myIndex = 0;
  
//   @override
//   Widget build(BuildContext context) {
//      double kDefaultPadding = 12.0;
//     return  Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 0,
//         // ignore: deprecated_member_use
//         brightness: Brightness.light,
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.push(context, MaterialPageRoute(builder: (context) =>  const Meeting()));
//           },
//           icon: const Icon(Icons.arrow_back_ios_new_sharp),
//           iconSize: 20,
//           color: Colors.black,
//         ),
//         actions: [
//           TextButton(
//             // ignore: sort_child_properties_last
//             child: const Text('Next'),
//             style: TextButton.styleFrom(
//               textStyle: const TextStyle(fontSize: 10,
//               color: Colors. black
//               ),
              
//               backgroundColor: Colors.transparent
//             ),
//             onPressed: () {
//               Navigator.push(context, MaterialPageRoute(builder: (context) =>  const Confirm()));
//             },
//           ),
          
//         ],
//         title: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//                   Row(
//                     children: const [
//                        CircleAvatar(
//                         radius: 20,
//                         backgroundImage: AssetImage('assets/Images/cover.png'),
//                       ),
//                        Text("talkingMinds",
//                        textAlign: TextAlign.start,
//                        style: TextStyle(
//                         color: Color.fromARGB(255, 97, 3, 72),
//                         fontWeight: FontWeight.bold
//                        ),
//                        )
                      
//                     ],
//                   ),
                  
//                 ],
//         ),
//       ),

//       body: Padding(
//         padding: const EdgeInsets.only(top: 40),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children:  [
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 15),
//               child: Text("Confirm Appointments",
//               style: TextStyle(
//                 fontSize: 32,
//                 fontWeight: FontWeight.w500
//               ),
          
          
//               ),
              
              
//             ),
//                Container(
//             width: MediaQuery.of(context).size.width*0.75,
//             padding: const EdgeInsets.symmetric(
//               vertical: 10,
//               horizontal: 10,
//             ),
           
            
            
//             child: ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) =>  MessagePage()
//                   ),
//                 );
//               },
//               child: const Text('Chat'),
//             ),
//           )
            
          
//           ]
//         )
//       ),
      
   

    
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//           onTap: (index) {
//             if(index == 0){
//               Navigator.push(context, MaterialPageRoute(builder: (context) => const Welcome()));
//             } 
//             if(index ==1){
//               Navigator.push(context, MaterialPageRoute(builder: (context) => const Lists()));
//             }
//             if(index ==2){
//               Navigator.push(context, MaterialPageRoute(builder: (context) => const Appointment()));
//             }
//             if(index ==3){
//               Navigator.push(context, MaterialPageRoute(builder: (context) => const Settings()));
//             }
//             setState(() {
//               myIndex = index;
//             });
            
//           },
//           currentIndex: myIndex,
//           items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//             ),
          
//           BottomNavigationBarItem(
//             icon: Icon(Icons.list_alt_outlined),
//             label: 'List'
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.task_alt),
//             label: 'Schedule'
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.settings),
//             label: 'Settings'
//           )
      
//         ])
//          );
       
   
//   }
// }