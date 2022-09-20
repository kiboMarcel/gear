import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gear/data/models/cause.dart';
import 'package:gear/data/models/custom_error.dart';

import '../../constants/db_constant.dart';

class CauseRepository {
  final FirebaseFirestore firebaseFirestore;

  CauseRepository({required this.firebaseFirestore});

  Future<List<Cause>> getCause({required String symptomId}) async {
    late List list;
    List<Cause> causes = [];
    try {
      QuerySnapshot symptomDocs =
          await causeRef.where('symptom_id', isEqualTo: symptomId).get();

      if (symptomDocs.size > 0) {
        list = symptomDocs.docs
            .map((docs) => {'id': docs.id, 'data': docs.data()})
            .toList();
        for (var i = 0; i < list.length; i++) {
          Cause cause = Cause.format(list[i]);
          causes.add(cause);
        }
        return causes;
      }
      throw 'CAUSES NOT FOUND';
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
