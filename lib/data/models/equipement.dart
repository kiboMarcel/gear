class Equipement {
  int id;
  String name;

  Equipement({
    required this.id,
    required this.name,
  });

  factory Equipement.fromJson(Map<String, dynamic> json) {
    return Equipement(id: json['id'], name: json['name']);
  }
}
