class Discipline {
  final String id;
  final String name;
  final String teacher;
  final String room;
  final List<String>? studentIDs;

  Discipline({
    required this.id,
    required this.name,
    required this.teacher,
    required this.room,
    this.studentIDs,
  });

  factory Discipline.fromMap(Map<String, dynamic> map) {
    return Discipline(
      id: map['id'],
      name: map['name'],
      room: map['room'],
      teacher: map['teacher'],
      studentIDs: map['studentIDs'],
    );
  }
}
