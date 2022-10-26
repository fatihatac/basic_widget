class Student {
  late int id;
  late String firstName;
  late String lastName;
  late int grade;
  late String _status;
  late String photoUrl;

  Student.withId(
    int id,
    String firstName,
    String lastName,
    int grade,
    String photoUrl,
  ) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
    this.photoUrl = photoUrl;
    this.id = id;
  }

  Student(
    String firstName,
    String lastName,
    int grade,
    String photoUrl,
  ) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
    this.photoUrl = photoUrl;
  }

  Student.withoutInfo() {}

  String get getfirstName {
    return "OGR -" + this.firstName;
  }

  void set setFirstName(String value) {
    this.firstName = value;
  }

  String get getStatus {
    String message = "";
    if (this.grade >= 50) {
      message = "geçti";
    } else if (this.grade >= 40) {
      message = "büt";
    } else {
      message = "kaldı";
    }
    return message;
  }
}
