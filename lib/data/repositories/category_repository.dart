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
    final List<Category> list = [];
    try {
      final QuerySnapshot categoryDoc = await catRef.get();
      if (categoryDoc.size > 0) {
        //classeDoc.docs;
        final catData = Category.fromDoc(categoryDoc);
        list.add(catData);

        print(list);

        return list;
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
