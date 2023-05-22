import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:therapy_application/pages/ListAppointment.dart';
import 'package:therapy_application/pages/MessagePage.dart';
import 'package:therapy_application/pages/Settings/profile.dart';
import 'package:therapy_application/pages/confirm.dart';
import 'package:therapy_application/pages/list.dart';
import 'package:therapy_application/pages/schedule.dart';
import 'package:therapy_application/pages/welcome.dart';

class Appointment extends StatefulWidget {
  const Appointment({Key? key});

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  int myIndex = 0;

  void deleteAppointment(String appointmentId) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      await firestore.collection('appointment').doc(appointmentId).delete();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Appointment deleted successfully.'),
        ),
      );
    } catch (e) {
      print('Error deleting appointment: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Failed to delete appointment.'),
        ),
      );
    }
  }

  Future<void> _showDeleteConfirmationDialog(String appointmentId) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Delete'),
          content: const Text('Are you sure you want to delete this appointment?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                deleteAppointment(appointmentId);
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double kDefaultPadding = 12.0;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Schedule()),
            );
          },
          icon: const Icon(Icons.arrow_back_ios_new_sharp),
          iconSize: 20,
          color: Colors.black,
        ),
        actions: [
          TextButton(
            child: const Text('Next'),
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 10, color: Colors.black),
              backgroundColor: Colors.transparent,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Confirm()),
              );
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
                SizedBox(width: 8),
                Text(
                  "talkingMinds",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Color.fromARGB(255, 97, 3, 72),
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Schedule Session",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 15),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('appointment').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final appointments = snapshot.data?.docs.reversed.toList();

                    return ListView.builder(
                      itemCount: appointments!.length,
                      itemBuilder: (context, index) {
                        final data = appointments[index].data() as Map<String, dynamic>;
                        final appointmentId = appointments[index].id;
                        final name = data['name'];
                        final email = data['email'];
                        final counselorName = data['counselorName'];
                        final date = data['date'];
                        final time = data['time'];

                        return Card(
                          color: Colors.blueGrey[50],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Name: $name',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text('Email: $email'),
                                Text('Counselor Name: $counselorName'),
                                Text('Date: $date'),
                                Text('Time: $time'),
                                SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        _showDeleteConfirmationDialog(appointmentId);
                                      },
                                      child: Text('Delete'),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => ListAppointment()),
                                        );
                                      },
                                      child: Text('Update'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }

                  return const SizedBox(); // Return an empty container if no data is available
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Welcome()),
            );
          }
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Lists()),
            );
          }
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  Appointment()),
            );
          }
          if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Profile()),
            );
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
            label: 'List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule_outlined),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Appointment(),
    ),
  );
}
