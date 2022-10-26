import 'package:flutter/material.dart';
import 'package:temel_widget/models/student.dart';
import 'package:temel_widget/screens/student_add.dart';
import 'package:temel_widget/screens/students_edit.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String mesaj = "Öğrenci Takip Sistemi ";

  Student selectedStudent = Student.withId(0, "", "", 0, "");

  List<Student> students = [
    Student.withId(1, "Fatih", "ATAÇ", 101,
        "https://media-exp1.licdn.com/dms/image/D4D03AQGeldLbZ2EHQw/profile-displayphoto-shrink_800_800/0/1664989955111?e=1671667200&v=beta&t=CeSoxIZ_ghlhp5OhXt0xonHPeLwxsPyk3ssqGttpP-w"),
    Student.withId(2, "Alaaddin Uğur", "Çatal", 48,
        "https://pps.whatsapp.net/v/t61.24694-24/85536866_114424343534285_1887764316242840702_n.jpg?ccb=11-4&oh=01_AdSyN_sCy4CjSUuQl7ti-nk0sEcm_YNQ0Q7aiNi4DZp2AQ&oe=63613533"),
    Student.withId(3, "Kadir", "Emir", 31,
        "https://pps.whatsapp.net/v/t61.24694-24/154180417_949192799091101_6033928557580499644_n.jpg?ccb=11-4&oh=01_AdQ_NMiZN-A-M2QxoIlZP_FkaaIxDywBMwQzcN7y0ACvcQ&oe=636125E2"),
    Student.withId(4, "Berkay", "Karagöz", 100,
        "https://pps.whatsapp.net/v/t61.24694-24/300553481_5133725643420821_752573388124921191_n.jpg?ccb=11-4&oh=01_AdRiTx8PwG2JS0mEUZpChz_PFxoOuOdhTSyeqykDWkYzbA&oe=636120DC")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(mesaj),
        ),
        body: buildBody(context));
  }

  void mesajGoster(BuildContext context, String mesaj) {
    var alert = AlertDialog(
      title: Text("Sonuç"),
      content: Text(mesaj),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(students[index].photoUrl),
                    ),
                    title: Text(students[index].firstName +
                        " " +
                        students[index].lastName),
                    subtitle: Text("Sınavdan aldığı not : " +
                        students[index].grade.toString() +
                        "(" +
                        students[index].getStatus +
                        ")"),
                    trailing: buildStatusIcon(students[index].grade),
                    onTap: () {
                      setState(() {
                        selectedStudent = students[index];
                      });
                      print(selectedStudent);
                    },
                  );
                })),
        Text("Seçili öğrenci : " + selectedStudent.firstName),
        Row(
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.greenAccent),
                  foregroundColor: MaterialStateProperty.all(Colors.black),
                ),
                onPressed: ()  {
                     Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StudentAdd(students))).then((value) => setState((){}));
                },

                child: Row(
                  children: [
                    Icon(Icons.add),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text("Yeni Öğrenci"),
                  ],
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black12),
                  foregroundColor: MaterialStateProperty.all(Colors.black),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StudentEdit(selectedStudent))).then((value) => setState((){}));
                },
                child: Row(
                  children: [
                    Icon(Icons.update),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text("Güncelle"),
                  ],
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: ElevatedButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.black),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.amberAccent),
                ),
                onPressed: () {
                  setState(() {
                    students.remove(selectedStudent);
                  });
                  var mesaj = "Silindi : " + selectedStudent.firstName;
                  mesajGoster(context, mesaj);
                },
                child: Row(
                  children: [
                    Icon(Icons.delete),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text("Sil"),
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget buildStatusIcon(int grade) {
    if (grade >= 50) {
      return Icon(Icons.done);
    } else if (grade >= 40) {
      return Icon(Icons.album);
    } else {
      return Icon(Icons.clear);
    }
  }
}
