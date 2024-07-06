import 'package:flutter/material.dart';

import 'package:weather_api/screens/weatherScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      home: WeatherScreen(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          centerTitle: true, 
          color: const Color.fromARGB(255, 209, 156, 219), 
        ),
      ),
    );
  }
}