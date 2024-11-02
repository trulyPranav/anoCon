import 'package:flutter/material.dart';

class Caller extends StatefulWidget {
  const Caller({super.key});

  @override
  State<Caller> createState() => _CallerState();
}

class _CallerState extends State<Caller> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: CircleAvatar(
        backgroundColor: Colors.white70,
        maxRadius: 35,
        minRadius: 30,
        child: Icon(
          Icons.call,
          size: 45,
          color: Colors.orange[600],
        ),
      ),
    );
  }
}