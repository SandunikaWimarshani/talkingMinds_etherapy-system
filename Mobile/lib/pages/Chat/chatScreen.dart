// import 'package:dialog_flowtter/dialog_flowtter.dart';
// import 'package:flutter/material.dart';
// import 'package:therapy_application/pages/Chat/Messages.dart';
// import 'package:therapy_application/pages/appointment.dart';
// import 'package:therapy_application/pages/list.dart';
// import 'package:therapy_application/pages/schedule.dart';
// import 'package:therapy_application/pages/settings.dart';
// import 'package:therapy_application/pages/welcome.dart';

// class chatScreen extends StatefulWidget {
//   const chatScreen({super.key});

//   @override
//   State<chatScreen> createState() => _chatScreenState();
// }

// class _chatScreenState extends State<chatScreen> {
//    int myIndex = 0;

//    late DialogFlowtter dialogFlowtter;
//    final TextEditingController _controller = TextEditingController();

//    List<Map<String, dynamic>> messages = [];

//    @override
//    void initState(){
//     DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
//     super.initState();
//    }
   
    


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//     resizeToAvoidBottomInset: false,
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 0,
//         // ignore: deprecated_member_use
//         brightness: Brightness.light,
//         backgroundColor: Colors.white,
        
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
//             Navigator.push(context, MaterialPageRoute(builder: (context) => Messages(messages: messages)));
//           },
//           )
//         ],
//       ),
      
//     );


//       bottomNavigationBar: BottomNavigationBar(
//           type: BottomNavigationBarType.fixed,
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
//             icon: Icon(Icons.feedback_outlined),
//             label: 'Feedback'
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.settings),
//             label: 'Settings'
//           )
//         ]
        
//         );
  
      
//   }
// }