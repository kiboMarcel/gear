import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/enums.dart';
import '../../logics/cubits/cause/cause_cubit.dart';
import '../../utils/dimensions.dart';
import '../widgets/big_text.dart';
import '../widgets/break_down_widget.dart';

class CauseScreen extends StatelessWidget {
  const CauseScreen({Key? key}) : super(key: key);

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
      body: Column(children: [
        SizedBox(
          height: Dimensions.height20,
        ),
        BigTextWidget(
          text: 'Causes',
          size: 25,
        ),
        BlocConsumer<CauseCubit, CauseState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state.causeStatus == CauseStatus.loading) {
              return Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Center(child: CircularProgressIndicator()));
            } else if (state.causeStatus == CauseStatus.loaded) {
              return Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return BreakDonwCard(
                      solution: state.causes[index].solution,
                      icon: Icon(Icons.face),
                      onTap: () {},
                      text: state.causes[index].name,
                    );
                  },
                  itemCount: state.causes.length,
                ),
              );
            }
            return Container();
          },
        ),
      ]),
    );
  }
}
