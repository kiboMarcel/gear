import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {
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
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    )..forward();

    CurvedAnimation curve =
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn);

    _animation = Tween(begin: 0.5, end: 1.0).animate(curve);

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: Card(
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        color: Color(0xFF3F485E),
        elevation: 0,
        child: InkWell(
          borderRadius: BorderRadius.circular(5),
          highlightColor: Color(0xFF3F485E),
          splashColor: Color(0xFF3F485E),
          onTap: widget.onTap,
          child: ListTile(
            iconColor: Colors.white,
            leading: widget.icon,
            title: Text(
              widget.text,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            subtitle: Text(
              widget.subtitle,
              style: TextStyle(color: Colors.white),
            ),
            trailing: Icon(Icons.navigate_next, color: Colors.white, size: 40),
          ),
        ),
      ),
    );
  }
}
