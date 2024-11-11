import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'database/db_helper.dart';
import 'home_page.dart';
import 'model/note.dart';
class UpdateNotes extends StatefulWidget {

  final notes;
  const UpdateNotes({super.key,required this.notes});

  @override
  State<UpdateNotes> createState() => _UpdateNotesState();
}

class _UpdateNotesState extends State<UpdateNotes> {

  late DatabaseHelper dbHelper;

  var student_nameController=TextEditingController();
  var student_idController=TextEditingController();
  var phoneController=TextEditingController();
  var emailController=TextEditingController();
  var locationController=TextEditingController();

  final GlobalKey<FormState> noteFormKey = GlobalKey();

  int? id;



  //add notes to database
  Future  updateNotes(int id) async
  {
    final updatedNote = Note(
      student_name: student_nameController.text,
      student_id: student_idController.text,
      phone: phoneController.text,
      email: emailController.text,
      location: locationController.text,
    );

    int check= await dbHelper.updateData(updatedNote.toMap(),id);
    print("Check=$check");
    if(check>0)
    {

      Get.snackbar("Updated", "Student Info Updated",snackPosition: SnackPosition.BOTTOM);
      Get.offAll(HomePage());

    }
    else
    {
      Get.snackbar("Error", "Error in Student Info update",snackPosition: SnackPosition.BOTTOM);
    }


  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbHelper = DatabaseHelper.instance;
    student_nameController.text=widget.notes.student_name;
    student_idController.text=widget.notes.student_id;
    phoneController.text=widget.notes.phone;
    emailController.text=widget.notes.email;
    locationController.text=widget.notes.location;
    id=widget.notes.id;


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.green
        ),
        backgroundColor: Colors.green.shade100,
        title: Text("Update Student Info",style: TextStyle(
            color: Colors.green
        ),),


      ),
      body: Form(
        key: noteFormKey,
        child:SingleChildScrollView(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [

              SizedBox(height: 10,),
              TextFormField(
                controller: student_nameController,
                maxLines: 3,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Student Name",
                  hintText: "Your Name",
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
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Phone",
                  hintText: "Your Phone No",
                  prefixIcon: const Icon(Icons.phone,),
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
                  hintText: "Your email",
                  prefixIcon: const Icon(Icons.email,),
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
                  prefixIcon: const Icon(Icons.location_on,),
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
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),

                onPressed: () async {
                  if(noteFormKey.currentState!.validate())
                  {
                    noteFormKey.currentState!.save();



                    updateNotes(id!);



                  }

                },
                child:  Text(
                  "Update",
                  style: const TextStyle(color: Colors.white,
                      fontWeight: FontWeight.bold),

                ),
              ),

            ],
          ),

        ) ,
      ),
    );
  }
}
