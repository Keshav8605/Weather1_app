import 'package:flutter/material.dart';
import 'package:weather_app/colors_.dart';
import 'package:weather_app/functions_uses.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width * 0.95;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0XFF000F18),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      opacity: 0.25,
                      fit: BoxFit.cover,
                      image: AssetImage(
                          'images/twillight-sky-blurred-background-ai-generated-photo (1).jpg'))),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.white,
                        size: size / 16,
                      ),
                      mspacer(width: 2),
                      Text('KOTA, RAJASTHAN',
                          style: heading_(fontSize: size / 26)),
                    ],
                  ),
                  Text(
                    'TODAY 5 MAY, 2025',
                    style: TextStyle(
                        fontSize: size / 28, color: Color(0XFFA3A3A3)),
                  ),
                  Text.rich(TextSpan(
                    text: '28',
                    style: heading_(fontSize: size / 9, color: Colors.white),
                    children: <TextSpan>[
                      TextSpan(
                          text: '°C', style: heading_(fontSize: size / 19)),
                    ],
                  )),
                  Text('MOSTLY SUNNY', style: heading_(fontSize: size / 26)),
                  Image(
                    image: AssetImage('images/—Pngtree—sunny icon_4499465.png'),
                    width: size / 2,
                  ),
                  Container(
                    padding: EdgeInsets.all(size / 35),
                    width: size,
                    height: size / 1.32,
                    decoration: BoxDecoration(
                        color: Color(0XFFBABABA).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(size / 13)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('HOURLY FORECAST',
                            style: heading_(
                                fontSize: size / 26,
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
                                fontSize: size / 26,
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
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
