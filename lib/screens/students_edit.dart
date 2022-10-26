import 'package:flutter/material.dart';
import 'package:temel_widget/models/student.dart';
import 'package:temel_widget/validation/student_validator.dart';

class StudentEdit extends StatefulWidget {
  late Student selectedStudent;
  StudentEdit(Student selectedStudent) {
    this.selectedStudent = selectedStudent;
  }
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState(selectedStudent);
  }
}

class _StudentAddState extends State with StudentValidationMixin {
  var formKey = GlobalKey<FormState>();
 late Student selectedStudent;

  _StudentAddState(Student selectedStudent) {
    this.selectedStudent = selectedStudent;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bilgileri güncelle"),
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
    initialValue: selectedStudent.firstName,
    decoration:
    InputDecoration(labelText: "Öğrenci Adı", hintText: "Fatih"),
    validator: validateFirstName,
    onSaved: (String? value) {
      selectedStudent.firstName = value!;
    },
  );
  Widget buildLastNameField() => TextFormField(
    initialValue: selectedStudent.lastName,
    decoration:
    InputDecoration(labelText: "Öğrenci Soyadı", hintText: "Ataç"),
    validator: validateLastName,
    onSaved: (String? value) {
      selectedStudent.lastName = value!;
    },
  );
  Widget buildGradeField() => TextFormField(
    initialValue: selectedStudent.grade.toString(),
    decoration: InputDecoration(labelText: "Aldığı not", hintText: "65"),
    validator: validateFirstName,
    onSaved: (String? value) {
      selectedStudent.grade = int.parse(value!);
    },
  );
  Widget buildPhotoField() => TextFormField(
    initialValue: selectedStudent.photoUrl,
    decoration: InputDecoration(
        labelText: "Fotoğraf linki",
        hintText:
        "https://pps.whatsapp.net/v/t61.24694-24/300718934_807251103933509_768765226904573645_n.jpg?ccb=11-4&oh=01_AdRq5oueXR1JjRbdhi10W0sLcNR9lLB8O6-As_Ys0IS4Ig&oe=636445B8"),
    validator: validateFirstName,
    onSaved: (String? value) {
      selectedStudent.photoUrl = value!;
    },
  );

  Widget buildSubmitButton() {
    return ElevatedButton(
      child: Text("Kaydet"),
      onPressed: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          saveStudent();
          Navigator.pop(context);
        }
      },
    );
  }

  void saveStudent() {
    print(selectedStudent.firstName);
    print(selectedStudent.lastName);
    print(selectedStudent.grade);
    print(selectedStudent.photoUrl);
  }
}
