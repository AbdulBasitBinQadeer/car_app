import 'package:car_app/second_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLocked = true;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            color: Color(0xFF212121),
            height: double.infinity,
            width: double.infinity,
          ),
          Positioned(
              top: 55,
               left: 5,
              child: Container(
                  height: 500,
                  width: 400,
                  child: Image(image: AssetImage('assest/911.jpg')))),
          Positioned(
            left: 20,
            top: 70,
            child: Row(
              children: [
                RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: 'TAKE \n',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 48,
                              color: Colors.white)),
                      TextSpan(
                          text: 'The',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 48,
                              color: Colors.white)),
                      TextSpan(
                          text: ' Control',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 48,
                              color: Color(0xFFFFD04E)))
                    ])),
              ],
            ),
          ),

          // The car image (image 3.png) now wrapped inside AnimatedPositioned for animation
          AnimatedPositioned(
            duration: Duration(seconds: 2),
            curve: Curves.easeInOut,
            bottom: isLocked ? -60 : height,  // Move out of the screen when unlocked
            left: 50,
            child: Image(image: AssetImage('assest/image 3.png')),
          ),

          // Other static images
          Positioned(
              bottom: -90,
              child: Image(image: AssetImage('assest/Rectangle 1.png'))),

          Positioned(
            bottom: 75,
            left: 160,
            child: CircleAvatar(
              radius: 45,
              backgroundImage: AssetImage('assest/Ellipse 3.png'),
              child: IconButton(
                iconSize: 60,
                icon: Icon(
                  isLocked ? Icons.lock : Icons.lock_open,
                ),
                onPressed: () {
                  setState(() {
                    isLocked = !isLocked;  // Toggle the state to unlock
                  });

                  if (!isLocked) {
                    // Delay navigation by 5 seconds to allow the animation to complete
                    Future.delayed(Duration(seconds: 2), () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SecondScreen()),
                      );
                    });
                  }
                },
              ),
            ),
          ),

          Positioned(
            bottom: 30,
            left: 103,
            child: Text('Tap To Unlock Car',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
