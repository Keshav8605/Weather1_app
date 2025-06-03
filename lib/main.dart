import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'weather_functions.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'weather_controller.dart';

void main() {
  Get.put(WeatherController());
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
    startLoadingProcess();
  }

  void startLoadingProcess() async {
    // Start both: data loading and minimum 5-second timer
    final dataFuture = loadweather();
    final timerFuture = Future.delayed(Duration(seconds: 5));

    // Wait for both to complete
    await Future.wait([dataFuture, timerFuture]);

    // Close loading screen only after both conditions are met
    setState(() {
      isloading = false;
    });
  }

  Future<void> loadweather() async {
    try {
      final data = await fetchWeather();
      if (data != null) {
        weatherdata = data;
      } else {
        error = 'Unable to fetch data!';
      }
    } catch (e) {
      error = 'Error: $e';
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isloading) {
      double size = MediaQuery.of(context).size.width * 0.95;
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Color(0xff081324),
          body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage('images/2.jpg'))),
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      backgroundColor: Colors.white24,
                      color: Colors.lightBlueAccent,
                    ),
                    SizedBox(height: size / 3),
                  ]),
            ),
          ),
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
