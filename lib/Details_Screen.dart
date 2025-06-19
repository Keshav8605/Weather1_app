import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/colors_.dart';
import 'package:weather_app/functions_uses.dart';
import 'UV_indexchart.dart';
import 'package:weather_app/Wind_speedchart.dart';
import 'weather_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailsScreen extends StatefulWidget {
  final bool shouldscroll;
  final double scrollby;
  const DetailsScreen(
      {super.key, this.shouldscroll = false, this.scrollby = 0});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();

    if (widget.shouldscroll) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollController.animateTo(
          widget.scrollby,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      });
    }

    @override
    void dispose() {
      _scrollController.dispose();
      super.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<WeatherController>();
    int a = 0;

    final data = controller.weatherData;
    final currentdaydata = data['days'][0];
    final daysdata = data['days'];

    String geticon(
      final daysdata,
      int index,
    ) {
      String wc =
          daysdata[0]['hours'][index]['conditions'].toString().toLowerCase();

      if (wc.contains('rain') || wc.contains('overcast')) {
        return 'images/rainicon.png';
      } else if (wc.contains('cloud')) {
        return 'images/cloudyicon.png';
      } else {
        return 'images/sunnyicon.png';
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

    String geticonforweek(
      final daysdata,
      int index,
    ) {
      String wc = daysdata[index]['conditions'].toString().toLowerCase();

      if (wc.contains('rain') || wc.contains('overcast')) {
        return 'images/rainicon.png';
      } else if (wc.contains('cloud')) {
        return 'images/cloudyicon.png';
      } else {
        return 'images/sunnyicon.png';
      }
    }

    String getDayDuration(String sunrise, String sunset) {
      final sunriseTime = DateTime.parse('2000-01-01T$sunrise');
      final sunsetTime = DateTime.parse('2000-01-01T$sunset');

      final duration = sunsetTime.difference(sunriseTime);

      final hours = duration.inHours;
      final minutes = duration.inMinutes.remainder(60);

      return '${hours}h ${minutes}m';
    }

    String risklevelfunc(String uvindex) {
      double a = double.parse(uvindex);
      if (a <= 2) {
        return "Low";
      } else if (a <= 5) {
        return "Moderate";
      } else if (a <= 7) {
        return "High";
      } else if (a <= 10) {
        return "Very High";
      } else {
        return "Extreme";
      }
    }

    String windDirectionFromDegrees(double degrees) {
      // Normalize degrees to 0-360
      degrees = degrees % 360;

      if (degrees >= 337.5 || degrees < 22.5) {
        return "N";
      } else if (degrees >= 22.5 && degrees < 67.5) {
        return "NE";
      } else if (degrees >= 67.5 && degrees < 112.5) {
        return "E";
      } else if (degrees >= 112.5 && degrees < 157.5) {
        return "SE";
      } else if (degrees >= 157.5 && degrees < 202.5) {
        return "S";
      } else if (degrees >= 202.5 && degrees < 247.5) {
        return "SW";
      } else if (degrees >= 247.5 && degrees < 292.5) {
        return "W";
      } else if (degrees >= 292.5 && degrees < 337.5) {
        return "NW";
      } else {
        return "Unknown";
      }
    }

    String location = controller.getcurrentlocation.toString().toUpperCase();
    String date = controller.getCurrentDate.toString();
    String temp = controller.getCurrentTemp.toString();
    String condition = controller.getCurrentWCName.toString();
    String windspeed = controller.getCurrentWindSpeed.toString();
    String winddirection = controller.data['days'][0]['winddir'].toString();
    double winddirectiondegrees = double.parse(winddirection);
    String winddirectionname = windDirectionFromDegrees(winddirectiondegrees);
    String sunrise = controller.sunrise.toString();
    String sunset = controller.sunset.toString();
    //String dayduration = getDayDuration(sunrise, sunset).toString();
    String uvindex = controller.getCurrentUvIndex.toString();
    String risklevel = risklevelfunc(uvindex).toString();
    int epochcode = controller.epochCode.toInt();

    String getDayFromEpoch(int epoch) {
      DateTime date = DateTime.fromMillisecondsSinceEpoch(epoch * 1000);
      return DateFormat('EEEE').format(date);
    }

    double size = MediaQuery.of(context).size.width * 0.95;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFF000F18),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      opacity: 0.35,
                      fit: BoxFit.cover,
                      image: AssetImage(
                          'images/twillight-sky-blurred-background-ai-generated-photo (1).jpg'))),
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      mspacer(height: size / 5),
                      Builder(
                        builder: (context) => GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: Icon(
                            Icons.arrow_back_ios_new_outlined,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                  Text(location, style: heading_(fontSize: size / 25)),
                  mspacer(),
                  Text(
                    'TODAY $date',
                    style: TextStyle(
                        fontSize: size / 27, color: Color(0XFFA3A3A3)),
                  ),
                  mspacer(height: size / 13),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        temp,
                        style: heading_(
                          fontSize: MediaQuery.of(context).size.width * 0.15,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width *
                              0.03, // adjust top padding
                        ),
                        child: Text(
                          '°C',
                          style: heading_(
                            fontSize: MediaQuery.of(context).size.width *
                                0.06, // smaller font
                          ),
                        ),
                      ),
                    ],
                  ),
                  mspacer(height: size / 13),
                  Text(condition.toUpperCase(),
                      style: heading_(
                          fontWeight: FontWeight.bold, fontSize: size / 25)),
                  mspacer(height: size / 20),
                  Image(
                    image: AssetImage(geticonforweek(daysdata, 0)),
                    width: size / 3,
                  ),
                  mspacer(height: size / 20),
                  Container(
                    padding: EdgeInsets.all(size / 35),
                    width: size,
                    height: size / 1.18,
                    decoration: BoxDecoration(
                        color: Color(0XFFBABABA).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(size / 13)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('HOURLY FORECAST',
                            style: heading_(
                                fontSize: size / 25,
                                fontWeight: FontWeight.w100)),
                        mspacer(height: 5),
                        SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              hourly_forecastcont(
                                context: context,
                                temp: currentdaydata['hours'][a]['temp']
                                    .toString(),
                                conditionname: currentdaydata['hours'][a]
                                    ['conditions'],
                                time: currentdaydata['hours'][a]['datetime']
                                    .toString()
                                    .substring(0, 5),
                                icon: geticon(daysdata, 0),
                              ),
                              hourly_forecastcont(
                                context: context,
                                temp: currentdaydata['hours'][a + 1]['temp']
                                    .toString(),
                                conditionname: currentdaydata['hours'][a + 1]
                                    ['conditions'],
                                time: currentdaydata['hours'][a + 1]['datetime']
                                    .toString()
                                    .substring(0, 5),
                                icon: geticon(daysdata, 1),
                              ),
                              hourly_forecastcont(
                                context: context,
                                temp: currentdaydata['hours'][a + 2]['temp']
                                    .toString(),
                                conditionname: currentdaydata['hours'][a + 2]
                                    ['conditions'],
                                time: currentdaydata['hours'][a + 2]['datetime']
                                    .toString()
                                    .substring(0, 5),
                                icon: geticon(daysdata, 2),
                              ),
                              hourly_forecastcont(
                                context: context,
                                temp: currentdaydata['hours'][a + 3]['temp']
                                    .toString(),
                                conditionname: currentdaydata['hours'][a + 3]
                                    ['conditions'],
                                time: currentdaydata['hours'][a + 3]['datetime']
                                    .toString()
                                    .substring(0, 5),
                                icon: geticon(daysdata, 3),
                              ),
                              hourly_forecastcont(
                                context: context,
                                temp: currentdaydata['hours'][a + 4]['temp']
                                    .toString(),
                                conditionname: currentdaydata['hours'][a + 4]
                                    ['conditions'],
                                time: currentdaydata['hours'][a + 4]['datetime']
                                    .toString()
                                    .substring(0, 5),
                                icon: geticon(daysdata, 4),
                              ),
                              hourly_forecastcont(
                                context: context,
                                temp: currentdaydata['hours'][a + 5]['temp']
                                    .toString(),
                                conditionname: currentdaydata['hours'][a + 5]
                                    ['conditions'],
                                time: currentdaydata['hours'][a + 5]['datetime']
                                    .toString()
                                    .substring(0, 5),
                                icon: geticon(daysdata, 5),
                              ),
                              hourly_forecastcont(
                                context: context,
                                temp: currentdaydata['hours'][a + 6]['temp']
                                    .toString(),
                                conditionname: currentdaydata['hours'][a + 6]
                                    ['conditions'],
                                time: currentdaydata['hours'][a + 6]['datetime']
                                    .toString()
                                    .substring(0, 5),
                                icon: geticon(daysdata, 6),
                              ),
                              hourly_forecastcont(
                                context: context,
                                temp: currentdaydata['hours'][a + 7]['temp']
                                    .toString(),
                                conditionname: currentdaydata['hours'][a + 7]
                                    ['conditions'],
                                time: currentdaydata['hours'][a + 7]['datetime']
                                    .toString()
                                    .substring(0, 5),
                                icon: geticon(daysdata, 7),
                              ),
                              hourly_forecastcont(
                                context: context,
                                temp: currentdaydata['hours'][a + 8]['temp']
                                    .toString(),
                                conditionname: currentdaydata['hours'][a + 8]
                                    ['conditions'],
                                time: currentdaydata['hours'][a + 8]['datetime']
                                    .toString()
                                    .substring(0, 5),
                                icon: geticon(daysdata, 8),
                              ),
                              hourly_forecastcont(
                                context: context,
                                temp: currentdaydata['hours'][a + 9]['temp']
                                    .toString(),
                                conditionname: currentdaydata['hours'][a + 9]
                                    ['conditions'],
                                time: currentdaydata['hours'][a + 9]['datetime']
                                    .toString()
                                    .substring(0, 5),
                                icon: geticon(daysdata, 9),
                              ),
                              hourly_forecastcont(
                                context: context,
                                temp: currentdaydata['hours'][a + 10]['temp']
                                    .toString(),
                                conditionname: currentdaydata['hours'][a + 10]
                                    ['conditions'],
                                time: currentdaydata['hours'][a + 10]
                                        ['datetime']
                                    .toString()
                                    .substring(0, 5),
                                icon: geticon(daysdata, 10),
                              ),
                              hourly_forecastcont(
                                context: context,
                                temp: currentdaydata['hours'][a + 11]['temp']
                                    .toString(),
                                conditionname: currentdaydata['hours'][a + 11]
                                    ['conditions'],
                                time: currentdaydata['hours'][a + 11]
                                        ['datetime']
                                    .toString()
                                    .substring(0, 5),
                                icon: geticon(daysdata, 11),
                              ),
                              hourly_forecastcont(
                                context: context,
                                temp: currentdaydata['hours'][a + 12]['temp']
                                    .toString(),
                                conditionname: currentdaydata['hours'][a + 12]
                                    ['conditions'],
                                time: currentdaydata['hours'][a + 12]
                                        ['datetime']
                                    .toString()
                                    .substring(0, 5),
                                icon: geticon(daysdata, 12),
                              ),
                              hourly_forecastcont(
                                context: context,
                                temp: currentdaydata['hours'][a + 13]['temp']
                                    .toString(),
                                conditionname: currentdaydata['hours'][a + 13]
                                    ['conditions'],
                                time: currentdaydata['hours'][a + 13]
                                        ['datetime']
                                    .toString()
                                    .substring(0, 5),
                                icon: geticon(daysdata, 13),
                              ),
                              hourly_forecastcont(
                                context: context,
                                temp: currentdaydata['hours'][a + 14]['temp']
                                    .toString(),
                                conditionname: currentdaydata['hours'][a + 14]
                                    ['conditions'],
                                time: currentdaydata['hours'][a + 14]
                                        ['datetime']
                                    .toString()
                                    .substring(0, 5),
                                icon: geticon(daysdata, 14),
                              ),
                              hourly_forecastcont(
                                context: context,
                                temp: currentdaydata['hours'][a + 15]['temp']
                                    .toString(),
                                conditionname: currentdaydata['hours'][a + 15]
                                    ['conditions'],
                                time: currentdaydata['hours'][a + 15]
                                        ['datetime']
                                    .toString()
                                    .substring(0, 5),
                                icon: geticon(daysdata, 15),
                              ),
                              hourly_forecastcont(
                                context: context,
                                temp: currentdaydata['hours'][a + 16]['temp']
                                    .toString(),
                                conditionname: currentdaydata['hours'][a + 16]
                                    ['conditions'],
                                time: currentdaydata['hours'][a + 16]
                                        ['datetime']
                                    .toString()
                                    .substring(0, 5),
                                icon: geticon(daysdata, 16),
                              ),
                              hourly_forecastcont(
                                context: context,
                                temp: currentdaydata['hours'][a + 17]['temp']
                                    .toString(),
                                conditionname: currentdaydata['hours'][a + 17]
                                    ['conditions'],
                                time: currentdaydata['hours'][a + 17]
                                        ['datetime']
                                    .toString()
                                    .substring(0, 5),
                                icon: geticon(daysdata, 17),
                              ),
                              hourly_forecastcont(
                                context: context,
                                temp: currentdaydata['hours'][a + 18]['temp']
                                    .toString(),
                                conditionname: currentdaydata['hours'][a + 18]
                                    ['conditions'],
                                time: currentdaydata['hours'][a + 18]
                                        ['datetime']
                                    .toString()
                                    .substring(0, 5),
                                icon: geticon(daysdata, 18),
                              ),
                              hourly_forecastcont(
                                context: context,
                                temp: currentdaydata['hours'][a + 19]['temp']
                                    .toString(),
                                conditionname: currentdaydata['hours'][a + 19]
                                    ['conditions'],
                                time: currentdaydata['hours'][a + 19]
                                        ['datetime']
                                    .toString()
                                    .substring(0, 5),
                                icon: geticon(daysdata, 19),
                              ),
                              hourly_forecastcont(
                                context: context,
                                temp: currentdaydata['hours'][a + 20]['temp']
                                    .toString(),
                                conditionname: currentdaydata['hours'][a + 20]
                                    ['conditions'],
                                time: currentdaydata['hours'][a + 20]
                                        ['datetime']
                                    .toString()
                                    .substring(0, 5),
                                icon: geticon(daysdata, 20),
                              ),
                              hourly_forecastcont(
                                context: context,
                                temp: currentdaydata['hours'][a + 21]['temp']
                                    .toString(),
                                conditionname: currentdaydata['hours'][a + 21]
                                    ['conditions'],
                                time: currentdaydata['hours'][a + 21]
                                        ['datetime']
                                    .toString()
                                    .substring(0, 5),
                                icon: geticon(daysdata, 21),
                              ),
                              hourly_forecastcont(
                                context: context,
                                temp: currentdaydata['hours'][a + 22]['temp']
                                    .toString(),
                                conditionname: currentdaydata['hours'][a + 22]
                                    ['conditions'],
                                time: currentdaydata['hours'][a + 22]
                                        ['datetime']
                                    .toString()
                                    .substring(0, 5),
                                icon: geticon(daysdata, 22),
                              ),
                              hourly_forecastcont(
                                context: context,
                                temp: currentdaydata['hours'][a + 23]['temp']
                                    .toString(),
                                conditionname: currentdaydata['hours'][a + 23]
                                    ['conditions'],
                                time: currentdaydata['hours'][a + 23]
                                        ['datetime']
                                    .toString()
                                    .substring(0, 5),
                                icon: geticon(daysdata, 23),
                              ),
                            ],
                          ),
                        ),
                        mspacer(height: 15),
                        Text('WEEKLY FORECAST',
                            style: heading_(
                                fontSize: size / 25,
                                fontWeight: FontWeight.w100)),
                        mspacer(height: 5),
                        SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              weeky_forecastcont(
                                context: context,
                                day: getDayFromEpoch(
                                    data['days'][0]['datetimeEpoch']),
                                temp: data['days'][0]['temp'].toString(),
                                condition:
                                    (data['days'][0]['conditions']).toString(),
                                icon: geticonforweek(daysdata, 0),
                              ),
                              weeky_forecastcont(
                                context: context,
                                day: getDayFromEpoch(
                                    data['days'][1]['datetimeEpoch']),
                                temp: data['days'][1]['temp'].toString(),
                                condition:
                                    (data['days'][1]['conditions']).toString(),
                                icon: geticonforweek(daysdata, 1),
                              ),
                              weeky_forecastcont(
                                context: context,
                                day: getDayFromEpoch(
                                    data['days'][2]['datetimeEpoch']),
                                temp: data['days'][2]['temp'].toString(),
                                condition:
                                    (data['days'][2]['conditions']).toString(),
                                icon: geticonforweek(daysdata, 2),
                              ),
                              weeky_forecastcont(
                                context: context,
                                day: getDayFromEpoch(
                                    data['days'][3]['datetimeEpoch']),
                                temp: data['days'][3]['temp'].toString(),
                                condition:
                                    (data['days'][3]['conditions']).toString(),
                                icon: geticonforweek(daysdata, 3),
                              ),
                              weeky_forecastcont(
                                context: context,
                                day: getDayFromEpoch(
                                    data['days'][4]['datetimeEpoch']),
                                temp: data['days'][4]['temp'].toString(),
                                condition:
                                    (data['days'][4]['conditions']).toString(),
                                icon: geticonforweek(daysdata, 4),
                              ),
                              weeky_forecastcont(
                                context: context,
                                day: getDayFromEpoch(
                                    data['days'][5]['datetimeEpoch']),
                                temp: data['days'][5]['temp'].toString(),
                                condition:
                                    (data['days'][5]['conditions']).toString(),
                                icon: geticonforweek(daysdata, 5),
                              ),
                              weeky_forecastcont(
                                context: context,
                                day: getDayFromEpoch(
                                    data['days'][6]['datetimeEpoch']),
                                temp: data['days'][6]['temp'].toString(),
                                condition:
                                    (data['days'][6]['conditions']).toString(),
                                icon: geticonforweek(daysdata, 6),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  mspacer(height: size / 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('WIND STATUS',
                          style: heading_(
                              fontWeight: FontWeight.w500,
                              fontSize: size / 18,
                              color: Color(0xffBAEDFF))),
                    ],
                  ),
                  mspacer(height: 5),
                  Container(
                      width: size,
                      height: size / 3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(size / 13),
                          color: Color(0xff838383).withOpacity(0.2)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('WIND SPEED',
                                  style: heading_(
                                      fontSize: size / 26,
                                      fontWeight: FontWeight.w100)),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Text(windspeed,
                                      style: heading_(
                                          fontSize: size / 10,
                                          color: Color(0xffC4FFFE),
                                          fontWeight: FontWeight.w900)),
                                  Text('km/hr',
                                      style: heading_(
                                          color: Color(0xffC4FFFE),
                                          fontSize: size / 25,
                                          fontWeight: FontWeight.w100)),
                                ],
                              ),
                            ],
                          ),
                          mspacer(width: 5),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('WIND DIRECTION',
                                  style: heading_(
                                      fontSize: size / 26,
                                      fontWeight: FontWeight.w100)),
                              Row(
                                children: [
                                  Image.asset(
                                    'images/pngegg (5).png',
                                    width: size / 10,
                                  ),
                                  Text(winddirectionname,
                                      style: heading_(
                                          fontSize: size / 10,
                                          color: Color(0xffC4FFFE),
                                          fontWeight: FontWeight.w900)),
                                ],
                              ),
                            ],
                          ),
                        ],
                      )),
                  mspacer(height: size / 25),
                  Container(
                      padding: EdgeInsets.fromLTRB(
                          size / 55, size / 35, size / 55, 0),
                      width: size,
                      height: size * 1.3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(size / 13),
                          color: Color(0xff02060C).withOpacity(0.5)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Wind Speed Chart (Km/hr)',
                              style: heading_(
                                  fontSize: size / 26,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w100)),
                          SizedBox(
                            height: size * 1.20, // or any suitable height
                            child: Windspeed_chart(),
                          ),
                        ],
                      )),
                  mspacer(height: size / 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('SUNRISE & SUNSET',
                          style: heading_(
                              fontWeight: FontWeight.w500,
                              fontSize: size / 18,
                              color: Color(0xffFFFEB8))),
                    ],
                  ),
                  mspacer(height: 5),
                  Container(
                      width: size,
                      height: size / 2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(size / 13),
                          color: Color(0xff838383).withOpacity(0.2)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('SUNRISE',
                                  style: heading_(
                                      fontSize: size / 25,
                                      fontWeight: FontWeight.w100)),
                              Lottie.asset('assets/animations/sunrise.json',
                                  width: size / 6, fit: BoxFit.cover),
                              Text(convertTo12HourFormat(sunrise),
                                  style: heading_(
                                      fontSize: size / 18,
                                      fontWeight: FontWeight.w900)),
                            ],
                          ),
                          mspacer(width: 5),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('SUNSET',
                                  style: heading_(
                                      fontSize: size / 25,
                                      fontWeight: FontWeight.w100)),
                              Lottie.asset('assets/animations/sunset.json',
                                  width: size / 6, fit: BoxFit.cover),
                              Text(convertTo12HourFormat(sunset),
                                  style: heading_(
                                      fontSize: size / 18,
                                      fontWeight: FontWeight.w900)),
                            ],
                          ),
                        ],
                      )),
                  mspacer(height: size / 45),
                  Container(
                    width: size,
                    height: size / 4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(size / 13),
                        color: Color(0xff838383).withOpacity(0.2)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('DAY DURATION',
                            style: heading_(
                                fontSize: size / 26,
                                fontWeight: FontWeight.w100)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('12',
                                style: heading_(
                                    fontSize: size / 13,
                                    fontWeight: FontWeight.w900)),
                            Text('hr',
                                style: heading_(
                                    fontSize: size / 13,
                                    fontWeight: FontWeight.w100)),
                            mspacer(width: 5),
                            Text('45',
                                style: heading_(
                                    fontSize: size / 13,
                                    fontWeight: FontWeight.w900)),
                            Text('min',
                                style: heading_(
                                    fontSize: size / 13,
                                    fontWeight: FontWeight.w100)),
                          ],
                        )
                      ],
                    ),
                  ),
                  mspacer(height: size / 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('UV INDEX',
                          style: heading_(
                              fontWeight: FontWeight.w500,
                              fontSize: size / 18,
                              color: Color(0xffFBA6FF))),
                    ],
                  ),
                  mspacer(height: 5),
                  Container(
                      padding: EdgeInsets.all(10),
                      width: size,
                      height: size / 3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(size / 13),
                          color: Color(0xff838383).withOpacity(0.2)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     // Icon(
                          //     //   Icons.location_on,
                          //     //   color: Colors.white,
                          //     //   size: size / 25,
                          //     // ),
                          //     mspacer(width: 2),
                          //     // Text(location,
                          //     //     style: heading_(fontSize: size / 26)),
                          //   ],
                          // ),
                          // Text(
                          //   '2:00 PM',
                          //   style: TextStyle(
                          //       fontSize: size / 25, color: Color(0XFFA3A3A3)),
                          // ),
                          mspacer(height: size / 25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text('UV INDEX',
                                      style: heading_(
                                          fontSize: size / 26,
                                          fontWeight: FontWeight.w100)),
                                  Text(uvindex,
                                      style: heading_(
                                          fontSize: size / 10,
                                          color: Color(0xffC4FFFE),
                                          fontWeight: FontWeight.w900)),
                                ],
                              ),
                              mspacer(width: 5),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text('RISK LEVEL',
                                      style: heading_(
                                          fontSize: size / 26,
                                          fontWeight: FontWeight.w100)),
                                  Padding(
                                    padding: EdgeInsets.all(size / 30),
                                    child: Text(risklevel.toUpperCase(),
                                        style: heading_(
                                            fontSize: size / 25,
                                            color: Color(0xffC4FFFE),
                                            fontWeight: FontWeight.w900)),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      )),
                  mspacer(height: size / 25),
                  Container(
                      padding: EdgeInsets.all(size / 35),
                      width: size,
                      height: size * 1.45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(size / 13),
                          color: Color(0xff02060C).withOpacity(0.5)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('UV Index Chart',
                              style: heading_(
                                  fontSize: size / 26,
                                  fontWeight: FontWeight.w100)),
                          SizedBox(
                            height: 450, // or any suitable height
                            child: UvIndexChartWidget(),
                          ),
                        ],
                      )),
                  mspacer(height: size / 4)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
