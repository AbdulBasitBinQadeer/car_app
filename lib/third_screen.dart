import 'package:car_app/second_screen.dart';
import 'package:flutter/material.dart';
import 'Widgets/iconwid.dart';
import 'Widgets/bottom_navigation_bar.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  bool _isCarExpanded = false;

  @override
  void initState() {
    super.initState();

    // Trigger the animation after a slight delay
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        _isCarExpanded = true; // Set the car to expand on load
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
            left: 20,
            top: 50,
            child: Row(
              children: [
                RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: 'Porsche \n',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                              color: Colors.white)),
                      TextSpan(
                          text: '911 GT4',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                              color: Colors.white)),
                      TextSpan(
                          text: ' RS',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              color: Colors.white))
                    ])),
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
                )),
          ),
          // Car image with animation
          Positioned(
            top: 120,
            child: TweenAnimationBuilder<double>(
              tween: Tween<double>(
                  begin: 0.5, end: _isCarExpanded ? 1.0 : 0.5), // Animation from small to normal size
              duration: Duration(seconds: 1),
              builder: (context, scale, child) {
                return Transform.scale(
                  scale: scale, // Scaling the car image
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen()));
                      },
                      child: Image(
                        image: AssetImage('assest/ohoo.png'),
                      )),
                );
              },
            ),
          ),
          Positioned(
            left: 20,
            top: 375,
            child: Row(
              children: [
                RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: 'Status \n',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                              color: Colors.white)),
                    ])),
              ],
            ),
          ),
          Positioned(
            bottom: 110,
            left: 30,
            child: Container(
              height: 330,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white),
                color: Colors.black,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // Shadow color with transparency
                    spreadRadius: 5, // Spread radius for shadow
                    blurRadius: 10, // Softness of the shadow
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 20, bottom: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomColumnWidget(
                          icon: Icons.add_road_rounded,
                          title: 'Traveled',
                          subtitle: '13574KM',
                        ),
                        CustomColumnWidget(
                          icon: Icons.battery_3_bar_sharp,
                          title: 'Battery',
                          subtitle: 'Normal',
                        ),
                        CustomColumnWidget(
                          icon: Icons.oil_barrel,
                          title: 'Oil Change',
                          subtitle: '200 days',
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: VerticalDivider(
                      color: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30, top: 20, bottom: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomColumnWidget(
                          icon: Icons.hot_tub_sharp,
                          title: 'Temperature',
                          subtitle: '25`C',
                        ),
                        CustomColumnWidget(
                          icon: Icons.local_gas_station_outlined,
                          title: 'Gas',
                          subtitle: '322 Km',
                        ),
                        CustomColumnWidget(
                          icon: Icons.hot_tub_rounded,
                          title: 'Coolant level',
                          subtitle: 'Normal',
                        ),
                      ],
                    ),
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
