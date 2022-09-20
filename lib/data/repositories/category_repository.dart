import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gear/data/models/category.dart';

import '../../constants/db_constant.dart';
import '../models/custom_error.dart';

class CategoryRepository {
  final FirebaseFirestore firebaseFirestore;

  CategoryRepository({
    required this.firebaseFirestore,
  });

  Future<List<Category>> getCategory() async {
    late List list = [];
    late List<Category> categories = [];
    try {
      final QuerySnapshot categoryDoc = await catRef.orderBy('name').get();
      if (categoryDoc.size > 0) {
        /* final catData = Category.fromDoc(categoryDoc);
        list.add(catData); */
        list = categoryDoc.docs
            .map((doc) => {"id": doc.id, "data": doc.data()})
            .toList();

        for (var i = 0; i < list.length; i++) {
          Category cat = Category.format(list[i]);
          categories.add(cat);
        }

        return categories;
      }

      throw 'LIST NOT FOUND';
    } on FirebaseException catch (e) {
      throw CustomError(
        code: e.code,
        message: e.message!,
        plugin: e.plugin,
      );
    } catch (e) {
      throw CustomError(
        code: 'exeption',
        message: e.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }
}
