import 'package:flutter/material.dart';

import '../../utils/dimensions.dart';
import '../widgets/big_text.dart';
import '../widgets/card_widget.dart';
import 'breakdowns_screen.dart';

class OperationScreen extends StatelessWidget {
  const OperationScreen({Key? key}) : super(key: key);

  static const String id = 'operation_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3B4254),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            height: 230,
            width: double.infinity,
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/img.jpg'),
            ),
          ),
          SizedBox(
            height: Dimensions.height10,
          ),
          BigTextWidget(
            text: 'Machine 1',
            size: 30,
          ),
          BigTextWidget(
            text: 'Fonctionnement',
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
                  child: CardWidget(
                    text: 'Fonctionnement ${index + 1} ',
                    subtitle: 'Panne 1, panne 2 ...',
                    icon: Icon(Icons.toc, color: Colors.white, size: 40),
                    onTap: () {
                      Navigator.pushNamed(context, BreakdonwScreen.id);
                    },
                  ),
                );
              })
        ],
      )),
    );
  }
}
