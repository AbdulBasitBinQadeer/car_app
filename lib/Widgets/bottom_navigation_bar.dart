import 'package:car_app/map_screen.dart';
import 'package:car_app/profile_screen.dart';
import 'package:car_app/weather_screen.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarWithRoundedCorners extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(),
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30.0),
        ),
        child: Container(
          height: 80,
          width: 420,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFB99530), Colors.black12, Colors.black12],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('assest/Ellipse 3.png'),
                    child: Image.asset('assest/car.png')),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileScreen()));
                  },
                  child: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('assest/Ellipse 5.png'),
                      child: Image.asset('assest/user (1).png')),
                ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MapScreen()));
              },
              child: CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('assest/Ellipse 5.png'),
                    child: Image.asset('assest/gps.png')),
            ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WeatherScreen()));
                  },
                  child: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('assest/Ellipse 5.png'),
                      child: Image.asset('assest/cloudy.png')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
