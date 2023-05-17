import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:therapy_application/pages/appointment.dart';
import 'package:therapy_application/pages/list.dart';
import 'package:therapy_application/pages/settings.dart';
import 'package:therapy_application/pages/welcome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListAppointment extends StatefulWidget {
  const ListAppointment({Key? key}) : super(key: key);

  @override
  State<ListAppointment> createState() => _ListAppointmentState();
}

class _ListAppointmentState extends State<ListAppointment> {
  int myIndex = 0;

  // Define variables to store the appointment data
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _counselorNameController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void navigateToUpdateForm() {
    // Pass the appointment data to the update form page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UpdateForm(
          name: _nameController.text,
          email: _emailController.text,
          counselorName: _counselorNameController.text,
          date: _dateController.text,
          time: _timeController.text,
        ),
      ),
    ).then((updatedData) {
      if (updatedData != null) {
        // Update the appointment data with the updated values
        setState(() {
          _nameController.text = updatedData['name'];
          _emailController.text = updatedData['email'];
          _counselorNameController.text = updatedData['counselorName'];
          _dateController.text = updatedData['date'];
          _timeController.text = updatedData['time'];
        });
      }
    });
  }

   void deleteAppointment(DocumentSnapshot appointment) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmation'),
          content: const Text('Are you sure you want to delete this appointment?'),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () {
                FirebaseFirestore.instance
                    .collection('appointments')
                    .doc(appointment.id)
                    .delete()
                    .then((value) {
                  Navigator.of(context).pop();
                })
                .catchError((error) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Error'),
                        content: Text('Failed to delete the appointment: $error'),
                        actions: [
                          TextButton(
                            child: const Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                });
              },
            ),
          ],
        );
      },
    );
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
                context, MaterialPageRoute(builder: (context) => Appointment()));
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
                  context, MaterialPageRoute(builder: (context) => Appointment()));
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
                )
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
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
                          'Appointment List',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'You can view and manage your appointments here.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SafeArea(
                      child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('appointments')
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return const Text('Loading appointments...');
                          } else {
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                DocumentSnapshot appointment =
                                    snapshot.data!.docs[index];
                                String appointmentDate = DateFormat('yyyy-MM-dd')
                                    .format(appointment['date'].toDate());
                                String appointmentTime = DateFormat('HH:mm')
                                    .format(appointment['date'].toDate());
                                return ListTile(
                                  title: Text(appointment['name']),
                                  subtitle: Text(
                                    'Date: $appointmentDate\nTime: $appointmentTime',
                                  ),
                                  onTap: () {
                                    deleteAppointment(appointment);
                                    // Set the appointment data to the form controllers
                                    _nameController.text = appointment['name'];
                                    _emailController.text = appointment['email'];
                                    _counselorNameController.text =
                                        appointment['counselorName'];
                                    _dateController.text = appointmentDate;
                                    _timeController.text = appointmentTime;
                    
                                    // Navigate to the update form page
                                    navigateToUpdateForm();
                                  },
                                );
                              },
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
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
              MaterialPageRoute(builder: (context) => const Appointment()),
            );
          }
          if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Appointment()),
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
            icon: Icon(Icons.task_alt),
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


class UpdateForm extends StatefulWidget {
  final String name;
  final String email;
  final String counselorName;
  final String date;
  final String time;

  const UpdateForm({
    required this.name,
    required this.email,
    required this.counselorName,
    required this.date,
    required this.time,
  });

  @override
  State<UpdateForm> createState() => _UpdateFormState();
}

class _UpdateFormState extends State<UpdateForm> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _counselorNameController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // Set the initial values from the passed appointment data
    _nameController.text = widget.name;
    _emailController.text = widget.email;
    _counselorNameController.text = widget.counselorName;
    _dateController.text = widget.date;
    _timeController.text = widget.time;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Appointment'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Name',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextFormField(
                  controller: _nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                const Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextFormField(
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                const Text(
                  'Counselor Name',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextFormField(
                  controller: _counselorNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a counselor name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                const Text(
                  'Date',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextFormField(
                  controller: _dateController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a date';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                const Text(
                  'Time',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextFormField(
                  controller: _timeController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a time';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Perform the update operation with the updated data
                      Map<String, dynamic> updatedData = {
                        'name': _nameController.text,
                        'email': _emailController.text,
                        'counselorName': _counselorNameController.text,
                        'date': _dateController.text,
                        'time': _timeController.text,
                      };

                      // Pass the updated data back to the list page
                      Navigator.pop(context, updatedData);
                    }
                  },
                  child: const Text('Update Appointment'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
