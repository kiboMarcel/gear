import 'package:flutter/material.dart';

class BigCard extends StatelessWidget {
  final String name;
  final String image;
  final void Function() onTap;
  const BigCard(
      {super.key,
      required this.name,
      required this.image,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: AssetImage(
                  image,
                ),
                fit: BoxFit.cover),
          ),
          child: Stack(children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Color(0x55141414)]),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Positioned(
              left: 10,
              bottom: 10,
              child: Text(
                name,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
