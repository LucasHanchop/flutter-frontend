import 'package:flutter/material.dart';
import 'package:mbtech_frontend/models/student.dart';
import 'package:mbtech_frontend/routes/app_routes.dart';

class StudentTile extends StatelessWidget {
  final Student student;
  const StudentTile(this.student, {super.key});

  @override
  Widget build(BuildContext context) {
    final avatar = student.avatarUrl == null || student.avatarUrl!.isEmpty
        ? const CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(
            backgroundImage: NetworkImage(student.avatarUrl.toString()));

    return ListTile(
      leading: avatar,
      title: Text(student.name),
      subtitle: Text("Matrícula:${student.enrollment.toString()}"),
      trailing: SizedBox(
        width: 100,
        child: Row(children: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.STUDENT_FORM,
                  arguments: student,
                );
              },
              color: Colors.orange,
              icon: const Icon(Icons.edit)),
          IconButton(
              onPressed: () => {},
              color: Colors.red,
              icon: const Icon(Icons.delete))
        ]),
      ),
    );
  }
}