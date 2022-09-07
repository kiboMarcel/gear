import 'package:cloud_firestore/cloud_firestore.dart';

import '../../constants/db_constant.dart';
import '../models/custom_error.dart';
import '../models/equipment_function.dart';

class EquipementFunctionRepository {
  final FirebaseFirestore firebaseFirestore;

  EquipementFunctionRepository({
    required this.firebaseFirestore,
  });

  Future<List<EquipmentFunction>> getEquipmentFunction(
      {required String catName}) async {
    late List list = [];
    late List<EquipmentFunction> functions = [];
    try {
      final QuerySnapshot equipFunctionDoc =
          await functionRef.where('cat_id', isEqualTo: catName).get();
      if (equipFunctionDoc.size > 0) {
        list = equipFunctionDoc.docs
            .map((doc) => {"id": doc.id, "data": doc.data()})
            .toList();

        for (var i = 0; i < list.length; i++) {
          EquipmentFunction cat = EquipmentFunction.format(list[i]);
          functions.add(cat);
        }

        //print(functions);
        return functions;
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
