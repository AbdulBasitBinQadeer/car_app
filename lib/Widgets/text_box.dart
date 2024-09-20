
import 'package:flutter/material.dart';
class SwitchContainer extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool switchValue;
  final Function(bool) onToggle; // Expect a bool parameter

  SwitchContainer({
    required this.title,
    required this.subtitle,
    required this.switchValue,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 190,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Color(0xFFFFD04E),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                Text(subtitle),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 7),
            child: Transform.scale(
              scale: 1.3,
              child: Transform.rotate(
                angle: 4.7,
                child: Switch(
                  activeColor: Color(
                      0xFFFFD04E),
                  trackOutlineColor: WidgetStateProperty.all(Color(0xFFFFD04E)),
                  inactiveThumbColor: Colors.grey,
                  
                  inactiveTrackColor: Color(
                      0xFF3D3D3D),
                  activeTrackColor: Color(0xFF4F4F4F),
                  value: switchValue,
                  onChanged: (bool value) {
                    onToggle(value);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
