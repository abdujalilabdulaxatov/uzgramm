import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Searching extends StatefulWidget {
  const Searching({super.key});

  @override
  State<Searching> createState() => _SearchingState();
}

class _SearchingState extends State<Searching> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
              hintText: "Qidiruv",
              hintStyle: TextStyle(
                  color: Color.fromARGB(201, 255, 255, 255), fontSize: 18)),
        ),
      ),
    );
  }
}
