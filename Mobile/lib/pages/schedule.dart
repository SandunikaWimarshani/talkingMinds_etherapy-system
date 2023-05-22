import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:therapy_application/pages/MessagePage.dart';
import 'package:therapy_application/pages/Settings/profile.dart';
import 'package:therapy_application/pages/appointment.dart';
import 'package:therapy_application/pages/list.dart';
import 'package:therapy_application/pages/welcome.dart';

class Schedule extends StatefulWidget {
  const Schedule({Key? key});

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  int myIndex = 0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _counselorNameController = TextEditingController();

  void addAppointmentToFirebase(String name, String email, String counselorName,
      DateTime selectedDate) async {
    final appointmentCollection =
        FirebaseFirestore.instance.collection('appointments');
    final newAppointment = appointmentCollection.doc();

    final formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
    final formattedTime = DateFormat('HH:mm').format(selectedDate);

    final appointmentData = {
      'name': name,
      'email': email,
      'counselorName': counselorName,
      'date': formattedDate,
      'time': formattedTime,
    };

    await newAppointment.set(appointmentData);
  }

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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Schedule()),
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
              textStyle: const TextStyle(
                fontSize: 10,
                color: Colors.black,
              ),
              backgroundColor: Colors.transparent,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Appointment()),
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
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            height: MediaQuery.of(context).size.height - 10,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: const [
                    Text(
                      "Appointment Page",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Please reserve your appointment here",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 75, 73, 73),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Your Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Your Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!value.contains('@') || !value.contains('.')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _counselorNameController,
                  decoration: InputDecoration(
                    labelText: 'Counselor Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter counselor name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _timeController,
                  decoration: InputDecoration(
                    labelText: 'Time',
                    hintText: 'Select a time',
                    prefixIcon: Icon(Icons.timer),
                    border: OutlineInputBorder(),
                  ),
                  onTap: () async {
                    TimeOfDay? time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (time != null) {
                      _timeController.text = time.format(context);
                    }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a time';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _dateController,
                  decoration: InputDecoration(
                    labelText: 'Date',
                    hintText: 'Select a date',
                    prefixIcon: Icon(Icons.calendar_today),
                    border: OutlineInputBorder(),
                  ),
                  onTap: () async {
                    DateTime? date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 365)),
                    );
                    if (date != null) {
                      _dateController.text =
                          DateFormat('yyyy-MM-dd').format(date);
                    }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a date';
                    }
                    return null;
                  },
                ),
                Container(
                  padding: const EdgeInsets.only(top: 0, left: 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(color: Colors.black),
                  ),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final name = _nameController.text;
                        final email = _emailController.text;
                        final counselorName = _counselorNameController.text;
                        final selectedDate =
                            DateTime.parse(_dateController.text);
                        addAppointmentToFirebase(
                            name, email, counselorName, selectedDate);

                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Thank you for your reservation'),
                            actions: [
                              TextButton(
                                child: const Text('View'),
                                onPressed: () {
                                  // Handle 'View' button tap
                                },
                              ),
                              TextButton(
                                child: const Text('Next'),
                                onPressed: () {
                                  // Handle 'Next' button tap
                                },
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    color: const Color.fromARGB(186, 140, 92, 126),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Text(
                      "Book Appointment",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Welcome()));
          } else if (index == 1) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Lists()));
          } else if (index == 2) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Appointment()));
          } else if (index == 3) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Profile()));
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
