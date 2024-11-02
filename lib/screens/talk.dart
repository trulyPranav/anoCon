import 'package:anon_service/widgets/mainScreenWidgets/about_container.dart';
import 'package:anon_service/widgets/mainScreenWidgets/call_placer.dart';
import 'package:anon_service/widgets/mainScreenWidgets/intro_container.dart';
import 'package:flutter/material.dart';

class TalkScreen extends StatefulWidget {
  const TalkScreen({super.key});

  @override
  State<TalkScreen> createState() => _TalkScreenState();
}

class _TalkScreenState extends State<TalkScreen> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("anonService"),
          backgroundColor: Colors.grey,
        ),
        body: const Column(
          children: [
            Expanded(
              flex: 1,
              child: IntroContainer()
            ),
            Expanded(
              flex: 5,
              child: CallPlacer()
            ),
            Expanded(
              flex: 5,
              child: AboutContainer()
            ),
          ],
        )
    ));
  }
}