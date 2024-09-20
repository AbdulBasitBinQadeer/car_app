import 'package:car_app/Provider/countProvider.dart';
import 'package:car_app/Widgets/bottom_navigation_bar.dart';
import 'package:car_app/home_screen.dart';
import 'package:car_app/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Widgets/text_box.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  bool _isCarVisible = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 200), () {
      setState(() {
        _isCarVisible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.black,
            height: double.infinity,
            width: double.infinity,
          ),
          Positioned(
            top: -20,
            left: -300,
            child: Container(
                height: 600,
                width: 800,
                decoration: BoxDecoration(
                  // shape: BoxShape.circle,
                  borderRadius: BorderRadius.circular(100)
                ),
                child: Image(image: AssetImage('assest/Ellipse 1.png'),fit: BoxFit.cover,)),
          ),
          Positioned(
            bottom: -120,
            right: -110,
            child: Image(image: AssetImage('assest/Ellipse 1.png')),
          ),
          Positioned(
            left: 20,
            top: 50,
            child: Row(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                  },
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Porsche \n',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.white,
                          ),
                        ),
                        TextSpan(
                          text: '911 GT4',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                        TextSpan(
                          text: ' RS',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 17,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 25,
            top: 50,
            child: CircleAvatar(
              radius: 33,
              backgroundImage: AssetImage('assest/Ellipse 3.png'),
              child: Icon(
                Icons.notifications_active_outlined,
                size: 32,
              ),
            ),
          ),
          // Animated Positioned widget for car animation
          AnimatedPositioned(
            duration: Duration(seconds: 1),
            curve: Curves.easeInOut,
            top: _isCarVisible ? 65 : 100,  // Adjusts the initial and final vertical position
            left: _isCarVisible ? 10 : MediaQuery.of(context).size.width,  // Car slides from right
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ThirdScreen()));
              },
              child: Container(
                height: 400,
                width: 500,
                child: Image.asset('assest/image 4.png'),
              ),
            ),
          ),
          Positioned(
            left: 20,
            top: 400,
            child: Row(
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Controls \n',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 460,
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Column(
                    children: [
                      SwitchContainer(
                        title: "Engine ",
                        subtitle: context.watch<Countprovider>().isEngineStarted
                            ? "Started"
                            : "Stopped",
                        switchValue:
                        context.watch<Countprovider>().isEngineStarted,
                        onToggle: context.read<Countprovider>().toggleEngine,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SwitchContainer(
                        title: "Doors   ",
                        subtitle: context.watch<Countprovider>().areDoorsClosed
                            ? "Closed"
                            : "Opened",
                        switchValue:
                        context.watch<Countprovider>().areDoorsClosed,
                        onToggle: context.read<Countprovider>().toggleDoors,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      SwitchContainer(
                        title: "Trunk   ",
                        subtitle: context.watch<Countprovider>().isTrunkClosed
                            ? "Closed"
                            : "Opened",
                        switchValue:
                        context.watch<Countprovider>().isTrunkClosed,
                        onToggle: context.read<Countprovider>().toggleTrunk,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SwitchContainer(
                        title: "Climate",
                        subtitle: context.watch<Countprovider>().isClimateOn
                            ? "ON"
                            : "OFF",
                        switchValue: context.watch<Countprovider>().isClimateOn,
                        onToggle: context.read<Countprovider>().toggleClimate,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: BottomNavigationBarWithRoundedCorners(), // Second instance
          ),
        ],
      ),
    );
  }
}
