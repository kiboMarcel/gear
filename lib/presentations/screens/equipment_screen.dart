import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/enums.dart';
import '../../logics/cubits/equipement/equipement_cubit.dart';
import '../../logics/cubits/symptom/symptom_cubit.dart';
import '../../utils/dimensions.dart';
import '../widgets/card_widget.dart';
import '../widgets/search/search_equipement.dart';
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
            'Equipement',
            style: TextStyle(color: Colors.white),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: SearchEquipement());
            },
            icon: Icon(
              Icons.search_rounded,
              size: Dimensions.iconseSize24 + 10,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: BlocConsumer<EquipementCubit, EquipementState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state.equipmentStatus == EquipmentStatus.loading) {
            return Center(child: CircularProgressIndicator());
          } else if (state.equipmentStatus == EquipmentStatus.loaded) {
            if (state.equipments.isNotEmpty) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 30,
                    width: Dimensions.screenWidth / 0.5,
                    margin: EdgeInsets.symmetric(vertical: 30, horizontal: 100),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                        child: Text(
                      overflow: TextOverflow.fade,
                      widget.categoryName,
                      style: TextStyle(fontSize: 20),
                    )),
                  ),
                  Expanded(
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
                  ),
                ],
              );
            }
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Opacity(
                opacity: 0.5,
                child: Image(
                  image: AssetImage(
                    'assets/images/empty.png',
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Rien ?? afficher',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ],
          );
        },
      ),
    );
  }
}
