import 'package:flutter/material.dart';
import 'package:gear/utils/dimensions.dart';

import '../widgets/big_card.dart';
import '../widgets/big_text.dart';
import 'equipment_screen.dart';
import 'function_screen.dart';

class CategoryScreen extends StatelessWidget {
  final int index;
  final String categoryName;
  CategoryScreen({Key? key, required this.categoryName, required this.index})
      : super(key: key);

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
        actions: [],
      ),
      body: Column(
        children: [
          BigTextWidget(
            text: categoryName,
          ),
          SizedBox(
            height: Dimensions.height45,
          ),
          BigCard(
            name: 'MACHINES',
            image: 'assets/images/machine.jpg',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EquipmentScreen(
                    categoryName: categoryName,
                    index: index,
                  ),
                ),
              );
            },
          ),
          BigCard(
            name: 'FONTIONS',
            image: 'assets/images/fonction.jpg',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FunctionScreen(
                    categoryName: categoryName,
                    index: index,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
