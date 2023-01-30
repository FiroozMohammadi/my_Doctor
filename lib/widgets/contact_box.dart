import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class ContactBox extends StatelessWidget {
  ContactBox(
      {Key? key, required this.icons, required this.color, required this.onTap})
      : super(key: key);
  var icons;
  var color;
  var onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 45,
      decoration: BoxDecoration(
          color: color.withAlpha(30), borderRadius: BorderRadius.circular(30)),
      child: IconButton(
        onPressed: onTap,
        icon: Icon(icons),
        color: color,
        iconSize: 25,
      ),
    );
  }
}
