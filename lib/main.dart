import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'weather_functions.dart'; // Your fetchWeather()
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, dynamic>? weatherdata;
  bool isloading = true;
  String? error;

  @override
  void initState() {
    super.initState();
    loadweather(); // call async function here
  }

  Future<void> loadweather() async {
    try {
      final data = await fetchWeather();
      if (data != null) {
        setState(() {
          weatherdata = data;
          isloading = false;
        });
      } else {
        setState(() {
          error = 'Unable to fetch data!';
          isloading = false;
        });
      }
    } catch (e) {
      setState(() {
        error = 'Error: $e';
        isloading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isloading) {
      return const MaterialApp(
        home: Scaffold(
          body: Center(child: CircularProgressIndicator()),
        ),
      );
    }

    if (error != null) {
      return MaterialApp(
        home: Scaffold(
          body: Center(child: Text(error!)),
        ),
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homescreen(
          weatherData:
          weatherdata), // pass weatherData if Homescreen expects it
    );
  }
}
