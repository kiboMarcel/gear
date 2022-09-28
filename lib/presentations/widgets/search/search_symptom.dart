import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gear/logics/cubits/symptom/symptom_cubit.dart';

import '../../../logics/cubits/cause/cause_cubit.dart';
import '../../screens/cause_screen.dart';

class SearchSymptopm extends SearchDelegate {
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
      textTheme: TextTheme(
        subtitle1: TextStyle(color: Colors.white),
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
          color: Colors.white38,
        ),
      ),
    );
  }

  @override
  TextStyle get searchFieldStyle => TextStyle(
        color: Colors.white,
      );

  @override
  String get searchFieldLabel => 'Chercher...';

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
    var allSymptoms = context.read<SymptomCubit>().state.allSymptoms;
    List result = search(allSymptoms: allSymptoms, query: query);
    return resultData(result: result);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var allSymptoms = context.read<SymptomCubit>().state.allSymptoms;
    List result = search(allSymptoms: allSymptoms, query: query);
    return resultData(result: result);
  }

  List search({required List allSymptoms, required String query}) {
    List result = [];

    for (var i = 0; i < allSymptoms.length; i++) {
      var name = allSymptoms[i].name.toLowerCase();
      var quer = query.toLowerCase();
      if (quer.toString().isNotEmpty) {
        if (name.contains(quer)) {
          result.add(allSymptoms[i]);
        }
      }
    }
    return result;
  }

  Widget resultData({required List result}) {
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
                context
                    .read<CauseCubit>()
                    .getCause(symptomId: result[index].id);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CauseScreen(),
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
}
