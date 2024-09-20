import 'package:car_app/Provider/countProvider.dart';
import 'package:car_app/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create:(_) => Countprovider(),
    child: MaterialApp(
      title: 'Car App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,

      ),
      debugShowCheckedModeBanner: false,
      home:HomeScreen(),

    ),
    );
  }
}
