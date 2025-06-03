import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/functions_uses.dart';
import 'package:weather_app/weather_functions.dart';
import 'Details_Screen.dart';
import 'colors_.dart';
import 'drawer_selfmade.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:http/http.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'weather_controller.dart';

class Homescreen extends StatefulWidget {
  final Map<String, dynamic>? weatherData;
  const Homescreen({super.key, this.weatherData});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  void initState() {
    super.initState();
    loadcityname();
  }

  String currentlocation = '';
  Future<String> getCityName(double lat, double lon) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, lon);

      if (placemarks.isNotEmpty) {
        final Placemark place = placemarks.first;
        String city = place.locality ?? 'Unknown City';
        String country = place.country ?? 'Unknown Country';
        return '$city,$country';
      } else {
        return 'Unknown City';
      }
    } catch (e) {
      print("Error in getCityName: $e");
      return 'Error getting location';
    }
  }

  void loadcityname() async {
    String city = await getCityName(
      widget.weatherData!['latitude'].toDouble(),
      widget.weatherData!['longitude'].toDouble(),
    );
    setState(() {
      currentlocation = city;
    });
  }

  @override
  Widget build(BuildContext context) {
    Future<String> getCityName(double lat, double lon) async {
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, lon);
      if (placemarks.isNotEmpty) {
        final place = placemarks[0];
        return '${place.locality}, ${place.administrativeArea}';
      }
      return 'Unknown location';
    }

    String taarikdata(int epochcode) {
      return DateFormat('d MMM, yyyy')
          .format(DateTime.fromMillisecondsSinceEpoch(epochcode * 1000));
    }

    String taarikdatawithoutyr(int epochcode) {
      return DateFormat('d MMM')
          .format(DateTime.fromMillisecondsSinceEpoch(epochcode * 1000));
    }

    String timedata(int epochcode) {
      return DateFormat('hh:mm a')
          .format(DateTime.fromMillisecondsSinceEpoch(epochcode * 1000));
    }

    String getDayFromEpoch(int epoch) {
      DateTime date = DateTime.fromMillisecondsSinceEpoch(epoch * 1000);
      return DateFormat('EEEE').format(date);
    }

    Map<String, String> getweathericon = {
      'clear': 'assets/animations/clearsun.json',
      'cloud': 'assets/animations/clodysuncoming.json',
      'default': 'assets/animations/Animation - 1743775948554.json',
      'clear*': 'assets/animations/whiteclouds.json',
      'cloud*': 'assets/animations/whiteclouds.json',
      'default*': 'assets/animations/Animation - 1743712287353 (1).json',
    };

    String? getlottiefile(String condition, bool main) {
      final lowercaseCondition = condition.toLowerCase();

      if (lowercaseCondition.contains('cloud')) {
        return getweathericon[main ? 'cloud*' : 'cloud'];
      } else if (lowercaseCondition.contains('clear') ||
          lowercaseCondition.contains('sun')) {
        return getweathericon[main ? 'clear*' : 'clear'];
      } else {
        return getweathericon[main ? 'default*' : 'default'];
      }
    }

    String convertTo12HourFormat(String time24) {
      List<String> parts = time24.split(':');
      if (parts.length < 2) return time24; // invalid format fallback

      int hour = int.tryParse(parts[0]) ?? 0;
      int minute = int.tryParse(parts[1]) ?? 0;

      String period = (hour >= 12) ? "PM" : "AM";

      int hour12 = hour % 12;
      if (hour12 == 0) hour12 = 12;

      String minuteStr = minute.toString().padLeft(2, '0');

      return "$hour12:$minuteStr $period";
    }

    final current = widget.weatherData!['days'][0];
    int epochcode = current['datetimeEpoch'];
    String todaysdate = current['datetime'];
    String currentdate = taarikdata(epochcode);
    String currenttime = timedata(epochcode);
    String currenttemp = current['temp'].toString();
    String currentWCname = current['conditions'];
    String currentwindspeed = current['windspeed'].toString();
    String currenthumidity = current['humidity'].toString();
    String curruvindex = current['uvindex'].toString();
    String currvisibility = current['visibility'].toString();
    String sunrise = current['sunrise'].toString();
    String sunset = current['sunset'].toString();
    String sunrisetime = convertTo12HourFormat(sunrise);
    String sunsettime = convertTo12HourFormat(sunset);

    //data controller mein insert kro

    final WeatherController weatherController = Get.find<WeatherController>();
    weatherController.setEpochCode(epochcode);
    weatherController.setTodaysDate(todaysdate);
    weatherController.setCurrentDate(currentdate);
    weatherController.setCurrentTime(currenttime);
    weatherController.setCurrentTemp(currenttemp);
    weatherController.setCurrentWCName(currentWCname);
    weatherController.setCurrentWindSpeed(currentwindspeed);
    weatherController.setCurrentHumidity(currenthumidity);
    weatherController.setCurrentUvIndex(curruvindex);
    weatherController.setCurrentVisibility(currvisibility);
    weatherController.setSunrise(sunrise);
    weatherController.setSunset(sunset);
    weatherController.setcurrentlocation(currentlocation);

    final datas = widget.weatherData!['days'];
    List<Map<String, String>> a = [
      {
        'temp': datas[0]['temp'].toString(),
        'date': taarikdatawithoutyr(datas[0]['datetimeEpoch']),
        'day': getDayFromEpoch(datas[0]['datetimeEpoch']),
        'icon': 'images/sunny_icon.png',
      },
      {
        'temp': datas[1]['temp'].toString(),
        'date': taarikdatawithoutyr(datas[1]['datetimeEpoch']),
        'day': getDayFromEpoch(datas[1]['datetimeEpoch']),
        'icon': 'images/sunny_icon.png',
      },
      {
        'temp': datas[2]['temp'].toString(),
        'date': taarikdatawithoutyr(datas[2]['datetimeEpoch']),
        'day': getDayFromEpoch(datas[2]['datetimeEpoch']),
        'icon': 'images/sunny_icon.png',
      },
      {
        'temp': datas[3]['temp'].toString(),
        'date': taarikdatawithoutyr(datas[3]['datetimeEpoch']),
        'day': getDayFromEpoch(datas[3]['datetimeEpoch']),
        'icon': 'images/sunny_icon.png',
      },
      {
        'temp': datas[4]['temp'].toString(),
        'date': taarikdatawithoutyr(datas[4]['datetimeEpoch']),
        'day': getDayFromEpoch(datas[4]['datetimeEpoch']),
        'icon': 'images/sunny_icon.png',
      },
      {
        'temp': datas[5]['temp'].toString(),
        'date': taarikdatawithoutyr(datas[5]['datetimeEpoch']),
        'day': getDayFromEpoch(datas[5]['datetimeEpoch']),
        'icon': 'images/sunny_icon.png',
      },
      {
        'temp': datas[6]['temp'].toString(),
        'date': taarikdatawithoutyr(datas[6]['datetimeEpoch']),
        'day': getDayFromEpoch(datas[6]['datetimeEpoch']),
        'icon': 'images/sunny_icon.png',
      },
    ];

    double size = MediaQuery.of(context).size.width * 0.95;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              Image(
                image: AssetImage('images/applogo.png'),
                width: size / 20,
              ),
              SizedBox(
                width: size / 80,
              ),
              Text(
                'drizzle',
                style: heading_(fontWeight: FontWeight.w900),
              ),
            ],
          ),
          CircleAvatar(
            radius: size / 16,
            backgroundColor: Colors.white12,
            child: Icon(
              size: size / 15,
              Icons.search,
              color: Colors.white,
            ),
          ),
        ]),
        backgroundColor: Color(0xFF071324),
      ),
      drawer: PremiumDrawer(),
      backgroundColor: Color(0XFF000F18),
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
              color: Color(0XFF000F18),
              image: DecorationImage(
                  opacity: 0.35,
                  fit: BoxFit.cover,
                  image: AssetImage(
                      'images/twillight-sky-blurred-background-ai-generated-photo (1).jpg'))),
        ),
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                mspacer(),
                Text(
                  textAlign: TextAlign.start,
                  'Today\'s Forecast',
                  style: subheading_(),
                ),
                mspacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailsScreen()),
                    );
                  },
                  child: main_container(
                    backgroundlottie: getlottiefile(currentWCname, true),
                    mainlottie: getlottiefile(currentWCname, false),
                    currentlocation: currentlocation,
                    currenttemp: currenttemp,
                    context: context,
                    currentdate: currentdate,
                    currenttime: currenttime,
                    currentWCname: currentWCname,
                  ),
                ),
                mspacer(),
                mspacer(height: size / 20),
                Text(
                  textAlign: TextAlign.start,
                  '7 day\'s Forecast',
                  style: subheading_(),
                ),
                mspacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailsScreen()));
                  },
                  child: main_container2(
                    context: context,
                    Map_name: a,
                  ),
                ),
                mspacer(),
                Text(
                  textAlign: TextAlign.start,
                  'Today\'s Highlight',
                  style: subheading_(),
                ),
                mspacer(),
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailsScreen()));
                        },
                        child: sub_conatiner(
                          context: context,
                          upcont: 'Wind Status',
                          lowcont: 'Humidity',
                        ),
                      ),
                      mspacer(width: 15),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailsScreen()));
                        },
                        child: sub_conatiner(
                            upcont: 'UV Index',
                            lowcont: 'Visibility',
                            context: context),
                      ),
                      mspacer(width: 15),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailsScreen()));
                        },
                        child: sub_conatiner(
                          upcont: 'Sunrise & Sunset',
                          lowcont: 'Feels like',
                          context: context,
                        ),
                      ),
                    ],
                  ),
                ),
                mspacer(height: 40)
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
