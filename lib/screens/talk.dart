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
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: IntroContainer()
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 8,
              child: CallPlacer()
            ),
            Expanded(
              flex: 3,
              child: AboutContainer()
            ),
          ],
        )
    ));
  }
}