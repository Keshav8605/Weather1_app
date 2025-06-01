import 'package:flutter/material.dart';
import 'colors_.dart';
import 'package:lottie/lottie.dart';

Container hourly_forecastcont({
  required BuildContext context,
}) {
  double size = MediaQuery.of(context).size.width * 0.95;

  return Container(
    margin: EdgeInsets.all(size / 140),
    padding: EdgeInsets.all(size / 60),
    width: size / 5,
    height: size / 3.5,
    decoration: BoxDecoration(
        color: Color(0XFFBABABA).withOpacity(0.4),
        borderRadius: BorderRadius.circular(20)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text('NOW',
            style: heading_(fontSize: size / 30, fontWeight: FontWeight.bold)),
        Image(
          image: AssetImage('images/—Pngtree—sunny icon_4499465 - Copy.png'),
          width: size / 12,
        ),
        Text('SUNNY',
            style: heading_(fontSize: size / 35, fontWeight: FontWeight.w400)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '28',
              style: heading_(
                fontSize: MediaQuery.of(context).size.width * 0.05,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.width *
                    0.0085, // adjust top padding
              ),
              child: Text(
                '°C',
                style: heading_(
                  fontSize:
                      MediaQuery.of(context).size.width * 0.028, // smaller font
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Container weeky_forecastcont({
  required BuildContext context,
}) {
  double size = MediaQuery.of(context).size.width * 0.95;

  return Container(
    margin: EdgeInsets.all(size / 140),
    padding: EdgeInsets.all(size / 60),
    width: size / 5,
    height: size / 3.5,
    decoration: BoxDecoration(
        color: Color(0XFFBABABA).withOpacity(0.4),
        borderRadius: BorderRadius.circular(20)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text('NOW',
            style: heading_(fontSize: size / 30, fontWeight: FontWeight.bold)),
        Image(
          image: AssetImage(
              'images/vecteezy_3d-illustration-of-cloud_18780213.png'),
          width: size / 12,
        ),
        Text('SUNNY',
            style: heading_(fontSize: size / 35, fontWeight: FontWeight.w400)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '28',
              style: heading_(
                fontSize: MediaQuery.of(context).size.width * 0.05,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.width *
                    0.0085, // adjust top padding
              ),
              child: Text(
                '°C',
                style: heading_(
                  fontSize:
                      MediaQuery.of(context).size.width * 0.028, // smaller font
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

TextStyle heading_({
  double fontSize = 18,
  FontWeight fontWeight = FontWeight.bold,
  Color color = Colors.white,
  String fontFamily = 'Montserrat',
}) {
  return TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
    fontFamily: fontFamily,
  );
}

TextStyle subheading_({
  double fontSize = 24,
  FontWeight fontWeight = FontWeight.normal,
  Color color = Colors.white,
  String fontFamily = 'Montserrat',
}) {
  return TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
    fontFamily: fontFamily,
  );
}

SizedBox mspacer({
  BuildContext? context,
  double? height,
  double? width,
}) {
  double h = height ?? 5.0;
  double w = width ?? 5.0;

  if (context != null) {
    final mediaQuery = MediaQuery.of(context);
    h = height ?? mediaQuery.size.width * 0.95 / 10;
    w = width ?? mediaQuery.size.height * 0.95 / 10;
  }

  return SizedBox(height: h, width: w);
}

Container main_container({
  required String currentdate,
  String? backgroundlottie,
  String? mainlottie,
  String currentlocation = 'Unknown Location',
  String currenttime = '12:51 AM',
  String currenttemp = '100',
  String currentWCname = 'Sunny',
  required BuildContext context,
  double borderradius = 60,
  double width = double.infinity,
}) {
  double size = MediaQuery.of(context).size.width * 0.95;
  return Container(
    padding: EdgeInsets.all(size / 20),
    decoration: BoxDecoration(
      color: Color(0XFFBABABA).withOpacity(0.1),
      borderRadius: BorderRadius.circular(borderradius),
    ),
    width: size,
    height: size, //
    child: Stack(
      children: [
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationY(3.1416), // π radians = 180 degrees
          child: Lottie.asset(backgroundlottie!,
              fit: BoxFit.fill, height: size / 2),
        ),
        Lottie.asset(
          mainlottie!,
          fit: BoxFit.contain,
          repeat: true,
          width: size / 2.5,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            mspacer(height: size / 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$currenttemp',
                  style: heading_(
                    fontSize: MediaQuery.of(context).size.width * 0.10,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width * 0.02,
                  ),
                  child: Text(
                    '°C',
                    style: heading_(
                      fontSize: MediaQuery.of(context).size.width *
                          0.05, // smaller font
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Image.asset(
                  'images/vecteezy_3d-illustration-of-cloud_18780213.png',
                  width: size / 14,
                ),
                mspacer(width: size / 65),
                Text('$currentWCname',
                    style: heading_(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: size / 25)),
              ],
            ),
            mspacer(height: size / 160),
            Divider(
              thickness: size / 3200,
              color: Colors.white,
            ),
            mspacer(height: size / 160),
            Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: Colors.white,
                  size: size / 18,
                ),
                Text(
                  currentlocation,
                  style: subheading_(
                      fontWeight: FontWeight.w400, fontSize: size / 25),
                )
              ],
            ),
            mspacer(),
            Row(
              children: [
                Icon(
                  Icons.calendar_month,
                  color: Colors.white,
                  size: size / 18,
                ),
                Text(
                  ' $currentdate | $currenttime',
                  style: subheading_(
                      fontWeight: FontWeight.w400, fontSize: size / 25),
                ),
                mspacer(height: size / 10),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

Container seven_days_cont({
  required BuildContext context,
  String temp = '28',
  String date = '25 July',
  String day = 'Tuesday',
  String icon = 'images/—Pngtree—sunny icon_4499465 - Copy.png',
}) {
  double size = MediaQuery.of(context).size.width * 0.95;
  return Container(
    margin:
        EdgeInsets.fromLTRB(size / 10000, size / 80, size / 10000, size / 80),
    width: double.infinity,
    decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(size / 20)),
    child: Padding(
      padding: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            icon,
            width: size / 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                temp,
                style: heading_(
                  fontSize: MediaQuery.of(context).size.width * 0.06,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width *
                      0.0085, // adjust top padding
                ),
                child: Text(
                  '°C',
                  style: heading_(
                    fontSize: MediaQuery.of(context).size.width *
                        0.028, // smaller font
                  ),
                ),
              ),
            ],
          ),
          Text(
            date,
            style: subheading_(fontSize: size / 22),
          ),
          Container(
            width: size / 5,
            child: Text(
              day,
              style:
                  subheading_(fontSize: size / 31, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    ),
  );
}

Container main_container2({
  required BuildContext context,
  List<Map<String, String>> Map_name = const [{}],
  double borderradius = 60,
  double width = double.infinity,
}) {
  double size = MediaQuery.of(context).size.width * 0.95;
  return Container(
    padding: EdgeInsets.all(size / 30),
    decoration: BoxDecoration(
      color: Color(0XFFBABABA).withOpacity(0.1),
      borderRadius: BorderRadius.circular(size / 7),
    ),
    width: size,
    height: size, //
    child: Stack(
      children: [
        Scrollbar(
          thickness: 3,
          radius: Radius.circular(size / 20),
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, size / 35, 0, 110),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  mspacer(),
                  seven_days_cont(
                    context: context,
                    temp: Map_name[0]['temp']!,
                    date: Map_name[0]['date']!,
                    day: Map_name[0]['day']!,
                  ),
                  seven_days_cont(
                    context: context,
                    temp: Map_name[1]['temp']!,
                    date: Map_name[1]['date']!,
                    day: Map_name[1]['day']!,
                  ),
                  seven_days_cont(
                    context: context,
                    temp: Map_name[2]['temp']!,
                    date: Map_name[2]['date']!,
                    day: Map_name[2]['day']!,
                  ),
                  seven_days_cont(
                    context: context,
                    temp: Map_name[3]['temp']!,
                    date: Map_name[3]['date']!,
                    day: Map_name[3]['day']!,
                  ),
                  seven_days_cont(
                    context: context,
                    temp: Map_name[4]['temp']!,
                    date: Map_name[4]['date']!,
                    day: Map_name[4]['day']!,
                  ),
                  seven_days_cont(
                    context: context,
                    temp: Map_name[5]['temp']!,
                    date: Map_name[5]['date']!,
                    day: Map_name[5]['day']!,
                  ),
                  seven_days_cont(
                    context: context,
                    temp: Map_name[6]['temp']!,
                    date: Map_name[6]['date']!,
                    day: Map_name[6]['day']!,
                  ),
                  mspacer(height: size / 30),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Container(
            padding:
                EdgeInsets.fromLTRB(size / 20, size / 20, size / 15, size / 20),
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(borderradius / 7),
                topLeft: Radius.circular(borderradius / 7),
                bottomLeft: Radius.circular(borderradius),
                bottomRight: Radius.circular(borderradius),
              ),
            ),
            height: size / 3.5,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'images/vecteezy_3d-illustration-of-cloud_18780213.png',
                  width: size / 5,
                ),
                mspacer(width: size / 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tomorrow',
                      style: subheading_(
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlueAccent,
                        fontSize: size / 25,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Map_name[1]['temp']!,
                          style: heading_(
                            color: Colors.lightBlueAccent,
                            fontSize: size / 25,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.width *
                                0.005, // adjust top padding
                          ),
                          child: Text(
                            '°C',
                            style: heading_(
                              color: Colors.lightBlueAccent,
                              fontSize: MediaQuery.of(context).size.width *
                                  0.028, // smaller font
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      Map_name[1]['day']!,
                      style: subheading_(
                          color: Colors.lightBlueAccent, fontSize: size / 25),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    ),
  );
}

Container sub_conatiner(
    {required BuildContext context,
    String lowcont = 'Humidity',
    String upcont = 'Wind Status'}) {
  double size = MediaQuery.of(context).size.width * 0.95;

  return Container(
    margin: EdgeInsets.zero,
    padding: EdgeInsets.fromLTRB(size / 20, size / 20, size / 20, size / 20),
    width: size / 1.25,
    height: size / 1.1,
    decoration: BoxDecoration(
        // image:
        //     DecorationImage(image: AssetImage('images/$s'), fit: BoxFit.cover),

        color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(size / 7)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(0),
          child: Container(
              padding: EdgeInsets.all(size / 25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(size / 18),
                  topLeft: Radius.circular(size / 18),
                  bottomLeft: Radius.circular(size / 18),
                  bottomRight: Radius.circular(size / 18),
                ),

                color: Colors.white.withOpacity(0.1),
                //color: Colors.black.withOpacity(0.3),
              ),
              width: double.infinity,
              height: size / 2,
              child: getupcontdata(head: upcont, context: context)),
        ),
        Padding(
          padding: EdgeInsets.all(0),
          child: Container(
            padding: EdgeInsets.all(size / 25),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(size / 18),
                topLeft: Radius.circular(size / 18),
                bottomLeft: Radius.circular(size / 18),
                bottomRight: Radius.circular(size / 18),
              ),

              color: Colors.white.withOpacity(0.1),
              //color: Colors.black.withOpacity(0.3),
            ),
            width: double.infinity,
            height: size / 3.5,
            child: getlowcontdata(context: context, head: lowcont),
          ),
        ),
      ],
    ),
  );
}

Widget getlowcontdata(
    {String head = 'Humidity', required BuildContext context}) {
  double size = MediaQuery.of(context).size.width * 0.95;
  if (head == 'Humidity') {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //if (head == 'Feels like') Icon(Icons.thermostat),
            Text(
              head,
              style: subheading_(
                  fontSize: size / 27,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),

            Text(
              '84%',
              style: subheading_(
                  fontSize: size / 12,
                  fontWeight: FontWeight.w900,
                  color: Colors.white),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: size / 80,
          children: [
            Icon(
              Icons.water_drop_outlined,
              color: Colors.white,
              size: size / 20,
            ),
            Text(
              'the dew point is 27\'\n right now',
              style: subheading_(
                  fontSize: size / 35,
                  fontWeight: FontWeight.w900,
                  color: Colors.white),
            ),
          ],
        ),
      ],
    );
  } else if (head == 'Visibility') {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //if (head == 'Feels like') Icon(Icons.thermostat),
            Text(
              head,
              style: subheading_(
                  fontSize: size / 27,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Row(
              children: [
                Text(
                  '03',
                  style: subheading_(
                      fontSize: size / 12,
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                ),
                mspacer(width: 5),
                Text(
                  'Km',
                  style: subheading_(
                      fontSize: size / 30,
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                ),
              ],
            )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: size / 80,
          children: [
            Icon(
              Icons.remove_red_eye_outlined,
              color: Colors.white,
              size: size / 20,
            ),
            Text(
              'Haze is affecting \nvisibility',
              style: subheading_(
                  fontSize: size / 35,
                  fontWeight: FontWeight.w900,
                  color: Colors.white),
            ),
          ],
        ),
      ],
    );
  } else {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //if (head == 'Feels like') Icon(Icons.thermostat),
            Text(
              head,
              style: subheading_(
                  fontSize: size / 27,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Row(
              children: [
                Icon(
                  Icons.thermostat,
                  size: size / 12,
                  color: Colors.white,
                ),
                Text(
                  '42\u00B0',
                  style: subheading_(
                      fontSize: size / 12,
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                ),
              ],
            )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: size / 80,
          children: [
            Text(
              'Humidity is making \nit feel hotter.',
              style: subheading_(
                  fontSize: size / 35,
                  fontWeight: FontWeight.w900,
                  color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }
}

Widget getupcontdata(
    {String head = 'Wind Status',
    required BuildContext context,
    String windspeed = '03',
    String time = '5:01 AM'}) {
  double size = MediaQuery.of(context).size.width * 0.95;
  if (head == 'Wind Status') {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              head,
              style: subheading_(
                  fontSize: size / 27,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
        Lottie.asset('assets/animations/wwwwwi.json', width: size / 4.5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  '03',
                  style: subheading_(
                      fontSize: size / 12,
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                ),
                mspacer(width: 5),
                Text(
                  'km/h',
                  style: subheading_(
                      fontSize: size / 30,
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '(Last updated)',
                  style: subheading_(
                      color: Colors.white,
                      fontSize: size / 25,
                      fontWeight: FontWeight.w100),
                ),
                Text(
                  '5:01 AM',
                  style: subheading_(
                      color: Colors.white,
                      fontSize: size / 25,
                      fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
      ],
      //weather app
    );
  } else if (head == 'UV Index') {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              head,
              style: subheading_(
                  fontSize: size / 27,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
        Lottie.asset('assets/animations/uv index graph 2.json',
            width: size / 1.82),
        mspacer(height: 7, width: 1),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '5.50',
              style: subheading_(
                  fontSize: size / 12,
                  fontWeight: FontWeight.w900,
                  color: Colors.white),
            ),
            mspacer(width: 5),
            Text(
              'uv',
              style: subheading_(
                  fontSize: size / 25,
                  fontWeight: FontWeight.w900,
                  color: Colors.white),
            ),
          ],
        ),
      ],
    );
  } else {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              head,
              style: subheading_(
                  fontSize: size / 27,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
        Lottie.asset('assets/animations/sun moving in sky .json',
            width: size / 2.08),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Icon(
                //   Icons.sunny,
                //   color: Colors.grey.shade400,
                //   size: size / 20,
                // ),
                Text(
                  'Sunrise',
                  style: subheading_(
                      fontSize: size / 32,
                      fontWeight: FontWeight.w900,
                      color: Colors.yellow),
                ),
                Text(
                  '5:50 AM',
                  style: subheading_(
                      fontSize: size / 28,
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Icon(
                //   Icons.sunny_snowing,
                //   color: Colors.grey.shade400,
                //   size: size / 20,
                // ),
                Text(
                  'Sunset',
                  style: subheading_(
                      fontSize: size / 32,
                      fontWeight: FontWeight.w900,
                      color: Colors.yellow),
                ),
                Text(
                  '5:30 PM',
                  style: subheading_(
                      fontSize: size / 28,
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
