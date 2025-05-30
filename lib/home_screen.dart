import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/functions_uses.dart';
import 'Details_Screen.dart';
import 'colors_.dart';
import 'drawer_selfmade.dart';
import 'package:another_flushbar/flushbar.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width * 0.95;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),

        // leading: Icon(
        //   Icons.menu,
        //   color: Colors.grey.shade500,
        // ),

        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              Image(
                image: AssetImage('images/weather_5464289.png'),
                width: size / 10,
              ),
              SizedBox(
                width: size / 80,
              ),
              Text(
                'Weathery',
                style: heading_(fontWeight: FontWeight.w100),
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
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailsScreen()),
                    );
                  },
                  child: main_container(context: context),
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
