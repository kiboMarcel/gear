import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gear/logics/cubits/cause/cause_cubit.dart';

import '../../constants/enums.dart';
import '../../logics/cubits/symptom/symptom_cubit.dart';
import '../../utils/dimensions.dart';
import '../widgets/card_widget.dart';

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
              return Container(
                  margin: EdgeInsets.only(top: Dimensions.height30),
                  child: CircularProgressIndicator());
            } else if (state.symptomStatus == SymptomStatus.loaded) {
              if (state.symptomsByEquipemet.isNotEmpty) {
                return Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return CardWidget(
                        icon: Icon(Icons.face),
                        onTap: () {
                          print(state.symptomsByEquipemet[index].name);
                          /* context.read<CauseCubit>().getCause(
                              symptomName: state.equipments[index].name); */
                          /*  Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SymptomScreen(),
                            ),
                          ); */
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
                          print('holla');
                        },
                        text: state.symptomByFonction[index].name,
                      );
                    },
                    itemCount: state.symptomByFonction.length,
                  ),
                );
              }
            }
            return Container();
          },
        ),
      ]),
    );
  }
}
