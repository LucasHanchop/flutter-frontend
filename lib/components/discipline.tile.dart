import 'package:flutter/material.dart';
import 'package:mbtech_frontend/models/discipline.dart';
import 'package:mbtech_frontend/providers/disciplines.dart';
import 'package:mbtech_frontend/routes/app_routes.dart';
import 'package:provider/provider.dart';

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
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text("Excluir Aluno?"),
                    content: const Text("Tem certeza?"),
                    actions: <Widget>[
                      TextButton(
                        child: const Text("Não"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      TextButton(
                        child: const Text("Sim"),
                        onPressed: () {
                          Provider.of<Disciplines>(context, listen: false).remove(discipline);
                          Navigator.pop(context);
                        },
                      )
                        ],
                  )
                );
              },
              color: Colors.red,
              icon: const Icon(Icons.delete))
        ]),
      ),
    );
  }
}
