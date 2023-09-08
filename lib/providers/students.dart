import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mbtech_frontend/data/dummy_students.dart';
import 'package:mbtech_frontend/models/student.dart';

class Students with ChangeNotifier {
  final Map<String, Student> _items = {...DUMMY_STUDENTS};

  List<Student> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Student byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(Student student) {
    if (student.id == null) {
      return;
    }
    if (student.id != null && _items.containsKey(student.id)) {
      _items.update(student.id.toString(), (_) => 
        Student(
          name: student.name,
          enrollment: student.enrollment,
          phone: student.phone,
          address: student.address,
          avatarUrl: student.avatarUrl,
          disciplineIDs: student.disciplineIDs
        )
      );
    }
    final id = Random().nextDouble().toString();
    _items.putIfAbsent(id,() => 
      Student(
        name: student.name,
        enrollment: student.enrollment,
        phone: student.phone,
        address: student.address,
        avatarUrl: student.avatarUrl,
        disciplineIDs: student.disciplineIDs
      )
    );

    notifyListeners();
  }

  void remove(Student student) {
    if (student.id != null) {
      _items.remove(student.id);
      notifyListeners();
    }
  }
}
