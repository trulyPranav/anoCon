import 'package:anon_service/screens/call_screen.dart';
import 'package:flutter/material.dart';

class Caller extends StatefulWidget {
  final String offer;
  const Caller({super.key, required this.offer});

  @override
  State<Caller> createState() => _CallerState();
}

class _CallerState extends State<Caller> {
  void _startCall(BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VideoCallScreen(callId: widget.offer),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () => _startCall(context),
          child: CircleAvatar(
            backgroundColor: Colors.white70,
            maxRadius: 35,
            minRadius: 30,
            child: Icon(
              Icons.video_call_outlined,
              size: 50,
              color: Colors.orange[600],
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        GestureDetector(
          onTap: (){},
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
        ),
      ],
    );
  }
}