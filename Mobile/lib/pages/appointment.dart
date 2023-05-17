import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:therapy_application/pages/confirm.dart';
import 'package:therapy_application/pages/list.dart';
import 'package:therapy_application/pages/schedule.dart';
import 'package:therapy_application/pages/settings.dart';
import 'package:therapy_application/pages/welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class Appointment extends StatefulWidget {
  const Appointment({super.key});

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  int myIndex = 0;

  @override
  Widget build(BuildContext context) {
    double kDefaultPadding = 12.0;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          // ignore: deprecated_member_use
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Schedule()));
            },
            icon: const Icon(Icons.arrow_back_ios_new_sharp),
            iconSize: 20,
            color: Colors.black,
          ),
          actions: [
            TextButton(
              // ignore: sort_child_properties_last
              child: const Text('Next'),
              style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 10, color: Colors.black),
                  backgroundColor: Colors.transparent),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Confirm()));
              },
            ),
          ],
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
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 40),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "Schedule Session",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
              ),
            ),
            
            SizedBox(height: 15),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('appointment')
                  .snapshots(),
              builder: (context, snapshot) {
                List<Widget> appointmentWidgets = [];
                if (snapshot.hasData) {
                  final appointments = snapshot.data?.docs.reversed.toList();
                  for (var appointment in appointments!) {
                    final appointmentWidget = Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(appointment['name']),
                        Text(appointment['email']),
                        Text(appointment['counselorName']),
                        Text(appointment['date']),
                        Text(appointment['time']),
                      ],
                    );

                    appointmentWidgets.add(appointmentWidget);
                  }
                }

                return ListView(
                  children: appointmentWidgets,
                );
              },
            )
          ]),
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              if (index == 0) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Welcome()));
              }
              if (index == 1) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Lists()));
              }
              if (index == 2) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Appointment()));
              }
              if (index == 3) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Appointment()));
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
                  icon: Icon(Icons.list_alt_outlined), label: 'List'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.task_alt), label: 'Schedule'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'Settings')
            ]));
  }
}
