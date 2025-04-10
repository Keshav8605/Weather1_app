import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/functions_uses.dart';
import 'colors_.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.menu,
            color: Colors.grey.shade500,
          ),
          title: Row(
            children: [
              Image(
                image: AssetImage('images/weather_5464289.png'),
                width: 30,
              ),
              SizedBox(
                width: 7,
              ),
              Text(
                'Weathery',
                style: heading_(fontWeight: FontWeight.w100),
              ),
            ],
          ),
          backgroundColor: Appcolors.black_color,
        ),
        backgroundColor: Appcolors.black_color,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  textAlign: TextAlign.start,
                  'Today\'s Forecast',
                  style: subheading_(),
                ),
                mspacer(),
                main_container(context: context),
                mspacer(),
                Text(
                  textAlign: TextAlign.start,
                  '7 day\'s Forecast',
                  style: subheading_(),
                ),
                mspacer(),
                main_container2(
                    context: context,
                    s: '360_F_920272903_eDoUPzq2jROHvtVpKHG1IXhx6BTVsmvj.jpg'),
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
                      sub_conatiner(
                        context: context,
                        upcont: 'Wind Status',
                        lowcont: 'Humidity',
                      ),
                      mspacer(width: 15),
                      sub_conatiner(
                          upcont: 'UV Index',
                          lowcont: 'Visibility',
                          context: context),
                      mspacer(width: 15),
                      sub_conatiner(
                        upcont: 'Sunrise & Sunset',
                        lowcont: 'Feels like',
                        context: context,
                      ),
                    ],
                  ),
                ),
                mspacer(height: 40)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
