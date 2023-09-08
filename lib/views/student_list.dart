import 'package:flutter/material.dart';
import 'package:mbtech_frontend/components/student.tile.dart';
import 'package:mbtech_frontend/providers/students.dart';
import 'package:mbtech_frontend/routes/app_routes.dart';
import 'package:provider/provider.dart';

class StudentList extends StatelessWidget {
  const StudentList({super.key});

  @override
  Widget build(BuildContext context) {
    final students = Provider.of<Students>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Alunos"),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.STUDENT_FORM
                );
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
          itemCount: students.count,
          itemBuilder: (ctx, i) => StudentTile(students.byIndex(i))),
    );
  }
}
