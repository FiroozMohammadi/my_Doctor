// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class CategoryBox extends StatelessWidget {
  CategoryBox(
      {Key? key,
      required this.title,
      required this.onPressed,
      required this.icon,
      this.color})
      : super(key: key);
  IconData icon;
  Color? color;
  String title;
  var onPressed;
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    minimumSize: const Size(90, 36),
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.only(top: 20, bottom: 20, left: 8, right: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(1, 1), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            TextButton(
              onPressed: onPressed,
              style: flatButtonStyle,
              child: Column(
                // Replace with a Row for horizontal icon + text
                children: <Widget>[
                  Icon(
                    icon,
                    color: color,
                    size: 40,
                  ),
                  const SizedBox(height: 7),
                  Text(
                    title,
                    style: TextStyle(color: color),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
