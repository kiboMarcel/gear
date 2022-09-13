import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'data/repositories/category_repository.dart';
import 'data/repositories/cause_repository.dart';
import 'data/repositories/equipements_repository.dart';
import 'data/repositories/equipment_function_repository.dart';
import 'data/repositories/symptom_repository.dart';
import 'logics/cubits/category/category_cubit.dart';
import 'logics/cubits/cause/cause_cubit.dart';
import 'logics/cubits/equipement/equipement_cubit.dart';
import 'logics/cubits/equipment_function/equipment_function_cubit.dart';
import 'logics/cubits/symptom/symptom_cubit.dart';
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
        RepositoryProvider<EquipementFunctionRepository>(
          create: (context) => EquipementFunctionRepository(
            firebaseFirestore: FirebaseFirestore.instance,
          ),
        ),
        RepositoryProvider<EquipementRepository>(
          create: (context) => EquipementRepository(
            firebaseFirestore: FirebaseFirestore.instance,
          ),
        ),
        RepositoryProvider<SymptomRepositpory>(
          create: (context) => SymptomRepositpory(
            firebaseFirestore: FirebaseFirestore.instance,
          ),
        ),
        RepositoryProvider<CauseRepository>(
          create: (context) => CauseRepository(
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
          BlocProvider<EquipmentFunctionCubit>(
            create: (context) => EquipmentFunctionCubit(
              equipementFunctionRepository:
                  context.read<EquipementFunctionRepository>(),
            ),
          ),
          BlocProvider<EquipementCubit>(
            create: (context) => EquipementCubit(
              equipementRepository: context.read<EquipementRepository>(),
            ),
          ),
          BlocProvider<SymptomCubit>(
            create: (context) => SymptomCubit(
              symptomRepositpory: context.read<SymptomRepositpory>(),
            ),
          ),
          BlocProvider<CauseCubit>(
            create: (context) => CauseCubit(
              causeRepository: context.read<CauseRepository>(),
            ),
          ),
        ],
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Industry',
          theme: ThemeData(
            useMaterial3: true,
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
