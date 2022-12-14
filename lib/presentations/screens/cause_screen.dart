import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/enums.dart';
import '../../logics/cubits/cause/cause_cubit.dart';
import '../../utils/dimensions.dart';
import '../widgets/break_down_widget.dart';

class CauseScreen extends StatelessWidget {
  const CauseScreen({Key? key}) : super(key: key);

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
            'Causes',
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
      body: BlocConsumer<CauseCubit, CauseState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state.causeStatus == CauseStatus.loading) {
            return Container(
              margin: EdgeInsets.only(top: 20),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state.causeStatus == CauseStatus.loaded) {
            return Column(children: [
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return BreakDonwCard(
                      solution: state.causes[index].solution,
                      subtitle: state.causes[index].description,
                      icon: Icon(
                        Icons.health_and_safety,
                        color: Colors.white,
                      ),
                      onTap: () {},
                      text: state.causes[index].name,
                    );
                  },
                  itemCount: state.causes.length,
                ),
              ),
            ]);
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
