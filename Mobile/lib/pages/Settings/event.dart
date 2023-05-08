import 'package:flutter/material.dart';
import 'package:therapy_application/pages/settings.dart';

class Event extends StatefulWidget {
  const Event({Key? key}) : super(key: key);

  @override
  _EventState createState() => _EventState();
}

class _EventState extends State<Event> {
  final List<Map<String, dynamic>> _notifications = [    {      'icon': Icons.notifications_active,      'title': 'New message from Jane',      'subtitle': 'Hello, how are you doing?',    },    {      'icon': Icons.notifications_active,      'title': 'New appointment',      'subtitle': 'You have an appointment with Dr. Smith tomorrow',    },    {      'icon': Icons.notifications_active,      'title': 'New message from John',      'subtitle': 'Can we schedule a call this week?',    },  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Settings()));
          },
          icon: const Icon(Icons.arrow_back_ios_new_sharp),
          iconSize: 20,
          color: Colors.black,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/Images/cover.png'),
                ),
                Text(
                  "talkingMinds",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Color.fromARGB(255, 97, 3, 72),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        
      ),
      body: ListView.builder(
        itemCount: _notifications.length,
        itemBuilder: (BuildContext context, int index) {
          final notification = _notifications[index];
          return ListTile(
            leading: Icon(
              notification['icon'],
              color: Theme.of(context).primaryColor,
            ),
            title: Text(
              notification['title'],
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(notification['subtitle']),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color: Colors.grey[500],
            ),
            onTap: () {
              // Handle notification tap
            },
          );
        },
      ),
    );
  }
}
