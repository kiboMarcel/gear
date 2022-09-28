import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  static const String defaultNationality = 'Togo';
  final String id;
  final String username;
  final String password;

  User({
    required this.id,
    required this.username,
    required this.password,
  });

  factory User.fromDoc(DocumentSnapshot userDoc) {
    final userData = userDoc.data() as Map<String, dynamic>?;

    return User(
      id: userDoc.id,
      username: userData!['name'],
      password: userData['email'],
    );
  }

  factory User.format(element) {
    late String id;
    late String username;
    late String password;

    try {
      id = element['id'];
      username = element['data']['username'];
      password = element['data']['password'];
    } catch (e) {
      throw '$e';
    }

    return User(
      id: id,
      username: username,
      password: password,
    );
  }

  factory User.intialUser() {
    return User(
      id: '',
      username: '',
      password: '',
    );
  }

  @override
  List<Object> get props {
    return [
      id,
      username,
      password,
    ];
  }

  @override
  String toString() {
    return 'User(id: $id, username: $username, password: $password)';
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': username});
    result.addAll({'email': password});

    return result;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? '',
      username: map['username'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
