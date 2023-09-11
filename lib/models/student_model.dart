class Student {
  final String id;
  final int enrollment;
  final String name;
  final String phone;
  final String address;
  final String? avatarUrl;
  final List<String>? disciplineIDs;

  Student({
    required this.id,
    required this.enrollment,
    required this.name,
    required this.phone,
    required this.address,
    this.avatarUrl,
    this.disciplineIDs
  });

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'],
      enrollment: map['enrollment'],
      name: map['name'],
      phone: map['phone'],
      address: map['address'],
      avatarUrl: map['avatarUrl'],
      disciplineIDs: map['disciplineIDs']
    );
  }
}
