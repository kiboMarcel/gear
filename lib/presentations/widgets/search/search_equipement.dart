import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gear/logics/cubits/equipement/equipement_cubit.dart';

import '../../screens/symptom_screen.dart';

class SearchEquipement extends SearchDelegate {
  @override
  /* ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        color: Color(0xFF3B4254),
      ),
    );
  } */

  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      appBarTheme: const AppBarTheme(
        color: Color(0xFF3B4254),
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
          color: Colors.white,
        ),
      ),
      inputDecorationTheme: theme.inputDecorationTheme.copyWith(
        iconColor: Colors.white,
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        hintStyle: TextStyle(
            //color: Colors.white,
            ),
      ),
    );
  }

  @override
  TextStyle get searchFieldStyle => TextStyle(
        color: Colors.white,
      );

  @override
  String get searchFieldLabel => 'chercher';

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => close(context, null), icon: Icon(Icons.arrow_back));
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
          icon: Icon(Icons.close_rounded)),
    ];
  }

  @override
  Widget buildResults(BuildContext context) {
    var equipments = context.read<EquipementCubit>().state.equipments;
    List result = search(equipments: equipments, query: query);
    return Container(
      color: Color(0xFF3B4254),
      child: ListView.builder(
        itemCount: result.length,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SymptomScreen(),
                  ),
                );
              },
              title: Text(
                result[index].name,
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var equipments = context.read<EquipementCubit>().state.equipments;
    List result = search(equipments: equipments, query: query);
    return Container(
      color: Color(0xFF3B4254),
      child: ListView.builder(
        itemCount: result.length,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SymptomScreen(),
                  ),
                );
              },
              title: Text(
                result[index].name,
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }

  List search({required List equipments, required String query}) {
    List result = [];

    for (var i = 0; i < equipments.length; i++) {
      var name = equipments[i].name.toLowerCase();
      var quer = query.toLowerCase();
      if (quer.toString().isNotEmpty) {
        if (name.contains(quer)) {
          result.add(equipments[i]);
        }
      }
    }
    return result;
  }
}
