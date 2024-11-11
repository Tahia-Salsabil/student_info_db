import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'database/db_helper.dart';
import 'home_page.dart';
import 'model/note.dart';

class AddNotes extends StatefulWidget {
  const AddNotes({super.key});

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {

  late DatabaseHelper dbHelper;

  var student_nameController=TextEditingController();
  var student_idController=TextEditingController();
  var phoneController=TextEditingController();
  var emailController=TextEditingController();
  var locationController=TextEditingController();

  final GlobalKey<FormState> noteFormKey = GlobalKey();

  //add notes to database
  Future addNotes() async
  {
    final newNote = Note(
      student_name: student_nameController.text,
      student_id: student_idController.text,
      phone: phoneController.text,
      email: emailController.text,
      location: locationController.text,
    );

    //if data insert successfully, its return row number which is greater that 1 always
    int check= await dbHelper.insertData(newNote.toMap());
    print("Check=$check");
    if(check>0)
    {


      Get.snackbar("Success", "Student Info Added",snackPosition: SnackPosition.BOTTOM);
      Get.offAll(HomePage());
    }
    else
    {
      Get.snackbar("Error", "Error in adding student info",snackPosition: SnackPosition.BOTTOM);
    }


  }


  @override
  void initState() {
    super.initState();
    dbHelper = DatabaseHelper.instance;

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.white
        ),
        backgroundColor: Colors.indigoAccent,
        title: Center(
          child: Text("Add Student Information",style: TextStyle(
            fontSize: 25,fontWeight: FontWeight.bold,
              color: Colors.white
          ),),
        ),


      ),
      body: Form(
        key: noteFormKey,
        child:SingleChildScrollView(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [

              TextFormField(
                controller: student_nameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Student Name",
                  hintText: "Your Name",
                  prefixIcon: const Icon(Icons.person_add,),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),

                  ),
                ),

                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Your Name";
                  }

                  return null;
                },
              ),

              SizedBox(height: 10,),
              TextFormField(
                controller: student_idController,
                maxLines: 3,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Student Id",
                  hintText: "Your Id",
                  prefixIcon: const Icon(Icons.person,),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),

                  ),
                ),

                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Your Id";
                  }

                  return null;
                },
              ),

              SizedBox(height: 10,),
              TextFormField(
                controller: phoneController,
                maxLines: 3,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Phone",
                  hintText: "Your Phone No",
                  prefixIcon: const Icon(Icons.phone_android_sharp,),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),

                  ),
                ),

                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Your Phone No";
                  }

                  return null;
                },
              ),

              SizedBox(height: 10,),
              TextFormField(
                controller: emailController,
                maxLines: 3,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Your Email",
                  prefixIcon: const Icon(Icons.email_outlined,),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),

                  ),
                ),

                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Your Email";
                  }

                  return null;
                },
              ),

              SizedBox(height: 10,),
              TextFormField(
                controller: locationController,
                maxLines: 3,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Location",
                  hintText: "Your Location",
                  prefixIcon: const Icon(Icons.location_city, ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),

                  ),
                ),

                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Your Location";
                  }

                  return null;
                },
              ),

              SizedBox(height: 50,),

              ElevatedButton(
                style: ElevatedButton.styleFrom(

                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: Colors.indigo,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),

                onPressed: () async {
                  if(noteFormKey.currentState!.validate())
                  {
                    noteFormKey.currentState!.save();



                    addNotes();



                  }

                },
                child:  Center(
                  child: Text("Save",
                    style: const TextStyle(color: Colors.white,
                        fontSize: 20,fontWeight: FontWeight.bold),

                  ),
                ),
              ),

            ],
          ),

        ) ,
      ),
    );
  }
}
