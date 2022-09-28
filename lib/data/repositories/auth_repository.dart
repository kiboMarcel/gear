import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/db_constant.dart';
import '../models/custom_error.dart';
import '../models/user_model.dart';

class AuthRepository {
  final FirebaseFirestore firebaseFirestore;

  AuthRepository({
    required this.firebaseFirestore,
  });

  int? initScreen;

  Future<int?> checkStatus() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    initScreen = preferences.getInt('initScreen');
    return initScreen;
  }

  Future<User> signin(
      {required String username, required String password}) async {
    List list = [];
    try {
      final QuerySnapshot userDoc =
          await usersRef.where('username', isEqualTo: username).get();

      if (userDoc.size > 0) {
        list = userDoc.docs
            .map((doc) => {"id": doc.id, "data": doc.data()})
            .toList();

        User user = User.format(list[0]);

        if (user.password != password) {
          throw 'Mot de passe Incorrect.';
        }

        return user;
      } else {
        throw 'Cet Utilisateur N\'existe pas.';
      }
    } catch (e) {
      throw CustomError(
          code: 'Exception',
          message: e.toString(),
          plugin: 'flutter_error/server_error');
    }
  }

  Future<void> signout() async {}
}
