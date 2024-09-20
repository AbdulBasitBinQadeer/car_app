import 'package:flutter/material.dart';

class CustomColumnWidget extends StatelessWidget {
  final IconData icon; // To accept different icons
  final String title; // To accept first text
  final String subtitle; // To accept second text

  CustomColumnWidget({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon, // Display the icon
          size: 35,
          color: Colors.white,
        ),
        SizedBox(height: 2), // Add spacing
        Text(
          title, // Display the title text
          style: TextStyle(fontSize: 12,color: Colors.grey),
        ),
        SizedBox(height: 1), // Add spacing
        Text(
          subtitle, // Display the subtitle text
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFFFFD04E)),
        ),
      ],
    );
  }
}
