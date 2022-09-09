import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gear/constants/enums.dart';
import 'package:gear/logics/cubits/equipment_function/equipment_function_cubit.dart';

import '../../logics/cubits/symptom/symptom_cubit.dart';
import '../../utils/dimensions.dart';
import '../widgets/card_widget.dart';
import 'symptom_screen.dart';

class FunctionScreen extends StatefulWidget {
  final int index;
  final String categoryName;
  const FunctionScreen(
      {Key? key, required this.categoryName, required this.index})
      : super(key: key);

  @override
  State<FunctionScreen> createState() => _FunctionScreenState();
}

class _FunctionScreenState extends State<FunctionScreen> {
  @override
  void initState() {
    context
        .read<EquipmentFunctionCubit>()
        .getEquipementfunctions(catName: widget.categoryName);
    super.initState();
  }

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
      body: Column(
        children: [
          SizedBox(
            height: Dimensions.height20,
          ),
          Hero(
            tag: 'categorie ${widget.index}',
            child: Container(
              height: 30,
              width: Dimensions.screenWidth / 0.5,
              margin: EdgeInsets.symmetric(vertical: 3, horizontal: 100),
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
          BlocConsumer<EquipmentFunctionCubit, EquipmentFunctionState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state.equipFunctionStatus == EquipFunctionStatus.loading) {
                return Container(
                    margin: EdgeInsets.only(top: Dimensions.height30),
                    child: CircularProgressIndicator());
              } else if (state.equipFunctionStatus ==
                  EquipFunctionStatus.loaded) {
                return Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return CardWidget(
                        icon: Icon(Icons.abc),
                        onTap: () {
                          context.read<SymptomCubit>().getSymptomByFonction(
                              fonctionName:
                                  state.equipmentFunctions[index].name);
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
                );
              }
              return Container();
            },
          )
        ],
      ),
    );
  }
}
