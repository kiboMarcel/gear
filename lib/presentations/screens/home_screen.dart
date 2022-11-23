import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gear/presentations/widgets/category_card.dart';

import '../../constants/enums.dart';
import '../../data/models/equipement.dart';
import '../../logics/cubits/category/category_cubit.dart';
import '../../utils/dimensions.dart';
import '../widgets/shimmer/category_card_shimmer.dart';
import 'category_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Equipement>> futureEquipement;
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
    context.read<CategoryCubit>().getCategories();
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
          onTap: () => _scrollController.jumpTo(0),
          child: Text(
            'BB-Maint',
            style: TextStyle(color: Colors.white),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: MySearchDelegate());
            },
            icon: Icon(
              Icons.search_rounded,
              size: Dimensions.iconseSize24 + 10,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocConsumer<CategoryCubit, CategoryState>(
              listener: (context, state) {
            if (state.categoryStatus == CategoryStatus.error) {
              return;
            }
          }, builder: (context, state) {
            if (state.categoryStatus == CategoryStatus.loading) {
              return Expanded(
                child: CategoryCardShimmer(),
              );
            } else if (state.categoryStatus == CategoryStatus.loaded) {
              return Expanded(
                child: GridView.custom(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  controller: _scrollController,
                  childrenDelegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return CategoryCard(
                        name: ' ${state.categories[index].name}',
                        icon: Icon(
                          Icons.category_outlined,
                          color: Colors.white,
                          size: 45,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CategoryScreen(
                                categoryName: state.categories[index].name,
                                categoryId: state.categories[index].id,
                                index: index,
                              ),
                            ),
                          );
                        },
                      );
                    },
                    childCount: state.categories.length,
                  ),
                ),
              );
            }
            return Container();
          }),
        ],
      ),
    );
  }
}

/* Container _buildGradient(Animation<double> animation, context) {
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Colors.transparent,
          ColorTween(
                  begin: Theme.of(context).colorScheme.onBackground,
                  end: Theme.of(context).primaryColor)
              .evaluate(animation)!
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    ),
  );
} */

class MySearchDelegate extends SearchDelegate {
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
    var categories = context.read<CategoryCubit>().state.categories;
    List result = search(categories, query);
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
                    builder: (context) => CategoryScreen(
                      categoryName: result[index].name,
                      categoryId: result[index].id,
                      index: index,
                    ),
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
    var categories = context.read<CategoryCubit>().state.categories;
    List result = search(categories, query);
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
                    builder: (context) => CategoryScreen(
                      categoryName: result[index].name,
                      categoryId: result[index].id,
                      index: index,
                    ),
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

  List search(List categories, query) {
    List result = [];

    for (var i = 0; i < categories.length; i++) {
      var name = categories[i].name.toLowerCase();
      var quer = query.toLowerCase();
      if (quer.toString().isNotEmpty) {
        if (name.contains(quer)) {
          result.add(categories[i]);
        }
      }
    }
    return result;
  }
}
