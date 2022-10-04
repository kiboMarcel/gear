import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String name;
  final VoidCallback onPressed;
  final Widget icon;
  final Widget? lockIcon;
  CategoryCard(
      {Key? key,
      required this.name,
      required this.onPressed,
      required this.icon,
      this.lockIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Color(0xFF3F485E),
        ),
        elevation: MaterialStateProperty.all(0),
        shadowColor:
            MaterialStateProperty.all(Theme.of(context).colorScheme.secondary),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            SizedBox(
              height: 12,
            ),
            Hero(
              tag: name,
              child: Text(name,
                  overflow: TextOverflow.fade,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                  maxLines: 1,
                  softWrap: false),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child:
                  lockIcon /* FaIcon(
                FontAwesomeIcons.lock,
                size: 13,
                color: kgreenColor,
              ) */
              ,
            )
          ],
        ),
      ),
    );
  }
}
