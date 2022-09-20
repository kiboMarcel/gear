import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/enums.dart';
import '../../logics/cubits/equipement/equipement_cubit.dart';
import '../../logics/cubits/symptom/symptom_cubit.dart';
import '../../utils/dimensions.dart';
import '../widgets/card_widget.dart';
import '../widgets/shimmer/card_widget_shimmer.dart';
import 'symptom_screen.dart';

class EquipmentScreen extends StatefulWidget {
  final int index;
  final String categoryName;
  final String categoryId;
  const EquipmentScreen(
      {Key? key,
      required this.categoryName,
      required this.categoryId,
      required this.index})
      : super(key: key);

  @override
  State<EquipmentScreen> createState() => _EquipmentScreenState();
}

class _EquipmentScreenState extends State<EquipmentScreen> {
  @override
  void initState() {
    context.read<EquipementCubit>().getEquipement(catid: widget.categoryId);
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
      body: Column(
        children: [
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
              '${widget.categoryName} / equipement',
              style: TextStyle(fontSize: 20),
            )),
          ),
          BlocConsumer<EquipementCubit, EquipementState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state.equipmentStatus == EquipmentStatus.loading) {
                return CardWidgetShimmer(); /* Container(
                  margin: EdgeInsets.only(top: Dimensions.height30),
                  child: CircularProgressIndicator(),
                ); */
              } else if (state.equipmentStatus == EquipmentStatus.loaded) {
                if (state.equipments.isNotEmpty) {
                  return Expanded(
                    child: ListView.builder(
                      cacheExtent: 0,
                      itemBuilder: (context, index) {
                        return CardWidget(
                          icon: Icon(Icons.blur_on_rounded),
                          onTap: () {
                            context.read<SymptomCubit>().getSymptomByEquip(
                                equipementid: state.equipments[index].id);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SymptomScreen(),
                              ),
                            );
                          },
                          text: state.equipments[index].name,
                        );
                      },
                      itemCount: state.equipments.length,
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
          )
        ],
      ),
    );
  }
}
