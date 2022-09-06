import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/repositories/equipements_repository.dart';
import 'logics/cubits/equipement/equipement_cubit.dart';
import 'presentations/screens/breakdowns_screen.dart';
import 'presentations/screens/home_screen.dart';
import 'presentations/screens/operation_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<EquipementRepository>(
          create: (context) => EquipementRepository(
            firebaseFirestore: FirebaseFirestore.instance,
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<EquipementCubit>(
            create: (context) => EquipementCubit(),
          ),
        ],
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Industry',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomeScreen(),
          routes: {
            OperationScreen.id: (context) => OperationScreen(),
            BreakdonwScreen.id: (context) => BreakdonwScreen(),
          },
        ),
      ),
    );
  }
}
