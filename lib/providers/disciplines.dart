import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mbtech_frontend/models/discipline_model.dart';

class Disciplines with ChangeNotifier {
  final Map<String, Discipline> _items = {};

  List<Discipline> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Discipline byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(Discipline discipline) {
    if (discipline.id != null && _items.containsKey(discipline.id)) {
      _items.update(discipline.id.toString(), (_) => 
        Discipline(
          id: discipline.id,
          name: discipline.name,
          room: discipline.room,
          teacher: discipline.teacher, 
          studentIDs: discipline.studentIDs
        )
      );
    }
    final id = Random().nextDouble().toString();
    _items.putIfAbsent(id ,() => 
      Discipline(
        id: id,
        name: discipline.name,
        room: discipline.room,
        teacher: discipline.teacher,
        studentIDs: discipline.studentIDs
      )
    );

    notifyListeners();
  }

  void remove(Discipline discipline) {
    if (discipline.id != null) {
      _items.remove(discipline.id);
      notifyListeners();
    }
  }
}
