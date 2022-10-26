import 'package:flutter/material.dart';
import 'package:temel_widget/models/student.dart';
import 'package:temel_widget/validation/student_validator.dart';

class StudentAdd extends StatefulWidget {
  List<Student>? students;
  StudentAdd(List<Student> students) {
    this.students = students;
  }
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState(students);
  }
}

class _StudentAddState extends State with StudentValidationMixin {
  var student = Student.withoutInfo();
  var formKey = GlobalKey<FormState>();
  List<Student>? students;

  _StudentAddState(List<Student>? students) {
    this.students = students;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni öğrenci ekle"),
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              buildFirstNameField(),
              buildLastNameField(),
              buildGradeField(),
              buildPhotoField(),
              buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFirstNameField() => TextFormField(
        decoration:
            InputDecoration(labelText: "Öğrenci Adı", hintText: "Fatih"),
        validator: validateFirstName,
        onSaved: (String? value) {
          student.firstName = value!;
        },
      );
  Widget buildLastNameField() => TextFormField(
        decoration:
            InputDecoration(labelText: "Öğrenci Soyadı", hintText: "Ataç"),
        validator: validateLastName,
        onSaved: (String? value) {
          student.lastName = value!;
        },
      );
  Widget buildGradeField() => TextFormField(
        decoration: InputDecoration(labelText: "Aldığı not", hintText: "65"),
        validator: validateFirstName,
        onSaved: (String? value) {
          student.grade = int.parse(value!);
        },
      );
  Widget buildPhotoField() => TextFormField(
        decoration: InputDecoration(
            labelText: "Fotoğraf linki",
            hintText:
                "https://pps.whatsapp.net/v/t61.24694-24/300718934_807251103933509_768765226904573645_n.jpg?ccb=11-4&oh=01_AdRq5oueXR1JjRbdhi10W0sLcNR9lLB8O6-As_Ys0IS4Ig&oe=636445B8"),
        validator: validateFirstName,
        onSaved: (String? value) {
          student.photoUrl = value!;
        },
      );

  Widget buildSubmitButton() {
    return ElevatedButton(
      child: Text("Kaydet"),
      onPressed: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          students?.add(student);
          saveStudent();
          Navigator.pop(context,student);
        }
      },
    );
  }

  void saveStudent() {
    print(student.firstName);
    print(student.lastName);
    print(student.grade);
    print(student.photoUrl);
  }
}
