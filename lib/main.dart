import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'weather_functions.dart';
import 'package:geolocator/geolocator.dart';
import 'UV_indexchart.dart';
import 'package:http/http.dart';

import 'Details_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initstate() {
    super.initState();
    fetchWeather();
  }

  String url = '';
  fetchWeather() async {
    Position? position = await get_lat_long();
    if (position == null) return;
    double lat = position.latitude;
    double long = position.longitude;
    const apikey = '944699415e36a3b7ad16e9c46cb9997c';

    setState(() {
      url =
          'https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$long&exclude={part}&appid=$apikey';
    });
  }

  final uri = Uri.parse('url');
  //final response = http.get(uri);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DetailsScreen(), // Initial screen
    );
  }
}
