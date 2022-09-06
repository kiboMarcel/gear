import 'package:flutter/material.dart';

import '../../utils/dimensions.dart';
import '../widgets/big_text.dart';
import '../widgets/break_down_widget.dart';

class BreakdonwScreen extends StatelessWidget {
  static const String id = 'breakdown_screen';
  const BreakdonwScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3B4254),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: Dimensions.height45,
          ),
          BigTextWidget(
            text: 'Fonctionnement 1',
            size: 30,
          ),
          BigTextWidget(
            text: 'Pannes',
            size: 15,
          ),
          Divider(
            thickness: 0.2,
            indent: Dimensions.widtht30,
            endIndent: Dimensions.widtht30,
            color: Colors.white,
          ),
          ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 20,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 1, horizontal: 3),
                  child: BreakDonwCard(
                    text: 'Panne ${index + 1} ',
                    icon: Icon(Icons.insert_page_break,
                        color: Colors.white, size: 40),
                    onTap: () {},
                  ),
                );
              })
        ],
      )),
    );
  }
}
