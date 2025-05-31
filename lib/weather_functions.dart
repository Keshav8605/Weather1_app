import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'package:http/http.dart';

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

fetchWeather() async {
  Position? position = await get_lat_long();
  if (position == null) return;
  double lat = position.latitude;
  double long = position.longitude;
  const apikey = '944699415e36a3b7ad16e9c46cb9997c';

  String url =
      'https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$long&exclude={part}&appid=$apikey';
}
