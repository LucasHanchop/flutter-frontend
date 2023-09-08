import 'package:flutter/material.dart';
import 'package:mbtech_frontend/models/discipline.dart';
import 'package:mbtech_frontend/routes/app_routes.dart';

class DisciplineTile extends StatelessWidget {
  final Discipline discipline;

  const DisciplineTile(this.discipline, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(discipline.name),
      subtitle: Text("Sala:${discipline.room}"),
      trailing: SizedBox(
        width: 100,
        child: Row(children: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                    AppRoutes.DISCIPLINE_FORM,
                    arguments: discipline
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
