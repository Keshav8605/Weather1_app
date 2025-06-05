import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/colors_.dart';
import 'package:weather_app/functions_uses.dart';
import 'UV_indexchart.dart';
import 'package:weather_app/Wind_speedchart.dart';
import 'weather_controller.dart';
import 'package:get/get.dart';

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
    String sunrise = controller.sunset.toString();
    String sunset = controller.sunset.toString();
    //String dayduration = getDayDuration(sunrise, sunset).toString();
    String uvindex = controller.getCurrentUvIndex.toString();
    String risklevel = risklevelfunc(uvindex).toString();

    double size = MediaQuery.of(context).size.width * 0.95;
    return Scaffold(
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
                  style:
                      TextStyle(fontSize: size / 27, color: Color(0XFFA3A3A3)),
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
                  image: AssetImage('images/sunnyicon.png'),
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
                            hourly_forecastcont(context: context),
                            hourly_forecastcont(context: context),
                            hourly_forecastcont(context: context),
                            hourly_forecastcont(context: context),
                            hourly_forecastcont(context: context),
                            hourly_forecastcont(context: context),
                            hourly_forecastcont(context: context),
                            hourly_forecastcont(context: context),
                            hourly_forecastcont(context: context),
                            hourly_forecastcont(context: context),
                            hourly_forecastcont(context: context),
                            hourly_forecastcont(context: context),
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
                            weeky_forecastcont(context: context),
                            weeky_forecastcont(context: context),
                            weeky_forecastcont(context: context),
                            weeky_forecastcont(context: context),
                            weeky_forecastcont(context: context),
                            weeky_forecastcont(context: context),
                            weeky_forecastcont(context: context),
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
                    padding:
                        EdgeInsets.fromLTRB(size / 55, size / 35, size / 55, 0),
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
                            Text('$sunrise',
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
                            Text('6:45 PM',
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
    );
  }
}
