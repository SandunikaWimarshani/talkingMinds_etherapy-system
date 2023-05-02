// ignore_for_file: avoid_unnecessary_containers, prefer_final_fields, unused_local_variable, unused_field, non_constant_identifier_names, prefer_typing_uninitialized_variables, sort_child_properties_last, duplicate_ignore, unused_label, empty_statements, dead_code

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:therapy_application/pages/appointment.dart';
import 'package:therapy_application/pages/profile.dart';
import 'package:therapy_application/pages/settings.dart';
import 'package:therapy_application/pages/welcome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Schedule extends StatefulWidget {
  const Schedule({super.key});
  

  @override
  State<Schedule> createState() => _ScheduleState();
}


 
 TextEditingController _dateController = TextEditingController();
 TextEditingController _timeController = TextEditingController();
 TextEditingController _nameController = TextEditingController();
 TextEditingController _emailController = TextEditingController();
 TextEditingController _counselornameController = TextEditingController();
 

class _ScheduleState extends State<Schedule> {
  int myIndex = 0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _date = TextEditingController();

  void addAppointmentToFirebase(String name, String email, String counselorName, DateTime selectedDate) async {
  // get a reference to the appointment collection
  final appointmentCollection = FirebaseFirestore.instance.collection('appointment');
  
  // create a new document to store the appointment data
  final newAppointment = appointmentCollection.doc();
  
  // format the date using the desired format
  final formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
  
  // format the date using the desired format
  final formattedTime = DateFormat('hh:mm').format(selectedDate);
  
  // create a map of the appointment data
  final appointmentData = {
   
    'name': name,
    'email': email,
    'counselorName': counselorName,
    'date': formattedDate,
    'time': formattedTime,
    
  };
  
  // store the appointment data in Firebase Firestore
  await newAppointment.set(appointmentData);
}


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
        leading: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>  const Profile()));
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
              textStyle: const TextStyle(fontSize: 10,
              color: Colors. black
              ),
              
              backgroundColor: Colors.transparent
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>  const Appointment()));
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
                        backgroundImage: AssetImage('assets/cover.png'),
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
                        Text("Appoinment Page",
                        
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
            
                        ),
                        
                        ),
                        SizedBox(height: 10,),
                        Text("Please reserve your appoinment here",
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 75, 73, 73),
                        ),
                        
                        )
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
                  controller: _counselornameController,
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
                      lastDate: DateTime.now().add(Duration(days: 365)),
                    );
                    if (date != null) {
                      _dateController.text = date.toString().substring(0, 10);
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
                        border: const Border(
                          bottom: BorderSide(color: Colors.black),
                          top: BorderSide(color: Colors.black),
                          left: BorderSide(color: Colors.black),
                          right: BorderSide(color: Colors.black),
            
                        )
                      ),
                      child: MaterialButton(
                        
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () async {
              // validate the form
              if (_formKey.currentState!.validate()) {
                // get the appointment details from the form
                final Name = _nameController.text;
                final Email = _emailController.text;
                final counselorName = _counselornameController.text;
                final selectedDate = DateTime.parse(_dateController.text);
                

                // save the appointment data to Firebase Firestore
                addAppointmentToFirebase(Name, Email, counselorName, selectedDate);

                // navigate to the next page
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Appointment()));
              }
            },

                  color: const Color.fromARGB(186, 140, 92, 126),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)
                  ),
                  
                  child: const Text(
                    "Book Appointment",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white
                    ),
                  ),
                )
                    )
                    
                  ]
                ),
              ),
            ),
      ),
         

      
      
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            if(index == 0){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Welcome()));
            } 
            if(index ==1){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Schedule()));
            }
            if(index ==2){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Appointment()));
            }
            if(index ==3){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Appointment()));
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
            icon: Icon(Icons.event_available_outlined),
            label: 'Appoinmnets'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feedback_outlined),
            label: 'Feedback'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings'
          )
        ]
        
        )
        );


  }
  
  
}



