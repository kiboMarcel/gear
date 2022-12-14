// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Equipement extends Equatable {
  final String id;
  final String name;
  final String description;
  final String catId;

  Equipement({
    required this.id,
    required this.name,
    required this.description,
    required this.catId,
  });

  factory Equipement.format(element) {
    late String id;
    late String name;
    late String description;
    late String catId;
    try {
      id = element['id'];
      name = element['data']['name'];
      description = element['data']['description'];
      catId = element['data']['cat_id'];
    } catch (e) {
      rethrow;
    }

    return Equipement(
      id: id,
      name: name,
      description: description,
      catId: catId,
    );
  }

  @override
  List<Object> get props => [id, name, description, catId];

  Equipement copyWith({
    String? id,
    String? name,
    String? description,
    String? catId,
  }) {
    return Equipement(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      catId: catId ?? this.catId,
    );
  }

  @override
  bool get stringify => true;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'catId': catId,
    };
  }

  factory Equipement.fromMap(Map<String, dynamic> map) {
    return Equipement(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      catId: map['catId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Equipement.fromJson(String source) =>
      Equipement.fromMap(json.decode(source) as Map<String, dynamic>);
}
