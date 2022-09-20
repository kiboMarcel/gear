// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String id;
  final String name;

  Category({
    required this.id,
    required this.name,
  });

  factory Category.format(element) {
    late String id;
    late String name;

    try {
      id = element['id'];
      name = element['data']['name'];
    } catch (e) {
      throw '$e';
    }

    return Category(
      id: id,
      name: name,
    );
  }

  factory Category.fromDoc(QuerySnapshot categoryDoc) {
    dynamic categoryData;
    for (var categories in categoryDoc.docs) {
      categoryData = categories;
    }

    return Category(
      id: categoryData.id,
      name: categoryData.get('name'),
    );
  }

  @override
  List<Object> get props => [id, name];

  Category copyWith({
    String? id,
    String? name,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  bool get stringify => true;
}
