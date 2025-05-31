import 'package:flutter/material.dart';
import 'package:weather_app/colors_.dart';
import 'functions_uses.dart';

class login_screen extends StatefulWidget {
  const login_screen({super.key});

  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width * 0.95;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('images/loginback.png'))),
          ),
          Padding(
            padding: EdgeInsets.all(size / 35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage('images/applogo.png'),
                      width: size / 12,
                    ),
                    SizedBox(
                      width: size / 80,
                    ),
                    Text(
                      'drizzle',
                      style: heading_(
                          fontWeight: FontWeight.w900, fontSize: size / 12),
                    ),
                  ],
                ),
                mspacer(),
                Text(
                  'A Weather App',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: size / 35,
                    fontWeight: FontWeight.w100,
                    fontFamily: 'Montserrat',
                  ),
                ),
                mspacer(height: size / 5),
                Row(
                  children: [
                    Text(
                      'Sign in',
                      style: heading_(
                          fontSize: size / 15, fontWeight: FontWeight.w900),
                    )
                  ],
                ),
                mspacer(height: size / 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Enter Phone Number',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: size / 30,
                        fontFamily: 'Montserrat',
                      ),
                    )
                  ],
                ),
                mspacer(),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      focusColor: Colors.lightBlueAccent,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(size / 30),
                        borderSide:
                            BorderSide(width: 2, color: Colors.lightBlueAccent),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(size / 30)),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'IND +91-',
                      hintStyle: TextStyle(fontSize: size / 30)),
                ),
                mspacer(height: size / 40),
                Container(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Verify',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff001034),
                          side: BorderSide(color: Color(0xff5D90FF), width: 1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(size / 25)),
                        ))),
                mspacer(height: size / 20),
                Text(
                  'OR Sign in with',
                  style: subheading_(
                      color: Colors.grey.shade400, fontSize: size / 40),
                ),
                mspacer(height: size / 40),
                Container(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Email and Password',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                              fontSize: size / 35,
                              fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Appcolors.black_color,
                          side: BorderSide(color: Colors.white, width: 1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(size / 25)),
                        ))),
                mspacer(height: size / 40),
                Container(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'images/googlepnglogin.png',
                              width: size / 25,
                            ),
                            mspacer(height: 0, width: size / 80),
                            Text(
                              'Sign-In with Google',
                              style: TextStyle(
                                  fontSize: size / 35,
                                  color: Colors.grey.shade600,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: BorderSide(color: Colors.grey, width: 2),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(size / 25)),
                        ))),
              ],
            ),
          )
        ],
      ),
    );
  }
}
