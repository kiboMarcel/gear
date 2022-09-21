// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Cause extends Equatable {
  final String id;
  final String name;
  final String description;
  final String solution;
  final String symptomeName;

  Cause(
      {required this.id,
      required this.name,
      this.description = '',
      this.solution = '',
      this.symptomeName = ''});

  factory Cause.format(element) {
    late String id;
    late String name;
    late String description;
    late String solution;
    late String symptomeName;
    try {
      id = element['id'];
      name = element['data']['name'];
      description = element['data']['description'];
      solution = element['data']['solution'];
      symptomeName = element['data']['symptom_id'];
    } catch (e) {
      rethrow;
    }

    return Cause(
      id: id,
      name: name,
      description: description,
      solution: solution,
      symptomeName: symptomeName,
    );
  }

  @override
  List<Object> get props => [id, name, description, solution, symptomeName];

  Cause copyWith({
    String? id,
    String? name,
    String? description,
    String? solution,
    String? symptomeName,
  }) {
    return Cause(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      solution: solution ?? this.solution,
      symptomeName: symptomeName ?? this.symptomeName,
    );
  }
}
