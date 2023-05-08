import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import 'package:therapy_application/pages/appointment.dart';

class Messages extends StatefulWidget {
  final List messages;
  const Messages({Key? key, required this.messages}) : super(key: key);

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {

  late DialogFlowtter dialogFlowtter;
  final TextEditingController _controller = TextEditingController();

  List<Map<String, dynamic>> messages = [];
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
        
        actions: [
          TextButton(
            // ignore: sort_child_properties_last
            child: const Text('Next'),
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 10,
              color: Colors. black
              ),
              
              backgroundColor: Colors.transparent
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>  const Appointment()));
            },
          )
        ],
      ),

      body: Container(
        child: Column(
          children: [
            Expanded(child: Messages(messages: messages)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              color: Color.fromARGB(255, 225, 202, 167),
              child: Row(
                children: [
                  Expanded(child: TextField(
                    controller: _controller,
                    style: TextStyle(color: Colors.white),
                  )),
                  IconButton(onPressed: (){},
                  icon: Icon(Icons.send),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      
    );
  }
  }