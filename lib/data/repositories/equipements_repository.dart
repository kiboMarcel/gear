import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gear/data/models/equipement.dart';

import '../../constants/db_constant.dart';
import '../models/custom_error.dart';

class EquipementRepository {
  final FirebaseFirestore firebaseFirestore;

  EquipementRepository({
    required this.firebaseFirestore,
  });

  Future<List<Equipement>> getEquipment({required String catId}) async {
    late List<Map<String, dynamic>> list = [];
    late List<Equipement> equipementsList = [];

    try {
      final QuerySnapshot equipDoc =
          await equipementRef.where('cat_id', isEqualTo: catId).get();

      if (equipDoc.size > 0) {
        list = equipDoc.docs
            .map((doc) => {"id": doc.id, "data": doc.data()})
            .toList();

        for (var i = 0; i < list.length; i++) {
          Equipement equipement = Equipement.format(list[i]);
          equipementsList.add(equipement);
        }

        return equipementsList;
      }

      return equipementsList;
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
