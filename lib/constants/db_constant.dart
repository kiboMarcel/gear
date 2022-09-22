import 'package:cloud_firestore/cloud_firestore.dart';

final usersRef = FirebaseFirestore.instance.collection('subscriber');

final catRef = FirebaseFirestore.instance.collection('categories');

final paymentRef = FirebaseFirestore.instance.collection('config');

final equipementRef = FirebaseFirestore.instance.collection('equipements');

final functionRef = FirebaseFirestore.instance.collection('functions');

final symptomRef = FirebaseFirestore.instance.collection('symptoms');

final causeRef = FirebaseFirestore.instance.collection('causes');

final appImages = FirebaseFirestore.instance.collection('appImage');
