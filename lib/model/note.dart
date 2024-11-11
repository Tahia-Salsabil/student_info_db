//model class
class Note {
  int? id;
  String? student_name;
  String? student_id;
  String? phone;
  String? email;
  String? location;

  //constructor
  Note({
    this.id,
    this.student_name,
    this.student_id,
    this.phone,
    this.email,
    this.location,
  });


  //for saving data to db
  //name must be same as table name in db
  Map<String, dynamic> toMap() {
    return {
      'student_name': student_name,
      'student_id': student_id,
      'phone': phone,
      'email': email,
      'location': location,
    };
  }

  //for retrieving data from db
  static Note fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      student_name: map['student_name'],
      student_id: map['student_id'],
      phone: map['phone'],
      email: map['email'],
      location: map['location'],
    );
  }
}