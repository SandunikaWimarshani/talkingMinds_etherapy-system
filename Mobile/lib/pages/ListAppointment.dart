import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:therapy_application/pages/MessagePage.dart';
import 'package:therapy_application/pages/appointment.dart';
import 'package:therapy_application/pages/list.dart';
import 'package:therapy_application/pages/welcome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListAppointment extends StatefulWidget {
  const ListAppointment({Key? key}) : super(key: key);

  @override
  State<ListAppointment> createState() => _ListAppointmentState();
}

class _ListAppointmentState extends State<ListAppointment> {
  int myIndex = 0;

  final _formKey = GlobalKey<FormState>();

  void navigateToUpdateForm(DocumentSnapshot appointment) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UpdateForm(appointment: appointment),
      ),
    ).then((updatedData) {
      if (updatedData != null) {
        setState(() {
          appointment.reference.update(updatedData);
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
                appointment.reference.delete().then((value) {
                  Navigator.of(context).pop();
                }).catchError((error) {
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
              context,
              MaterialPageRoute(builder: (context) => Appointment()),
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
                )
                              ],
            ),
            const Text(
              "Appointments",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('appointments').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text('No appointments found.'),
            );
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data() as Map<String, dynamic>;
              DateTime appointmentDate = data['date'].toDate();
              String formattedDate = DateFormat.yMMMMd().format(appointmentDate);
              String formattedTime = DateFormat.jm().format(appointmentDate);

              return ListTile(
                title: Text('${data['name']}'),
                subtitle: Text('$formattedDate at $formattedTime'),
                onTap: () {
                  navigateToUpdateForm(document);
                },
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    deleteAppointment(document);
                  },
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

class UpdateForm extends StatefulWidget {
  final DocumentSnapshot appointment;

  const UpdateForm({required this.appointment});

  @override
  _UpdateFormState createState() => _UpdateFormState();
}

class _UpdateFormState extends State<UpdateForm> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  DateTime _date = DateTime.now();
  TimeOfDay _time = TimeOfDay.now();

  @override
  void initState() {
    super.initState();
    Map<String, dynamic> data = widget.appointment.data() as Map<String, dynamic>;
    _name = data['name'];
    _date = data['date'].toDate();
    _time = TimeOfDay.fromDateTime(data['date'].toDate());
  }

  void updateAppointment() {
    if (_formKey.currentState!.validate()) {
      widget.appointment.reference.update({
        'name': _name,
        'date': DateTime(_date.year, _date.month, _date.day, _time.hour, _time.minute),
      }).then((value) {
        Navigator.of(context).pop();
      }).catchError((error) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: Text('Failed to update the appointment: $error'),
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Appointment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                initialValue: _name,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _name = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              ListTile(
                title: const Text('Date'),
                subtitle: Text(DateFormat.yMMMMd().format(_date)),
                trailing: IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () async {
                    final selectedDate = await showDatePicker(
                      context: context,
                      initialDate: _date,
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 365)),
                    );
                    if (selectedDate != null) {
                      setState(() {
                        _date = selectedDate;
                      });
                    }
                  },
                ),
              ),
              const SizedBox(height: 16),
              ListTile(
                title: const Text('Time'),
                subtitle: Text(_time.format(context)),
                trailing: IconButton(
                  icon: const Icon(Icons.access_time),
                  onPressed: () async {
                    final selectedTime = await showTimePicker(
                      context: context,
                      initialTime: _time,
                    );
                    if (selectedTime != null) {
                      setState(() {
                        _time = selectedTime;
                      });
                    }
                  },
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: updateAppointment,
                child: const Text('Update Appointment'),
              ),
            ],
          ),
        ),
      ),
      
    );
  }
}


