import 'package:flutter/material.dart';
import 'package:weather_app/colors_.dart';
import 'functions_uses.dart';
import 'auth_functions.dart';

class login_screen extends StatefulWidget {
  const login_screen({super.key});

  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
  String email = '';
  String pass = '';
  String confpass = '';
  String phone = '';

  final form_key = GlobalKey<FormState>();
  bool islogin = false;
  bool signinphone = false;
  bool codesent = false;

  TextEditingController passcont = TextEditingController();
  TextEditingController confpasscont = TextEditingController();

  trysubmit() {
    final isvalid = form_key.currentState!.validate();
    if (isvalid) {
      form_key.currentState!.save();
      islogin ? signin(email, pass, context) : signup(email, pass, context);
      submitform();
    } else {
      return 'ERROR';
    }
  }

  submitform() {
    print(email);
    print(pass);
  }

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
          child: Center(
            child: SingleChildScrollView(
              child: Center(
                child: Form(
                  key: form_key,
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
                                fontWeight: FontWeight.w900,
                                fontSize: size / 12),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            signinphone
                                ? codesent
                                    ? 'Code Sent'
                                    : 'Sign In'
                                : (islogin ? 'Sign In' : 'Sign up'),
                            style: heading_(
                                color: Colors.white,
                                fontSize: size / 15,
                                fontWeight: FontWeight.w900),
                          ),
                          codesent
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Edit number?-',
                                      style: subheading_(
                                          color: Colors.grey.shade400,
                                          fontSize: size / 30),
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          setState(() {
                                            codesent = false;
                                          });
                                        },
                                        child: Text(
                                          'EDIT',
                                          style: TextStyle(
                                              color: Colors.lightBlueAccent,
                                              decoration:
                                                  TextDecoration.underline,
                                              decorationColor:
                                                  Colors.lightBlueAccent,
                                              decorationThickness: 3),
                                        ))
                                  ],
                                )
                              : SizedBox(
                                  height: 0,
                                  width: 0,
                                )
                        ],
                      ),
                      mspacer(height: size / 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            signinphone
                                ? !codesent
                                    ? 'Enter Phone Number'
                                    : 'Enter Verification Code'
                                : 'Enter email',
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
                        keyboardType: signinphone
                            ? TextInputType.number
                            : TextInputType.emailAddress,
                        decoration: InputDecoration(
                            focusColor: Colors.lightBlueAccent,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(size / 30),
                              borderSide: BorderSide(
                                  width: 2, color: Colors.lightBlueAccent),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(size / 30)),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: signinphone
                                ? !codesent
                                    ? 'IND +91-'
                                    : 'Verification Code'
                                : 'Email',
                            hintStyle: TextStyle(fontSize: size / 30)),
                        key:
                            signinphone ? ValueKey('phone') : ValueKey('email'),
                        validator: signinphone
                            ? (value) {}
                            : (value) {
                                if (value.toString().isEmpty ||
                                    !value.toString().contains('@')) {
                                  return 'Email cannot be empty!\nMust contain @';
                                }
                              },
                        onSaved: signinphone
                            ? (value) {
                                phone = value.toString();
                              }
                            : (value) {
                                email = value.toString();
                              },
                      ),
                      mspacer(height: size / 40),
                      !signinphone
                          ? Column(children: [
                              TextFormField(
                                obscureText: true,
                                controller: passcont,
                                decoration: InputDecoration(
                                  focusColor: Colors.lightBlueAccent,
                                  filled: true,
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(size / 30),
                                      borderSide: BorderSide(
                                        color: Colors.lightBlueAccent,
                                        width: 2,
                                      )),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(size / 30),
                                    borderSide: BorderSide(
                                      color: Colors.purple,
                                    ),
                                  ),
                                  hintText: islogin
                                      ? 'Password'
                                      : 'Enter password (aleast 8 characters)',
                                  hintStyle: TextStyle(fontSize: size / 30),
                                ),
                                key: ValueKey('pass'),
                                validator: (value) {
                                  if (value.toString().isEmpty ||
                                      value.toString().length <= 7) {
                                    return 'Password cannot be empty!\nMust contain atleast 8 characters';
                                  }
                                },
                                onSaved: (value) {
                                  pass = value.toString();
                                },
                              ),
                              mspacer(height: size / 40),
                              !islogin
                                  ? TextFormField(
                                      obscureText: true,
                                      controller: confpasscont,
                                      decoration: InputDecoration(
                                        focusColor: Colors.lightBlueAccent,
                                        filled: true,
                                        fillColor: Colors.white,
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                size / 30),
                                            borderSide: BorderSide(
                                              color: Colors.lightBlueAccent,
                                              width: 2,
                                            )),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(size / 30),
                                          borderSide: BorderSide(
                                            color: Colors.purple,
                                          ),
                                        ),
                                        hintText: 'Confirm password',
                                        hintStyle:
                                            TextStyle(fontSize: size / 30),
                                      ),
                                      key: ValueKey('confpass'),
                                      validator: (value) {
                                        if (value != passcont.text ||
                                            value.toString().length <= 7) {
                                          return 'Confirm Password cannot be empty!\nPasswords must be same!';
                                        }
                                      },
                                      onSaved: (value) {
                                        confpass = value.toString();
                                      },
                                    )
                                  : SizedBox(),
                            ])
                          : SizedBox(
                              height: 0,
                              width: 0,
                            ),
                      islogin
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Forgot Password?',
                                      style: TextStyle(
                                          color: Colors.lightBlueAccent,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline,
                                          decorationColor:
                                              Colors.lightBlueAccent,
                                          decorationThickness: 3),
                                    ))
                              ],
                            )
                          : SizedBox(
                              height: 0,
                              width: 0,
                            ),
                      mspacer(height: size / 40),
                      Container(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: signinphone
                                  ? () {
                                      codesent = true;
                                      setState(() {
                                        codesent = true;
                                      });
                                    }
                                  : () {
                                      trysubmit();
                                    },
                              child: Text(
                                signinphone
                                    ? 'Verify'
                                    : islogin
                                        ? 'Log In'
                                        : 'Sign Up',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff001034),
                                side: BorderSide(
                                    color: Color(0xff5D90FF), width: 1),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(size / 25)),
                              ))),
                      !signinphone
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Already a user?-',
                                  style: subheading_(
                                      color: Colors.grey.shade400,
                                      fontSize: size / 30),
                                ),
                                TextButton(
                                    onPressed: () {
                                      setState(() {
                                        islogin = !islogin;
                                      });
                                    },
                                    child: Text(
                                      !islogin ? 'Sign in' : 'Sign up',
                                      style: TextStyle(
                                          color: Colors.lightBlueAccent,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline,
                                          decorationColor:
                                              Colors.lightBlueAccent,
                                          decorationThickness: 3),
                                    ))
                              ],
                            )
                          : SizedBox(
                              height: 0,
                            ),
                      mspacer(height: size / 40),
                      Text(
                        'OR Sign in with',
                        style: subheading_(
                            color: Colors.grey.shade400, fontSize: size / 40),
                      ),
                      mspacer(height: size / 40),
                      Container(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  signinphone = !signinphone;
                                });
                              },
                              child: Text(
                                signinphone
                                    ? 'Email and Password'
                                    : 'Sign-In with Phone Number',
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
                                    borderRadius:
                                        BorderRadius.circular(size / 25)),
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
                                    borderRadius:
                                        BorderRadius.circular(size / 25)),
                              ))),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    ));
  }
}
