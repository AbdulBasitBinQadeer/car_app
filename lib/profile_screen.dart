import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 220,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFD04E),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                ),
                Positioned(
                  left: 15,
                  top: 50,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                      size: 28,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage("assest/OIP.png"),
                        radius: 60,
                      ),
                      SizedBox(height: 30),
                      Text(
                        "Abdul Basit",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildIcon(context, Icons.email, Colors.purple, 'Email dialog'),
                          _buildIcon(context, Icons.phone, Colors.green, 'Phone dialog'),
                          _buildIcon(context, Icons.favorite, Colors.red, 'Favorite dialog'),
                          _buildIcon(context, Icons.message, Colors.blue, 'Message dialog'),
                        ],
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "About me",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "I'm a proficient Flutter developer with deep expertise in creating high-performance mobile apps. I specialize in both UI design and backend integration, ensuring seamless user experiences.",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              "Upcoming events",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            _buildEventCard("29 May", "My Birthday", "All Day"),
                            _buildEventCard(
                                "9 Nov", "Meeting with Client", "8:00pm - 9:00pm"),
                            _buildEventCard(
                                "17 Nov", "Order Deliver", "10:00pm - 12:00am"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(BuildContext context, IconData icon, Color color, String dialogType) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () {
          if (dialogType == 'Phone dialog') {
            _showPhoneDialog(context);
          } else if (dialogType == 'Message dialog') {
            _showMessageDialog(context);
          } else if (dialogType == 'Favorite dialog') {
            _showFavoriteDialog(context);
          }else if (dialogType == 'Email dialog') {
            _showEmailDialog(context);
          }
        },
        child: CircleAvatar(
          radius: 20,
          backgroundColor: Color(0xFFFFD04E),
          child: Icon(icon, color: color),
        ),
      ),
    );
  }

  void _showPhoneDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0xFFFFD04E),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text('Contact Number', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          content: Text(
            '+923264217277', // Your phone number here
            style: TextStyle(fontSize: 18, color: Colors.red, fontWeight: FontWeight.bold),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
              child: Text('Cancel', style: TextStyle(fontSize: 18, color: Colors.black)),
            ),
          ],
        );
      },
    );
  }

  void _showMessageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0xFFFFD04E),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text('Message', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          content: Text(
            'Feel free to send me a message anytime!',
            style: TextStyle(fontSize: 18, color: Colors.red, fontWeight: FontWeight.bold),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
              child: Text('Close', style: TextStyle(fontSize: 18, color: Colors.black)),
            ),
          ],
        );
      },
    );
  }

  void _showFavoriteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0xFFFFD04E),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text('Favorites', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          content: Text(
            'You have no favorites yet.',
            style: TextStyle(fontSize: 18, color: Colors.red, fontWeight: FontWeight.bold),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
              child: Text('Close', style: TextStyle(fontSize: 18, color: Colors.black)),
            ),
          ],
        );
      },
    );
  }
  void _showEmailDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0xFFFFD04E),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text('Email', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          content: Text(
            'You can reach me at: abdulbasitbinq@gmail.com.',
            style: TextStyle(fontSize: 18, color: Colors.red, fontWeight: FontWeight.bold),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
              child: Text('Close', style: TextStyle(fontSize: 18, color: Colors.black)),
            ),
          ],
        );
      },
    );
  }

  Widget _buildEventCard(String date, String title, String time) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFFFD04E),
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Column(
                    children: [
                      Text(
                        date.split(" ")[0],
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        date.split(" ")[1],
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  time,
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
