import 'package:flutter/material.dart';
import 'package:mbtech_frontend/components/discipline.tile.dart';
import 'package:mbtech_frontend/providers/disciplines.dart';
import 'package:mbtech_frontend/routes/app_routes.dart';
import 'package:provider/provider.dart';

class DisciplineList extends StatelessWidget {
  const DisciplineList({super.key});

  @override
  Widget build(BuildContext context) {
    final disciplines = Provider.of<Disciplines>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text("Lista de Disciplinas"),
          backgroundColor: Colors.blue,
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    AppRoutes.DISCIPLINE_FORM
                  );
                },
                icon: const Icon(Icons.add))
          ],
        ),
        body: ListView.builder(
            itemCount: disciplines.count,
            itemBuilder: (ctx, i) => DisciplineTile(disciplines.byIndex(i))
            // ),
            ));
  }
}
