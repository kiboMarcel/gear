// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Cause extends Equatable {
  final String id;
  final String name;
  final String solution;
  final String symptomeName;

  Cause(
      {required this.id,
      required this.name,
      this.solution = '',
      this.symptomeName = ''});

  factory Cause.format(element) {
    late String id;
    late String name;
    late String solution;
    late String symptomeName;
    try {
      id = element['id'];
      name = element['data']['name'];
      solution = element['data']['function_id'];
      symptomeName = element['data']['equipment_id'];
    } catch (e) {
      print(e);
    }

    return Cause(
      id: id,
      name: name,
      solution: solution,
      symptomeName: symptomeName,
    );
  }

  @override
  List<Object> get props => [id, name, solution, symptomeName];

  Cause copyWith({
    String? id,
    String? name,
    String? solution,
    String? symptomeName,
  }) {
    return Cause(
      id: id ?? this.id,
      name: name ?? this.name,
      solution: solution ?? this.solution,
      symptomeName: symptomeName ?? this.symptomeName,
    );
  }
}
