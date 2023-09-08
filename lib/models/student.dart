class Student {
  final String? id;
  final int enrollment;
  final String name;
  final String phone;
  final String address;
  final String? avatarUrl;
  final List<String>? disciplineIDs;

  Student({
      this.id,
      required this.enrollment,
      required this.name,
      required this.phone,
      required this.address,
      this.avatarUrl,
      this.disciplineIDs
    });
}
