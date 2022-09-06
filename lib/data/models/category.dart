import 'package:cloud_firestore/cloud_firestore.dart';

class Category {
  String id;
  String name;

  Category({
    required this.id,
    required this.name,
  });

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
}
