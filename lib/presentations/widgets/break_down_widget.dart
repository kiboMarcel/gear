import 'package:flutter/material.dart';

import '../../utils/dimensions.dart';

class BreakDonwCard extends StatelessWidget {
  final String text;
  final String subtitle;
  final Widget icon;
  final String solution;
  final void Function()? onTap;

  BreakDonwCard(
      {Key? key,
      required this.text,
      required this.onTap,
      required this.icon,
      required this.solution,
      required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      color: Color(0xFF3F485E),
      elevation: 0,
      child: Column(
        children: [
          ListTile(
            leading: icon,
            title: Text(
              text,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          Divider(indent: Dimensions.widtht30),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              subtitle,
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
          SizedBox(
            height: Dimensions.height10,
          ),
          ExpansionTile(
            title: Text(
              'Solution',
              style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    solution,
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: Dimensions.height20,
          ),
        ],
      ),
    );
  }
}
