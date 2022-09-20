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
            'App Name',
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
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        color: Color(0xFF3B4254),
      ),
    );
  }

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
          icon: Icon(Icons.clear)),
    ];
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      color: Color(0xFF3B4254),
    );
  }
}
