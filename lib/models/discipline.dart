class Discipline {
  final String? id;
  final String name;
  final String teacher;
  final String room;
  final List<String>? studentIDs;

  Discipline({
    this.id,
    required this.name,
    required this.teacher,
    required this.room,
    this.studentIDs,
  });
}
