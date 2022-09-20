import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gear/data/models/symptom.dart';

import '../../constants/db_constant.dart';
import '../models/custom_error.dart';

class SymptomRepositpory {
  FirebaseFirestore firebaseFirestore;

  SymptomRepositpory({required this.firebaseFirestore});

  Future<List<Symptom>> getSymptomByEquip(
      {required String equipementid}) async {
    late List list;
    List<Symptom> symptomlist = [];
    try {
      QuerySnapshot symptomDoc = await symptomRef
          .where('equipment_id', isEqualTo: equipementid)
          .orderBy('name')
          .get();

      if (symptomDoc.size > 0) {
        list = symptomDoc.docs
            .map((docs) => {'id': docs.id, 'data': docs.data()})
            .toList();

        for (var i = 0; i < list.length; i++) {
          Symptom symptom = Symptom.format(list[i]);
          symptomlist.add(symptom);
        }

        return symptomlist;
      }
      throw 'SYMPTOM NOT FOUN';
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

  Future<List<Symptom>> getSymptomByFonction(
      {required String fonctionId}) async {
    late List list;
    List<Symptom> symptomlist = [];
    try {
      QuerySnapshot symptomDoc = await symptomRef
          .where('function_id', isEqualTo: fonctionId)
          .orderBy('name')
          .get();

      if (symptomDoc.size > 0) {
        list = symptomDoc.docs
            .map((docs) => {'id': docs.id, 'data': docs.data()})
            .toList();

        for (var i = 0; i < list.length; i++) {
          Symptom symptom = Symptom.format(list[i]);
          symptomlist.add(symptom);
        }

        return symptomlist;
      }
      throw 'SYMPTOM NOT FOUN';
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
