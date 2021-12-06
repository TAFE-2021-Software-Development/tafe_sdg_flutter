import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:sdg/Screens/LoginScreen.dart';
import 'package:sdg/Screens/RegistrationScreen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  static final id = "WelcomeScreen";

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Image.asset(
              "lib/img/Woods.jpg",
              height: MediaQuery.of(context).size.height,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 300),
            child: Column(
              children: [
                Text(
                  "TAFE SDG",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 70,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Material(
                          // elevation: 5,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                          child: MaterialButton(
                            onPressed: () {
                              // Navigator.pushNamed(context, RegisterScreen.id);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterScreen()));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Register",
                                  style: TextStyle(
                                      color: Color(0xff2C946F), fontSize: 20),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Color(0xff2C946F),
                                ),
                              ],
                            ),
                            minWidth: 200.0,
                            height: 42.0,
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: 50,
                      // ),
                      Row(
                        children: [
                          Text("Already have an \naccount ?",
                              style: TextStyle(color: Colors.white)),
                          SizedBox(
                            width: 50,
                          ),
                          Flexible(
                            child: Material(
                              // elevation: 5,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Color(0xff2C946F),
                              child: MaterialButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginScreen()));
                                },
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                minWidth: 250.0,
                                height: 42.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
