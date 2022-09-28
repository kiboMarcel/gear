import 'package:flutter/material.dart';

class RoundedButton extends StatefulWidget {
  final Widget child;
  final void Function()? onPressed;
  final Color backgroundColor;
  final double elevation;
  const RoundedButton({
    required this.child,
    required this.onPressed,
    this.backgroundColor = const Color(0xFF8E6B91),
    this.elevation = 2.0,
    Key? key,
  }) : super(key: key);

  @override
  State<RoundedButton> createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: TextButton(
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(Size.fromHeight(45)),
          foregroundColor: MaterialStateProperty.all(Colors.white),
          backgroundColor: MaterialStateProperty.all(widget.backgroundColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          elevation: MaterialStateProperty.all(2),
        ),
        onPressed: widget.onPressed,
        child: widget.child,
      ),
    );
  }
}
