import 'package:flutter/material.dart';

import '../../utils/dimensions.dart';
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
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return BreakDonwCard(
                icon: Icon(Icons.face),
                onTap: () {},
                text: 'cause',
              );
            },
            itemCount: 1,
          ),
        ),
      ]),
    );
  }
}
