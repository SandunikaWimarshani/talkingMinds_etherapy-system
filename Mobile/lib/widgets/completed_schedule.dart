import 'package:flutter/material.dart';
class CompletedSchedule extends StatefulWidget {
  const CompletedSchedule({super.key});

  @override
  State<CompletedSchedule> createState() => _CompletedScheduleState();
}

class _CompletedScheduleState extends State<CompletedSchedule> {
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
                    title: Text("Mr. Henry Wilson",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    
                    ),
                    subtitle:  Text("Family Counselor"),
                    trailing: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('assets/pro1.jpg'),
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
                        "14/05/2023",
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
                  const SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 150,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration:  BoxDecoration(
                            color: const Color.fromARGB(255, 243, 230, 230),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: const Center(
                            child: Text("Cancel",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500
                            ),
                            
                            ),
                          ),
                        ),
                          
                        
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 150,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration:  BoxDecoration(
                            color: const Color.fromARGB(255, 243, 230, 230),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: const Center(
                            child: Text("Reschedule",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500
                            ),
                            
                            ),
                          ),
                        ),
                          
                        
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