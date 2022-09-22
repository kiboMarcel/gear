import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fbauth;

import '../../constants/db_constant.dart';
import '../models/custom_error.dart';
import '../models/user_model.dart';

class AuthRepository {
  final FirebaseFirestore firebaseFirestore;
  final fbauth.FirebaseAuth firebaseAuth;

  AuthRepository({
    required this.firebaseFirestore,
    required this.firebaseAuth,
  });

  Stream<fbauth.User?> get user => firebaseAuth.userChanges();

  Future<void> signup(
      {required String name,
      required String email,
      required String password}) async {
    try {
      final fbauth.UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      final signedInUser = userCredential.user!;

      //signedInUser.sendEmailVerification();
      var today = DateTime.now();
      var oneMonthFromNow = today.add(Duration(days: 30));

      await usersRef.doc(signedInUser.uid).set({
        'name': name,
        'email': email,
        'membership': {'chapter': {}, 'classe': []},
        'number': '',
        'nationality': User.defaultNationality,
        'starting_date': DateTime.now(),
        'ending_date': oneMonthFromNow,
      });
    } on fbauth.FirebaseAuthException catch (e) {
      throw CustomError(code: e.code, message: e.message!, plugin: e.plugin);
    } catch (e) {
      throw CustomError(
          code: 'Exception',
          message: e.toString(),
          plugin: 'flutter_error/server_error');
    }
  }

  Future<void> signin({required String email, required String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on fbauth.FirebaseAuthException catch (e) {
      throw CustomError(code: e.code, message: e.message!, plugin: e.plugin);
    } catch (e) {
      throw CustomError(
          code: 'Exception',
          message: e.toString(),
          plugin: 'flutter_error/server_error');
    }
  }

  Future<void> signout() async {
    await firebaseAuth.signOut();
  }
}
