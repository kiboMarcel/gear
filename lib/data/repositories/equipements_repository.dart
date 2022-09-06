import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gear/data/models/equipement.dart';

import '../../constants/db_constant.dart';
import '../models/custom_error.dart';

class EquipementRepository {
  final FirebaseFirestore firebaseFirestore;

  EquipementRepository({
    required this.firebaseFirestore,
  });

  Future<List<Equipement>> getBible({required String uid}) async {
    late List<Map<String, dynamic>> list = [];
    late List<Equipement> testamentList = [];
    try {
      final DocumentSnapshot userDoc = await usersRef.doc(uid).get(); //GET USER

      if (userDoc.exists) {
        final userData = userDoc.data() as Map<String, dynamic>?;

        final QuerySnapshot languageDoc = await languageRef
            .where('name', isEqualTo: userData!['language'])
            .get(); // GET LANGUAGE TO DISPLAY TO USER

        dynamic languageData;
        for (var language in languageDoc.docs) {
          languageData = language;
        }

        final testamentDoc = await FirebaseFirestore.instance
            .collection('language/${languageData.id}/bible')
            .get(); // GET THE BIBLE TESTAMENTS

        if (testamentDoc.size > 0) {
          list = testamentDoc.docs.map((doc) => doc.data()).toList();
          //Testament.format(list[1]);
          for (var i = 0; i < list.length; i++) {
            //Testament testament = Testament.format(list[i]);
            // testamentList.add(testament);
          }
        }
        //print('liste des testament ${testamentList.length}');
        return testamentList;
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
