import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;

Future<Position?> get_lat_long() async {
  bool service = await Geolocator.isLocationServiceEnabled();
  LocationPermission permission;

  if (!service) {
    Fluttertoast.showToast(msg: 'Service is diabled');
    return null;
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      Fluttertoast.showToast(msg: 'Permission denied');
      return null;
    }
  }
  Position currpositon = await Geolocator.getCurrentPosition();

  return currpositon;
}

Future<Map<String, dynamic>?> fetchWeather() async {
  Position? position = await get_lat_long();
  if (position == null) return null;
  double lat = position.latitude;
  double long = position.longitude;
  const apikey = 'JGWM8ZX7DJBH53T3D5VPXX6W5';

  String url =
      'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/$lat,$long/next7days?unitGroup=metric&include=hours&key=$apikey&contentType=json';
  final uri = Uri.parse(url);
  final response = await http.get(uri);
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    print("API Call Success ✅");
    return data;
  }
  return null;
}
