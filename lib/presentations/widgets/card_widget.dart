import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String text;
  final String subtitle;
  final Widget icon;
  final void Function()? onTap;

  CardWidget(
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
      child: ListTile(
        onTap: onTap,
        leading: icon,
        title: Text(
          text,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(color: Colors.white),
        ),
        trailing: Icon(Icons.navigate_next, color: Colors.white, size: 40),
      ),
    );
  }
}
