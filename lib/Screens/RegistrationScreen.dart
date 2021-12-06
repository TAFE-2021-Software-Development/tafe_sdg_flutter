import 'package:flutter/material.dart';
import 'package:sdg/Screens/HomeScreen.dart';
import 'package:sdg/Screens/HomeScreen.dart';
import '../Items/LoginItems.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Items/Auth.dart' as auth;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  static final id = "RegisterScreen";

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late String _email;
  late String _userName;
  late String _password;
  bool _loadingIndicator = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2C946F),
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
                : SingleChildScrollView(
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
                              "Register",
                              style: TextStyle(
                                  // color: Colors.white,
                                  fontSize: 50,
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
                            padding: EdgeInsets.only(
                                top: 80, left: 20, right: 20, bottom: 90),
                            width: MediaQuery.of(context).size.width,
                            // height: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                              color: Color(0xff2C946F).withOpacity(0.6),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(70),
                                  topRight: Radius.circular(0)),
                            ),
                            child: Column(
                              children: [
                                LoginTextFieldContainer(
                                    theChild: TextField(
                                  // keyboardType: TextInputType.emailAddress,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.person,
                                      color: Color(0xff2C946F),
                                    ),
                                    fillColor: Color(0xff2C946F),
                                    hintText: 'First Name',
                                    hintStyle: TextStyle(
                                      color: Color(0xff2C946F),
                                    ),
                                    border: InputBorder.none,
                                  ),
                                  onChanged: (value) {
                                    _userName = value;
                                  },
                                )),
                                SizedBox(
                                  height: 20,
                                ),
                                LoginTextFieldContainer(
                                    theChild: TextField(
                                  // keyboardType: TextInputType.emailAddress,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.person,
                                      color: Color(0xff2C946F),
                                    ),
                                    fillColor: Color(0xff2C946F),
                                    hintText: 'Last Name (optional)',
                                    hintStyle: TextStyle(
                                      color: Color(0xff2C946F),
                                    ),
                                    border: InputBorder.none,
                                  ),
                                  onChanged: (value) {
                                    _email = value;
                                  },
                                )),
                                SizedBox(
                                  height: 20,
                                ),
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
                                    _email = value;
                                  },
                                )),
                                SizedBox(
                                  height: 20,
                                ),
                                LoginTextFieldContainer(
                                    theChild: TextField(
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
                                    _password = value;
                                  },
                                )),
                                SizedBox(
                                  height: 20,
                                ),
                                LoginTextFieldContainer(
                                    theChild: TextField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.password,
                                      color: Color(0xff2C946F),
                                    ),
                                    fillColor: Color(0xff2C946F),
                                    hintText: 'Confirm Password',
                                    hintStyle: TextStyle(
                                      color: Color(0xff2C946F),
                                    ),
                                    border: InputBorder.none,
                                  ),
                                )),
                                SizedBox(
                                  height: 100,
                                ),
                                LoginButton(
                                  theOnPressed: () async {
                                    setState(() {
                                      _loadingIndicator = true;
                                    });

                                    print(_userName);
                                    print(_password);
                                    print(_email);

                                    var url = Uri.parse(
                                        'http://3.16.123.62/api/user/create/');
                                    var response = await http.post(url, body: {
                                      'email': '$_email',
                                      'password': '$_password',
                                      'name': '$_userName'
                                    });
                                    if (response.statusCode == 200) {
                                      var finalResponse =
                                          await jsonDecode(response.body);
                                      if (!finalResponse
                                          .toString()
                                          .contains("Response: False")) {
                                        print(
                                            'Response status: ${response.statusCode}');
                                        print(
                                            "Response body: ${finalResponse['User']['name']}");
                                        final snackBar = SnackBar(
                                          content:
                                              Text('Succesfull Registered'),
                                          action: SnackBarAction(
                                            textColor: Colors.white,
                                            label: 'Ok',
                                            onPressed: () {},
                                          ),
                                        );
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                        auth.email = _email;
                                        auth.id = finalResponse['User']['id'];
                                        auth.name =
                                            finalResponse['User']['name'];
                                        auth.token = finalResponse['token'][0];

                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HomeScreen()));
                                      } else {
                                        print("FAILED erro raw structure");

                                        final snackBar = SnackBar(
                                          content: Text(
                                              'Contact your admin! (code backend structure changed)'),
                                          action: SnackBarAction(
                                            textColor: Colors.white,
                                            label: 'Ok',
                                            onPressed: () {},
                                          ),
                                        );
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      }
                                    } else {
                                      print("FAILED");

                                      final snackBar = SnackBar(
                                        content: Text(
                                            'Please make sure you fill name, email, and password!'),
                                        action: SnackBarAction(
                                          textColor: Colors.white,
                                          label: 'Ok',
                                          onPressed: () {},
                                        ),
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    }

                                    setState(() {
                                      _loadingIndicator = false;
                                    });
                                  },
                                  theText: 'Sign Up',
                                  theColor: Colors.white,
                                  theTextColor: Color(0xff2C946F),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
