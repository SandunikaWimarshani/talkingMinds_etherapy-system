import 'package:flutter/material.dart';
import 'package:therapy_application/main.dart';
import 'package:therapy_application/pages/Settings/privacy.dart';
import 'package:therapy_application/pages/Settings/profile.dart';

class Signout extends StatefulWidget {
  const Signout({Key? key}) : super(key: key);

  @override
  _SignoutState createState() => _SignoutState();
}

class _SignoutState extends State<Signout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // ignore: deprecated_member_use
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Profile()),
            );
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
      body: Container(
      
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Thank you for participating! We appreciate your time and contribution.',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(
              'Are you sure you want to sign out?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey
              ),
              
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                   Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                   );
                  },
                  child: Text(
                    'Sign Out',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 108, 54, 108),
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Profile()),
                );
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                    side: BorderSide(color: Colors.black),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
