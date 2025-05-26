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
    width: size / 6,
    height: size / 4,
    decoration: BoxDecoration(
        color: Color(0XFFBABABA).withOpacity(0.4),
        borderRadius: BorderRadius.circular(20)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text('NOW',
            style: heading_(fontSize: size / 45, fontWeight: FontWeight.w900)),
        Image(
          image: AssetImage('images/—Pngtree—sunny icon_4499465.png'),
          width: size / 8.8,
        ),
        Text('SUNNY',
            style: heading_(fontSize: size / 55, fontWeight: FontWeight.w300)),
        Text.rich(TextSpan(
          text: '28',
          style: heading_(fontSize: size / 31, color: Colors.white),
          children: <TextSpan>[
            TextSpan(text: '°C', style: heading_(fontSize: size / 49)),
          ],
        )),
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
    width: size / 6,
    height: size / 4,
    decoration: BoxDecoration(
        color: Color(0XFFBABABA).withOpacity(0.4),
        borderRadius: BorderRadius.circular(20)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text('TUE',
            style: heading_(fontSize: size / 45, fontWeight: FontWeight.w900)),
        Image(
          image: AssetImage('images/—Pngtree—sunny icon_4499465.png'),
          width: size / 8.8,
        ),
        Text('SUNNY',
            style: heading_(fontSize: size / 55, fontWeight: FontWeight.w300)),
        Text.rich(TextSpan(
          text: '28',
          style: heading_(fontSize: size / 31, color: Colors.white),
          children: <TextSpan>[
            TextSpan(text: '°C', style: heading_(fontSize: size / 49)),
          ],
        )),
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

SizedBox mspacer({double height = 20, double width = 10}) {
  return SizedBox(
    height: height,
    width: width,
  );
}

Container main_container({
  required BuildContext context, // ✅ Add this line
  double borderradius = 60,
  double width = double.infinity,
  String s = 'photo-1478760329108-5c3ed9d495a0.avif',
}) {
  double size = MediaQuery.of(context).size.width * 0.95;
  return Container(
    padding: EdgeInsets.fromLTRB(20, 9, 30, 40),
    decoration: BoxDecoration(
      color: Color(0xFF243B48).withOpacity(0.6),
      image: DecorationImage(
        opacity: 1,
        image: AssetImage('images/$s'),
        fit: BoxFit.cover,
      ),
      borderRadius: BorderRadius.circular(borderradius),
    ),
    width: size,
    height: size, //
    child: Stack(
      children: [
        // Lottie.asset('assets/animations/New_Lottie_Animation_Recreated.json',
        //     fit: BoxFit.cover),
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationY(3.1416), // π radians = 180 degrees
          child: Lottie.asset(
              'assets/animations/Animation - 1743712287353 (1).json',
              fit: BoxFit.fill,
              height: size / 2.8),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image.asset(
                //   'images/weather_5464289.png',
                //   width: 80,
                // ),
                Lottie.asset(
                  'assets/animations/Animation - 1743775948554.json',
                  fit: BoxFit.contain,
                  repeat: true,
                  width: size / 3.5,
                ),
                CircleAvatar(
                  radius: size / 16,
                  backgroundColor: Appcolors.black_color,
                  child: Icon(
                    size: size / 15,
                    Icons.search,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            Text.rich(TextSpan(
              text: '28',
              style: subheading_(fontSize: size / 8, color: Colors.white),
              children: <TextSpan>[
                TextSpan(
                    text: '°C',
                    style: TextStyle(
                      fontSize: size / 12,
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                    )),
              ],
            )),
            Row(
              children: [
                Image.asset(
                  'images/storm (1).png',
                  width: size / 14,
                ),
                Text(
                  'Rainy Storm Clouds',
                  style: subheading_(fontSize: size / 25),
                )
              ],
            ),
            mspacer(height: 5),
            Divider(
              height: size / 70,
              color: Colors.grey.shade800,
            ),
            mspacer(height: 5),
            Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: Colors.grey.shade600,
                  size: size / 18,
                ),
                Text(
                  'Florida, US',
                  style: subheading_(fontSize: size / 25),
                )
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.calendar_month,
                  color: Colors.grey.shade600,
                  size: size / 18,
                ),
                Text(
                  ' 25 Feb, 2025 | 12:51 AM',
                  style: subheading_(fontSize: size / 25),
                )
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

Container seven_days_cont(BuildContext context) {
  double size = MediaQuery.of(context).size.width * 0.95;
  return Container(
    margin:
        EdgeInsets.fromLTRB(size / 10000, size / 80, size / 10000, size / 80),
    width: double.infinity,
    decoration: BoxDecoration(
        color: Colors.white10, borderRadius: BorderRadius.circular(size / 30)),
    child: Padding(
      padding: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            'images/storm (1).png',
            width: size / 10,
          ),
          Text.rich(TextSpan(
            text: '28',
            style: subheading_(fontSize: size / 14, color: Colors.white),
            children: <TextSpan>[
              TextSpan(
                  text: '°C',
                  style: TextStyle(
                    fontSize: size / 22,
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                  )),
            ],
          )),
          Text(
            '25 July',
            style: subheading_(fontSize: size / 22),
          ),
          Text(
            'Tuesday',
            style: subheading_(fontSize: size / 22),
          ),
        ],
      ),
    ),
  );
}

Container main_container2({
  required BuildContext context, // ✅ Add this line
  double borderradius = 60,
  double width = double.infinity,
  Color color = Colors.white,
  String s = 'photo-1478760329108-5c3ed9d495a0.avif',
}) {
  double size = MediaQuery.of(context).size.width * 0.95;
  return Container(
    padding: EdgeInsets.fromLTRB(size / 30, size / 30, size / 30, size / 30),
    decoration: BoxDecoration(
      color: color,
      image: DecorationImage(
        image: AssetImage('images/$s'),
        fit: BoxFit.cover,
      ),
      borderRadius: BorderRadius.circular(size / 7),
    ),
    width: size,
    height: size, //
    child: Stack(
      children: [
        // Transform(
        //   alignment: Alignment.center,
        //   transform: Matrix4.rotationY(3.1416), // π radians = 180 degrees
        //   child: Lottie.asset(
        //       'assets/animations/Animation - 1743712287353 (1).json',
        //       fit: BoxFit.fill,
        //       width: 20000,
        //       height: 250),
        // ),
        Scrollbar(
          thumbVisibility: true,
          thickness: 3,
          radius: Radius.circular(size / 20),
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 110),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  seven_days_cont(context),
                  seven_days_cont(context),
                  seven_days_cont(context),
                  seven_days_cont(context),
                  seven_days_cont(context),
                  seven_days_cont(context),
                  seven_days_cont(context),
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
              color: Colors.white24,
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
                  'images/storm (1).png',
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
                        fontSize: size / 25,
                      ),
                    ),
                    Text(
                      '22°C',
                      style: subheading_(fontSize: size / 25),
                    ),
                    Text(
                      'Tuesday',
                      style: subheading_(fontSize: size / 25),
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

        color: Color(0xFF243B48).withOpacity(0.6),
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
                color: Colors.black.withOpacity(0.4),
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
              color: Colors.black.withOpacity(0.4),
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
                  color: Colors.grey.shade400),
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
              color: Colors.grey.shade400,
              size: size / 20,
            ),
            Text(
              'the dew point is 27\'\n right now',
              style: subheading_(
                  fontSize: size / 35,
                  fontWeight: FontWeight.w900,
                  color: Colors.grey.shade400),
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
                  color: Colors.grey.shade400),
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
              color: Colors.grey.shade400,
              size: size / 20,
            ),
            Text(
              'Haze is affecting \nvisibility',
              style: subheading_(
                  fontSize: size / 35,
                  fontWeight: FontWeight.w900,
                  color: Colors.grey.shade400),
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
                  color: Colors.grey.shade400),
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
                  color: Colors.grey.shade400),
            ),
          ],
        ),
      ],
    );
  }
}

Widget getupcontdata(
    {String head = 'Wind Status', required BuildContext context}) {
  double size = MediaQuery.of(context).size.width * 0.95;
  if (head == 'Wind Status') {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          head,
          style: subheading_(
              fontSize: size / 27,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade400),
        ),
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
                      color: Colors.grey.shade400),
                ),
              ],
            ),
            Text(
              '5:01 AM',
              style: subheading_(
                  color: Colors.grey.shade400,
                  fontSize: size / 30,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ],
      //weather app
    );
  } else if (head == 'UV Index') {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          head,
          style: subheading_(
              fontSize: size / 27,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade400),
        ),
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
                  fontSize: size / 30,
                  fontWeight: FontWeight.w900,
                  color: Colors.grey.shade400),
            ),
          ],
        ),
      ],
    );
  } else {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          head,
          style: subheading_(
              fontSize: size / 27,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade400),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.sunny,
                  color: Colors.grey.shade400,
                  size: size / 20,
                ),
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
                Icon(
                  Icons.sunny_snowing,
                  color: Colors.grey.shade400,
                  size: size / 20,
                ),
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
