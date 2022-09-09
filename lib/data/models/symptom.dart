// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Symptom extends Equatable {
  final String id;
  final String name;
  final String fonctionnementName;
  final String equipementName;

  Symptom(
      {required this.id,
      required this.name,
      this.equipementName = '',
      this.fonctionnementName = ''});

  factory Symptom.format(element) {
    late String id;
    late String name;
    late String fonctionnementName;
    late String equipementName;
    try {
      id = element['id'];
      name = element['data']['name'];
      fonctionnementName = element['data']['function_id'];
      equipementName = element['data']['equipment_id'];
    } catch (e) {
      print(e);
    }

    return Symptom(
      id: id,
      name: name,
      fonctionnementName: fonctionnementName,
      equipementName: equipementName,
    );
  }

  @override
  List<Object> get props => [id, name, fonctionnementName, equipementName];

  @override
  bool get stringify => true;

  Symptom copyWith({
    String? id,
    String? name,
    String? fonctionnementName,
    String? equipementName,
  }) {
    return Symptom(
      id: id ?? this.id,
      name: name ?? this.name,
      fonctionnementName: fonctionnementName ?? this.fonctionnementName,
      equipementName: equipementName ?? this.equipementName,
    );
  }
}
