import 'package:flutter/material.dart';
import 'package:stu_info_db/add_notes.dart';
import 'package:stu_info_db/home_page.dart';
class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Center(
          child: Text("Student Info Page",style: TextStyle(
            fontSize: 35,fontWeight: FontWeight.bold,color: Colors.white
          ),),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(30.100),
              child: ElevatedButton(
                  onPressed:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>AddNotes()));
                  },
                  child: Center(
                    child: Text("Add Student",style: TextStyle(
                        fontSize: 30,fontWeight: FontWeight.bold,
                        color: Colors.indigoAccent
                    ),),
                  )),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(30.100),
              child: ElevatedButton(
                  onPressed:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                  },
                  child: Center(
                    child: Text("View All Student",style: TextStyle(
                        fontSize: 30,fontWeight: FontWeight.bold,
                        color: Colors.indigoAccent
                    ),),
                  )),
            ),
          ),
        ]
      ),
    );
  }
}
