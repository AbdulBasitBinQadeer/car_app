import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  bool _carInPosition = false; // Boolean to control the animation state

  @override
  void initState() {
    super.initState();
    // Delay to trigger the animation once the screen is built
    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {
        _carInPosition = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'GPS Navigator',
          style: TextStyle(
              color: Color(0xFFFFD04E),
              fontSize: 28,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Color(0xFFFFD04E),
              size: 28,
            )),
      ),
      body: Stack(children: [
        FlutterMap(
          options: MapOptions(),
          children: [
            TileLayer(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c'],
            ),
          ],
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: carDetailsCard(_carInPosition),
        ),
      ]),
    );
  }
}

Widget carDetailsCard(bool carInPosition) {
  return SizedBox(
    height: 350,
    child: Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
            boxShadow: [
              BoxShadow(color: Colors.black, spreadRadius: 0, blurRadius: 10),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text(
                'Porsche',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Icon(Icons.directions_car, color: Colors.white, size: 20),
                  SizedBox(width: 5),
                  Text(
                    '320.0 km/h',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.battery_full, color: Colors.white, size: 20),
                  SizedBox(width: 5),
                  Text(
                    '80%',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Color(0xFFFFD04E),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    "Features",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                featureIcons(),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '',
                      style:
                      TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black),
                      child: Text('Ready to Start',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        // Animated car position
        AnimatedPositioned(
          duration: Duration(seconds: 1), // Duration of the animation
          curve: Curves.easeInOut,
          right: carInPosition ? 1 : -300, // Moves the car from right to the position
          top: 5,
          child: Image(
            height: 140,
            image: AssetImage('assest/ohoo.png'),
          ),
        ),
      ],
    ),
  );
}

Widget featureIcons() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      featureIcon(Icons.local_gas_station, 'Diesel', 'Common Rail'),
      featureIcon(Icons.speed, 'Acceleration', '0 - 100km/s'),
      featureIcon(Icons.ac_unit, 'Cold', 'Temp Control'),
    ],
  );
}

Widget featureIcon(IconData icon, String title, String subtitle) {
  return Container(
    width: 100,
    height: 100,
    padding: EdgeInsets.all(5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.black, width: 1),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center, // Center the content vertically
      children: [
        Icon(icon, size: 28),
        Text(title),
        Text(
          subtitle,
          style: TextStyle(color: Colors.black, fontSize: 10),
        ),
      ],
    ),
  );
}
