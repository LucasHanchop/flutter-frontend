import 'package:flutter/material.dart';
import 'package:mbtech_frontend/models/student.dart';
import 'package:mbtech_frontend/providers/students.dart';
import 'package:provider/provider.dart';

class StudentForm extends StatefulWidget {
  StudentForm({super.key});

  @override
  State<StudentForm> createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {
  final _form = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  void _loadFormData(Student student) {
    _formData['id'] = student.id!;
    _formData['name'] = student.name;
    _formData['phone'] = student.phone;
    _formData['enrollment'] = student.enrollment.toString();
    _formData['address'] = student.address;
    _formData['avatarUrl'] = student.avatarUrl!;
    
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final student = ModalRoute.of(context)?.settings.arguments as Student;
    _loadFormData(student);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastrar Aluno"),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(
              onPressed: () {
                _form.currentState?.save();
                Provider.of<Students>(context, listen: false).put(Student(
                  id: _formData['id'],
                  name: _formData['name']!,
                  address: _formData['address']!,
                  phone: _formData['phone']!,
                  enrollment: int.parse(_formData['enrollment']!),
                  avatarUrl: _formData['avatarUrl']!,
                ));
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.save))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
            key: _form,
            child: Column(
              children: <Widget>[
                TextFormField(
                  initialValue: _formData['name'],
                  decoration: const InputDecoration(labelText: "Nome"),
                  onSaved: (value) => _formData['name'] = value!,
                ),
                TextFormField(
                  initialValue: _formData['enrollment'],
                  decoration: const InputDecoration(labelText: "Matrícula"),
                  onSaved: (value) => _formData['enrollment'] = value!,
                ),
                TextFormField(
                  initialValue: _formData['phone'],
                  decoration: const InputDecoration(labelText: "Telefone"),
                  onSaved: (value) => _formData['phone'] = value!,
                ),
                TextFormField(
                  initialValue: _formData['address'],
                  decoration: const InputDecoration(labelText: "Endereço"),
                  onSaved: (value) => _formData['address'] = value!,
                ),
                TextFormField(
                  initialValue: _formData['avatarUrl'],
                  decoration: const InputDecoration(labelText: "URL do Avatar"),
                  onSaved: (value) => _formData['avatarUrl'] = value!,
                ),
              ],
            )),
      ),
    );
  }
}
