import 'package:flutter/material.dart';
import 'package:mbtech_frontend/models/discipline_model.dart';
import 'package:mbtech_frontend/providers/disciplines.dart';
import 'package:provider/provider.dart';

class DisciplineForm extends StatefulWidget {
  DisciplineForm({super.key});

  @override
  State<DisciplineForm> createState() => _DisciplineFormState();
}

class _DisciplineFormState extends State<DisciplineForm> {
  final _form = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Cadastrar Disciplina"),
          backgroundColor: Colors.blue,
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  _form.currentState?.save();
                  Provider.of<Disciplines>(context, listen: false).put(
                    Discipline(
                      id: _formData['id']!,
                      name: _formData['name']!,
                      teacher: _formData['teacher']!,
                      room: _formData['room']!,
                    )
                  );
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.save))
          ]),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
            key: _form,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(labelText: "Nome"),
                  onSaved: (value) => _formData['name'] = value!,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Professor"),
                  onSaved: (value) => _formData['teacher'] = value!,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Sala"),
                  onSaved: (value) => _formData['room'] = value!,
                ),
              ],
            )),
      ),
    );
  }
}
