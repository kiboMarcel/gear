import 'package:cloud_firestore/cloud_firestore.dart';

final languageRef = FirebaseFirestore.instance.collection('language');

final usersRef = FirebaseFirestore.instance.collection('subscriber');

final paymentRef = FirebaseFirestore.instance.collection('config');

final orderRef = FirebaseFirestore.instance.collection('order');

final appImages = FirebaseFirestore.instance.collection('appImage');
