import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gear/logics/cubits/cause/cause_cubit.dart';
import 'package:gear/presentations/screens/cause_screen.dart';

import '../../constants/enums.dart';
import '../../logics/cubits/symptom/symptom_cubit.dart';
import '../../utils/dimensions.dart';
import '../widgets/card_widget.dart';
import '../widgets/shimmer/card_widget_shimmer.dart';

class SymptomScreen extends StatefulWidget {
  const SymptomScreen({super.key});

  @override
  State<SymptomScreen> createState() => _SymptomScreenState();
}

class _SymptomScreenState extends State<SymptomScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3B4254),
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Color(0xFF3B4254),
        elevation: 0,
        centerTitle: true,
        title: InkWell(
          onTap: () {},
          child: Text(
            'App Name',
            style: TextStyle(color: Colors.white),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search_rounded,
              size: Dimensions.iconseSize24 + 10,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(children: [
        SizedBox(
          height: Dimensions.height20,
        ),
        Container(
          height: 30,
          width: Dimensions.screenWidth / 0.5,
          margin: EdgeInsets.symmetric(vertical: 3, horizontal: 100),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
              child: Text(
            'symptom',
            style: TextStyle(fontSize: 20),
          )),
        ),
        BlocConsumer<SymptomCubit, SymptomState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state.symptomStatus == SymptomStatus.loading) {
              return CardWidgetShimmer();
            } else if (state.symptomStatus == SymptomStatus.loaded) {
              if (state.symptomsByEquipemet.isNotEmpty) {
                return Expanded(
                  child: ListView.builder(
                    cacheExtent: 0,
                    itemBuilder: (context, index) {
                      return CardWidget(
                        icon: Icon(Icons.flag_rounded),
                        onTap: () {
                          context.read<CauseCubit>().getCause(
                              symptomId: state.symptomsByEquipemet[index].id);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CauseScreen(),
                            ),
                          );
                        },
                        text: state.symptomsByEquipemet[index].name,
                      );
                    },
                    itemCount: state.symptomsByEquipemet.length,
                  ),
                );
              }
              if (state.symptomByFonction.isNotEmpty) {
                return Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return CardWidget(
                        icon: Icon(Icons.face),
                        onTap: () {
                          context.read<CauseCubit>().getCause(
                              symptomId: state.symptomByFonction[index].id);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CauseScreen(),
                            ),
                          );
                        },
                        text: state.symptomByFonction[index].name,
                      );
                    },
                    itemCount: state.symptomByFonction.length,
                  ),
                );
              }
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                Image(
                  image: AssetImage(
                    'assets/images/empty.png',
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Rien a Afficher',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            );
          },
        ),
      ]),
    );
  }
}
