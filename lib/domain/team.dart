class Team {
  late int code;
  late String name;

  Team({required this.code, required this.name});

  Team.fromMap(Map<dynamic, dynamic> source) {
    code = source["code"] ?? "";
    name = source["name"] ?? "";
  }
}
