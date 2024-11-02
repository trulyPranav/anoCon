import 'package:anon_service/widgets/callerWidgets/caller.dart';
import 'package:anon_service/widgets/callerWidgets/text_placer.dart';
import 'package:flutter/material.dart';

class CallPlacer extends StatefulWidget {
  const CallPlacer({super.key});

  @override
  State<CallPlacer> createState() => _CallPlacerState();
}

class _CallPlacerState extends State<CallPlacer> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextPlacer(),
        Caller(),
      ],
    );
  }
}