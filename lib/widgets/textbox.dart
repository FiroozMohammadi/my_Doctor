import 'package:flutter/material.dart';

class CustomTextBox extends StatelessWidget {
  const CustomTextBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          color: Colors.grey.shade300, borderRadius: BorderRadius.circular(50)),
      child: const TextField(
        
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.search, color: Colors.grey),
            border: InputBorder.none,
            hintText: "جستجو",
            hintStyle: TextStyle(color: Colors.grey, fontSize: 17)),
      ),
    );
  }
}
