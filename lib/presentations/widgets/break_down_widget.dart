import 'package:flutter/material.dart';

import '../../utils/dimensions.dart';

class BreakDonwCard extends StatelessWidget {
  final String text;
  final String subtitle;
  final Widget icon;
  final void Function()? onTap;

  BreakDonwCard(
      {Key? key,
      required this.text,
      required this.onTap,
      required this.icon,
      this.subtitle = ''})
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
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
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
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
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
