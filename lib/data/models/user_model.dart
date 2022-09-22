import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  static const String defaultNationality = 'Togo';
  final String id;
  final String name;
  final String email;
  final Map<String, dynamic> memberShip;
  final String number;
  final String nationality;
  final DateTime startingDate;
  final DateTime endingDate;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.memberShip,
    required this.number,
    required this.startingDate,
    required this.endingDate,
    this.nationality = 'Togo',
  });

  factory User.fromDoc(DocumentSnapshot userDoc) {
    final userData = userDoc.data() as Map<String, dynamic>?;

    return User(
      id: userDoc.id,
      name: userData!['name'],
      email: userData['email'],
      memberShip: userData['membership'],
      number: userData['number'],
      nationality: userData['nationality'],
      startingDate: userData['starting_date'].toDate(),
      endingDate: userData['ending_date'].toDate(),
    );
  }

  factory User.intialUser() {
    return User(
      id: '',
      name: '',
      email: '',
      memberShip: {},
      number: '',
      nationality: '',
      startingDate: DateTime.now(),
      endingDate: DateTime.now(),
    );
  }

  @override
  List<Object> get props {
    return [
      id,
      name,
      email,
      memberShip,
      number,
      nationality,
      startingDate,
      endingDate,
    ];
  }

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, memberShip: $memberShip, number: $number, nationality: $nationality, startingDate: $startingDate, endingDate: $endingDate)';
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'email': email});
    result.addAll({'memberShip': memberShip});
    result.addAll({'number': number});
    result.addAll({'nationality': nationality});
    result.addAll({'startingDate': startingDate.millisecondsSinceEpoch});
    result.addAll({'endingDate': endingDate.millisecondsSinceEpoch});

    return result;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      memberShip: map['memberShip'] ?? '',
      number: map['number'] ?? '',
      nationality: map['nationality'] ?? '',
      startingDate: DateTime.fromMillisecondsSinceEpoch(map['startingDate']),
      endingDate: DateTime.fromMillisecondsSinceEpoch(map['endingDate']),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
