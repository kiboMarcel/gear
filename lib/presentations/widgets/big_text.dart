import 'package:flutter/material.dart';

class BigTextWidget extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  BigTextWidget(
      {Key? key,
      required this.text,
      this.color = const Color(0xFFFFFFFF),
      this.size = 45})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: size, color: color),
    );
  }
}
