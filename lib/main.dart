import 'package:flutter/material.dart';
import 'package:mbtech_frontend/providers/students.dart';
import 'package:mbtech_frontend/routes/app_routes.dart';
import 'package:mbtech_frontend/views/discipline_form.dart';
import 'package:mbtech_frontend/views/discipline_list.dart';
import 'package:mbtech_frontend/views/student_form.dart';
import 'package:mbtech_frontend/views/student_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Students()
        )
      ],
      child: MaterialApp(
        title: 'MBTECH-FLUTTER',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: {
          AppRoutes.STUDENT : (ctx) => const StudentList(), 
          AppRoutes.STUDENT_FORM : (ctx) => StudentForm(), 
          AppRoutes.DISCIPLINE: (ctx) => const DisciplineList(),
          AppRoutes.DISCIPLINE_FORM: (ctx) => DisciplineForm()
          ,
        },
      ),
    );
  }
}
