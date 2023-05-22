import 'package:flutter/material.dart';
import 'package:therapy_application/pages/MessagePage.dart';
import 'package:therapy_application/pages/Settings/profile.dart';
import 'package:therapy_application/pages/appointment.dart';
import 'package:therapy_application/pages/list.dart';
import 'package:therapy_application/pages/schedule.dart';
import 'package:therapy_application/pages/welcome.dart';

class profileFour extends StatefulWidget {
  const profileFour({Key? key}) : super(key: key);

  @override
  _profileFourState createState() => _profileFourState();
}

class _profileFourState extends State<profileFour> {
  int myIndex = 0;

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
              MaterialPageRoute(builder: (context) => const Lists()),
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
                SizedBox(width: 10),
                Text(
                  'talkingMinds',
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
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/Images/pro4.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                  ),
                  
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children:  [
                  const Text("Mr. Harry Jake",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 83, 58, 80)
                  ),
                  
                  ),
                  const SizedBox(height: 5,),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 227, 232, 213),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black
                        ),
                        children: [
                          TextSpan(
                            text:'Specialties : \n', style: TextStyle(fontWeight: FontWeight.bold)
                          ),
                          TextSpan(text: 'Relationship issues, Anger management, Career \ndifficulties, Isolation/Loneliness, Panic Disorder and Panic Attacks'),
                        ],
                      ),
                    ),
                  ),
                  
                  

                

                  const SizedBox(height: 15,),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 240, 222, 192),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'I have three years of professional work experience.',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 10,),
                              Text(
                                'I have expertise working with clients who are dealing with depression, self-esteem issues, sorrow and loss, stress and anxiety, and motivation. I collaborate with my clients to provide a setting that is open and safe so that ideas and emotions can be expressed without worrying about being judged. I am pleased of you for starting therapy—it might be brave to make the decision to do so.'
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 15,),
                  const Text(
                    "License number : OR LCSW L9824",
                    style: TextStyle(
                      color: Color.fromARGB(255, 78, 52, 80),
                      fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.justify,

                    ),
                    
                    
              
                

                  const SizedBox(height: 30),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 78, 95, 101),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(200))),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Schedule()),
                        );
                      },
                      child: const Text('Book Appointment'),
                    ),
                  ),
                  const SizedBox(height: 30),
// Available Dates and Slots
                  const SizedBox(height: 15),
                  const Text(
                    'Available Time slots',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: 9,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'Date ${index + 1}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
     
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
          onTap: (index) {
            if(index == 0){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Welcome()));
            } 
            if(index ==1){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Lists()));
            }
            if(index ==2){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Appointment()));
            }
            if(index ==3){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Profile()));
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
            label: 'List'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule_outlined),
            label: 'Schedule'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings'
          )
        ]),
    
      
      
      
    );

    
    
  }
}