import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gear/constants/enums.dart';
import 'package:gear/logics/cubits/equipment_function/equipment_function_cubit.dart';

import '../../logics/cubits/symptom/symptom_cubit.dart';
import '../../utils/dimensions.dart';
import '../widgets/card_widget.dart';
import '../widgets/shimmer/card_widget_shimmer.dart';
import 'symptom_screen.dart';

class FunctionScreen extends StatefulWidget {
  final int index;
  final String categoryName;
  final String categoryId;
  const FunctionScreen(
      {Key? key,
      required this.categoryName,
      required this.categoryId,
      required this.index})
      : super(key: key);

  @override
  State<FunctionScreen> createState() => _FunctionScreenState();
}

class _FunctionScreenState extends State<FunctionScreen> {
  @override
  void initState() {
    context
        .read<EquipmentFunctionCubit>()
        .getEquipementfunctions(catName: widget.categoryId);
    super.initState();
  }

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
      body: BlocConsumer<EquipmentFunctionCubit, EquipmentFunctionState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state.equipFunctionStatus == EquipFunctionStatus.loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.equipFunctionStatus == EquipFunctionStatus.loaded) {
            if (state.equipmentFunctions.isNotEmpty) {
              return Column(
                children: [
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  Hero(
                    tag: 'categorie ${widget.index}',
                    child: Container(
                      height: 30,
                      width: Dimensions.screenWidth / 0.5,
                      margin:
                          EdgeInsets.symmetric(vertical: 3, horizontal: 100),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child: Text(
                        '${widget.categoryName} ',
                        style: TextStyle(fontSize: 20),
                      )),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return CardWidget(
                          icon: Icon(Icons.build_rounded),
                          onTap: () {
                            context.read<SymptomCubit>().getSymptomByFonction(
                                fonctionId: state.equipmentFunctions[index].id);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SymptomScreen(),
                              ),
                            );
                          },
                          text: state.equipmentFunctions[index].name,
                        );
                      },
                      itemCount: state.equipmentFunctions.length,
                    ),
                  ),
                ],
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
    );
  }
}
