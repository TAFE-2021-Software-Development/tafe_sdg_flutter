import 'package:flutter/material.dart';
import 'package:sdg/Items/LoginItems.dart';
import 'package:sdg/Screens/HomeScreen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Items/Auth.dart' as auth;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var theEmail;
  var thePassword;
  bool _loadingIndicator = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    theEmail = null;
    thePassword = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: Image.asset(
                "lib/img/Woods.jpg",
                height: MediaQuery.of(context).size.height,
              ),
            ),
            _loadingIndicator
                ? Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : theBody(),
          ],
        ),
      ),
    );
  }

  Widget theBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 100,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Center(
                  child: Text(
                "Login",
                style: TextStyle(
                    // color: Colors.white,
                    fontSize: 70,
                    color: Colors.white,
                    fontWeight: FontWeight.w900),
              )),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 20),
              width: MediaQuery.of(context).size.width,
              child: Center(
                  child: Text(
                "Create your new account",
                style: TextStyle(
                    // color: Colors.white,
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )),
            ),
            Container(
              padding: EdgeInsets.only(top: 80, left: 20, right: 20),
              width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                // color: Color(0xff2C946F),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(70), topRight: Radius.circular(0)),
              ),
              child: Column(
                children: [
                  LoginTextFieldContainer(
                      theChild: TextField(
                    keyboardType: TextInputType.emailAddress,
                    obscureText: false,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.email,
                        color: Color(0xff2C946F),
                      ),
                      fillColor: Color(0xff2C946F),
                      hintText: 'Email',
                      hintStyle: TextStyle(
                        color: Color(0xff2C946F),
                      ),
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      theEmail = value;
                    },
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  LoginTextFieldContainer(
                      theChild: TextField(
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.password,
                        color: Color(0xff2C946F),
                      ),
                      fillColor: Color(0xff2C946F),
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        color: Color(0xff2C946F),
                      ),
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      thePassword = value;
                    },
                  )),
                  SizedBox(
                    height: 170,
                  ),
                  LoginButton(
                    theOnPressed: () async {
                      setState(() {
                        _loadingIndicator = true;
                      });

                      print(theEmail);
                      print(thePassword);

                      var url = Uri.parse('http://3.16.123.62/api/user/login/');
                      var response = await http.post(url, body: {
                        'email': '$theEmail',
                        'password': '$thePassword'
                      });
                      if (response.statusCode == 200) {
                        var finalResponse = await jsonDecode(response.body);
                        if (!finalResponse
                            .toString()
                            .contains("Response: False")) {
                          print('Response status: ${response.statusCode}');
                          print(
                              "Response body: ${finalResponse['user']['name']}");

                          auth.email = theEmail;
                          auth.id = finalResponse['user']['id'];
                          auth.name = finalResponse['user']['name'];
                          auth.token = finalResponse['token'][0];
                          print("Token = " + auth.token);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                        } else {}
                      } else {
                        print("FAILED");

                        final snackBar = SnackBar(
                          content: Text('Email or password is wrong!'),
                          action: SnackBarAction(
                            textColor: Colors.white,
                            label: 'Ok',
                            onPressed: () {},
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }

                      setState(() {
                        _loadingIndicator = false;
                      });
                    },
                    theText: 'Sign In',
                    theColor: Color(0xff2C946F),
                    theTextColor: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
