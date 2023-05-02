import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:therapy_application/login.dart';
import 'package:therapy_application/signup.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
 
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Therapy App',
      
      home: MyHomePage(title: 'TalkingMinds'),
      
    );

    
  }
}


class MyHomePage extends StatelessWidget {
const MyHomePage({Key? key, required this.title}) : super(key: key);

final String title;

@override
Widget build(BuildContext context) {
	return Scaffold(
    body: SafeArea(
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: const [
                Text("talkingMinds",
                selectionColor: Color.fromARGB(255, 67, 36, 36),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  fontStyle: FontStyle.italic
                  
               
                ),
                
                ),
                SizedBox(
                  height: 20,
                ),
                Text("You are Not Alone!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 6, 117, 106),
                  fontSize: 15,
                ),
                
                )
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height/2,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/cover.png'),
                )

              ),
            ),

            Column(
              children: [
                MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
                  },

                  color: const Color.fromARGB(186, 140, 92, 126),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)
                  ),
                  
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white
                    ),
                  ),
                )
              ],
              
            ),
            const SizedBox(
              height: 5,
            ),
            MaterialButton(
              minWidth: double.infinity,
              height: 60,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Signup()));
              },
              color: const Color.fromARGB(255, 196, 155, 198),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50)
              ),
              child: const Text(
                "Sign up",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18
                ),
              ),
            )
          ],
        ),
      ),
    ),
	
	);
}
}
