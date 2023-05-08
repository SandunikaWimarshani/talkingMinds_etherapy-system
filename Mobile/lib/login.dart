// ignore_for_file: prefer_const_constructors, avoid_print, use_build_context_synchronously


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:therapy_application/main.dart';
import 'package:therapy_application/pages/welcome.dart';
import 'package:therapy_application/signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

final FirebaseAuth _auth = FirebaseAuth.instance;

final emailController = TextEditingController();
final passwordController = TextEditingController();

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        // ignore: deprecated_member_use
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>  const MyHomePage(title: 'talkingMinds',)));
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
        
      
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: const [
                      Text("Login",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 78, 39, 52)
                        
                      ),
                      
                      ), 
                       SizedBox(height: 10,),
                        Text("Login to your account",
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 75, 73, 73),
                        ),
                        
                        )
                    ],
                  ),
                   Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Enter Email"),
                        prefixIcon: Icon(Icons.person_outline),
                        
                      ),
                    )
                  ),

                   Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: TextField(
                      obscureText: true,
                      controller: passwordController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('Enter Password'),
                        prefixIcon: Icon(Icons.lock_outline),
                       
                        
                      ),
                    ),
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Container(
                      padding: const EdgeInsets.only(top: 1, left: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: const Border(
                          bottom: BorderSide(color: Colors.black),
                          top: BorderSide(color: Colors.black),
                          left: BorderSide(color: Colors.black),
                          right: BorderSide(color: Colors.black),
                          
                        )

                      ),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        height: 50,
                        onPressed: ()  {
                          _login(context);
                        },
                        color:const Color.fromARGB(255, 177, 116, 148),
                        elevation: 0,
                        
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(130),
                        ),
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),

                      ),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      Text("Don't have an account?"),
                      GestureDetector(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Signup())),
                        child: Text(" Sign up",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                        
                        ),
                      )
                     
                    ],
                  ),
                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}

Widget inputFile({label, obscureText = false})
{
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.black87
        ),
      ),
      const SizedBox(
        height: 5,
      ),
      TextField(
        obscureText: obscureText,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey)
          )
        ),
      ),
    ],
  );
}


//------------------------------------------------------


void _login(BuildContext context) async{
  if(emailController.text.isNotEmpty || passwordController.text.isNotEmpty){
    await _auth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
    Navigator.push(context, MaterialPageRoute(builder: (context) => const Welcome()));
  }
  else{
    print('please enter all input fields');
  }
}