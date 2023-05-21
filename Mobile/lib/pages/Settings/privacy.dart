import 'package:flutter/material.dart';
import 'package:therapy_application/pages/Settings/profile.dart';

class Privacy extends StatefulWidget {
  const Privacy({Key? key}) : super(key: key);

  @override
  _PrivacyState createState() => _PrivacyState();
}

class _PrivacyState extends State<Privacy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
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
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Privacy Policy',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
              'Suspendisse efficitur arcu in elit laoreet, sed faucibus justo euismod. '
              'Nunc aliquet, elit sit amet cursus tempor, turpis nunc pulvinar odio, '
              'eu fringilla velit urna sed metus. Ut vitae augue justo. Mauris iaculis '
              'ex nec orci lacinia, eget aliquam lorem molestie. Curabitur interdum, '
              'dui eget varius consectetur, lectus lacus auctor erat, ut lobortis augue '
              'lorem et arcu. In hac habitasse platea dictumst.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              'Terms of Service',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
              'Suspendisse efficitur arcu in elit laoreet, sed faucibus justo euismod. '
              'Nunc aliquet, elit sit amet cursus tempor, turpis nunc pulvinar odio, '
              'eu fringilla velit urna sed metus. Ut vitae augue justo. Mauris iaculis '
              'ex nec orci lacinia, eget aliquam lorem molestie. Curabitur interdum, '
              'dui eget varius consectetur, lectus lacus auctor erat, ut lobortis augue '
              'lorem et arcu. In hac habitasse platea dictumst.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
