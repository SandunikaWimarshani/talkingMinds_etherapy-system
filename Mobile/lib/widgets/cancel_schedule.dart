import 'package:flutter/material.dart';
class CancelSchedule extends StatefulWidget {
  const CancelSchedule({super.key});

  @override
  State<CancelSchedule> createState() => _CancelScheduleState();
}

class _CancelScheduleState extends State<CancelSchedule> {
  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("About Counselor",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          
          ),
          const SizedBox(height: 15,),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  spreadRadius: 2,
                ),
              ]
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children:   [
                  const ListTile(
                    title: Text("Mr. Harry Jake",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    
                    ),
                    subtitle:  Text("Family Counselor"),
                    trailing: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('assets/pro4.jpg'),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Divider(
                      thickness: 1,
                      height: 20,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children:  [
                      Row(
                        children: const [
                          Icon(
                        Icons.calendar_month,
                        color: Colors.black,
                      ),
                      SizedBox(width: 5,),
                      Text(
                        "12/05/2023",
                        style: TextStyle(
                          color: Colors.black
                        ),
                      )
                          
                        ],
                      ),
                      Row(
                    children: const [
                      Icon(
                        Icons.access_time_filled,
                        color: Colors.black,
                      ),
                      SizedBox(width: 5,),
                      Text(
                        "10.30 AM",
                        style: TextStyle(
                          color: Colors.black
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle
                        ),
                      )
                    ],
                  )
                      
                    ],
                  ),
                  
                  const SizedBox(height: 10,),
                  
                ],
              ),
            ),
          ),
          const SizedBox(height: 20,)
          
        ],
      ),
    );
  }
}