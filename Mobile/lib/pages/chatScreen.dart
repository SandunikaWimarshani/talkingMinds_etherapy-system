// // ignore_for_file: depend_on_referenced_packages

// import 'package:flutter/material.dart';
// import 'package:dialog_flowtter/dialog_flowtter.dart';

// class ChatScreen extends StatefulWidget {
//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   final List<Map<String, dynamic>> _messages = [];

//   final TextEditingController _textEditingController = TextEditingController();

//   final DialogFlowtter dialogFlowtter = DialogFlowtter(
//     language: Language.english,
//     projectId: 'YOUR_PROJECT_ID',
//     apiKey: 'YOUR_API_KEY',
//   );

//   Future<void> _sendMessage(String message) async {
//     setState(() {
//       _messages.add({'text': message, 'isUser': true});
//     });

//     try {
//       final DialogFlowtterResponse response =
//           await dialogFlowtter.detectIntent(message);
//       final String text = response.message;

//       setState(() {
//         _messages.add({'text': text, 'isUser': false});
//       });
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Chatbot'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: _messages.length,
//               itemBuilder: (BuildContext context, int index) {
//                 final Map<String, dynamic> message = _messages[index];
//                 return Row(
//                   mainAxisAlignment: message['isUser']
//                       ? MainAxisAlignment.end
//                       : MainAxisAlignment.start,
//                   children: [
//                     Container(
//                       margin: const EdgeInsets.symmetric(
//                           horizontal: 16.0, vertical: 4.0),
//                       padding: const EdgeInsets.all(8.0),
//                       decoration: BoxDecoration(
//                         color: message['isUser']
//                             ? Colors.blue[100]
//                             : Colors.grey[300],
//                         borderRadius: BorderRadius.circular(16.0),
//                       ),
//                       child: Text(message['text']),
//                     ),
//                   ],
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: _textEditingController,
//                     decoration: InputDecoration(
//                       hintText: 'Type your message...',
//                       border: InputBorder.none,
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.send),
//                   onPressed: () {
//                     final String message = _textEditingController.text;
//                     _textEditingController.clear();
//                     _sendMessage(message);
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }