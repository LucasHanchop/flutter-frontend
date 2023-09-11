import 'package:mbtech_frontend/data/http/http_client.dart';
import 'package:mbtech_frontend/models/student_model.dart';

abstract class IStudentRepository {
  Future<List<Student>> getStudents();
}

class StudentRepository implements IStudentRepository {
  final IHttpClient client;

  @override
  Future<List<Student>> getStudents() async {
   final response = await client.get(url: "http://localhost:3000/");

  }
}
