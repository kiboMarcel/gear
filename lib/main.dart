import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'data/repositories/category_repository.dart';
import 'data/repositories/equipements_repository.dart';
import 'logics/cubits/category/category_cubit.dart';
import 'logics/cubits/equipement/equipement_cubit.dart';
import 'presentations/screens/breakdowns_screen.dart';
import 'presentations/screens/home_screen.dart';
import 'presentations/screens/operation_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());

  HydratedBlocOverrides.runZoned(
    () {
      runApp(MyApp());
    },
    storage: storage,
  );

  /*  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  }); */
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<CategoryRepository>(
          create: (context) => CategoryRepository(
            firebaseFirestore: FirebaseFirestore.instance,
          ),
        ),
        RepositoryProvider<EquipementRepository>(
          create: (context) => EquipementRepository(
            firebaseFirestore: FirebaseFirestore.instance,
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<CategoryCubit>(
            create: (context) => CategoryCubit(
              categoryRepository: context.read<CategoryRepository>(),
            ),
          ),
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
