import 'package:anon_service/screens/about.dart';
import 'package:flutter/material.dart';

class AboutContainer extends StatefulWidget {
  const AboutContainer({super.key});

  @override
  State<AboutContainer> createState() => _AboutContainerState();
}

class _AboutContainerState extends State<AboutContainer> {
  bool _isToggled = false;

  void _toggleAvatar() {
    setState(() {
      _isToggled = !_isToggled;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            left: _isToggled ? ((screenWidth/2) - 120) : (screenWidth/2) - 31,  // Adjusted for centering
            top: screenHeight/8 - 42,
            child: const CircleAvatar(
              maxRadius: 30,
              minRadius: 20,
              child: Icon(
                Icons.supervised_user_circle_rounded,
                size: 40,
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            left: _isToggled ? ((screenWidth/2) + 60) : (screenWidth/2) - 31, // Adjusted for centering
            top: screenHeight/8 - 42,
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const About()));
              },
              child: const CircleAvatar(
                maxRadius: 30,
                minRadius: 20,
                child: Icon(
                  Icons.question_mark_rounded,
                  size: 35,
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            left: (screenWidth/2) - 31,  // Adjusted for centering
            top: screenHeight/8 - 42,    // Adjusted for centering
            child: GestureDetector(
              onTap: _toggleAvatar,
              child: const CircleAvatar(
                maxRadius: 30,
                minRadius: 20,
                child: Icon(
                  Icons.center_focus_strong,
                  size: 40,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
