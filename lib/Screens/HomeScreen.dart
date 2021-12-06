import 'package:flutter/material.dart';
import 'package:sdg/Screens/CafeScreen.dart';
import 'package:sdg/Screens/EventScreen.dart';
import 'package:sdg/Screens/FoodScreen.dart';
import 'package:sdg/Screens/RewardScreen.dart';
import 'package:sdg/Screens/PrepareQuizScreen.dart';
import 'package:sdg/Screens/QuizScreen.dart';
import 'package:sdg/Screens/SDGGoalsScreen.dart';
import 'package:sdg/Screens/TafeTargets.dart';
import 'package:sdg/Screens/UserInfoScreen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Items/Constant.dart';
import '../Items/AppItems.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import '../Items/Auth.dart' as auth;

class HomeScreen extends StatefulWidget {
  static final id = "HomeScreen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    var _currentIndex = 0;

    return Scaffold(
      backgroundColor: Color(0xff049867),
      body: Body(
        screenSize: _screenSize,
        userName: auth.name,
      ),
    );
  }
}

class Body extends StatefulWidget {
  const Body({
    Key? key,
    required Size screenSize,
    required this.userName,
  })  : _screenSize = screenSize,
        super(key: key);

  final Size _screenSize;
  final userName;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  _showDialog() async {
    await Future.delayed(Duration(milliseconds: 120));
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: Color(0xff0060E0),
        title: Row(
          children: [
            Icon(
              Icons.emoji_emotions_rounded,
              color: Colors.white,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "What's working",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        content: Text(
          "- Restaurant and Booking \n- Event (+ Registration) \n- Loyalty \n- Quiz (Gain point for loyalty) \n- Tips \n- TAFE Target \n- SDG Goals",
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text(
              'OK',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _showDialog();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          width: widget._screenSize.width,
          height: widget._screenSize.height,
        ),
        Positioned(
          bottom: 0,
          child: Image.asset(
            "lib/img/Woods.jpg",
            height: MediaQuery.of(context).size.height,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 240,
                  ),
                  Positioned(
                    top: 55,
                    right: 10,
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserInfoScreen(
                                      userName: widget.userName,
                                    )));
                      },
                      icon: Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 110,
                    left: 20,
                    // right: 0,
                    child: Container(
                      child: TextField(
                        // keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.search,
                            color: Color(0xff2C946F),
                          ),
                          fillColor: Color(0xff2C946F),
                          hintText:
                              'Hi ${widget.userName}, how can I help you?',
                          hintStyle: TextStyle(
                            color: Color(0xff2C946F),
                          ),
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {},
                      ),
                      width: 300,
                      height: 40,
                      padding:
                          EdgeInsets.symmetric(vertical: 2, horizontal: 14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(13.0)),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 160,
                    left: 20,
                    child: Text(
                      "Explore",
                      style: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.w900,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),

              // SizedBox(
              //   height: 20,
              // ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    //? Cafe
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CafeScreen()));
                      },
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundImage: AssetImage(
                              "lib/img/Explore/${exploreList[0].picture}.jpg",
                            ),
                          ),
                          Text(
                            "Restaurant",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    //? Cafe
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EventScreen()));
                      },
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundImage: AssetImage(
                              "lib/img/Explore/${exploreList[1].picture}.jpg",
                            ),
                          ),
                          Text(
                            "Event",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    //? Cafe
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChallangesScreen(
                                      screenSize: widget._screenSize,
                                    )));
                      },
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundImage: AssetImage(
                              "lib/img/Explore/${exploreList[2].picture}.jpg",
                            ),
                          ),
                          Text(
                            "${exploreList[2].title}",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    //? Cafe
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PrepareQuizScreen()));
                      },
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundImage: AssetImage(
                              "lib/img/Explore/${exploreList[3].picture}.jpg",
                            ),
                          ),
                          Text(
                            "Quiz",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    //? Cafe
                    TextButton(
                      onPressed: () {
                        final snackBar = SnackBar(
                          content: Text('Cooming Soon'),
                          action: SnackBarAction(
                            textColor: Colors.white,
                            label: 'Ok',
                            onPressed: () {},
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundImage: AssetImage(
                              "lib/img/Explore/${exploreList[4].picture}.jpg",
                            ),
                          ),
                          Text(
                            "${exploreList[4].title}",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    //? Cafe
                    TextButton(
                      onPressed: () {
                        final snackBar = SnackBar(
                          content: Text('Cooming Soon'),
                          action: SnackBarAction(
                            textColor: Colors.white,
                            label: 'Ok',
                            onPressed: () {},
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundImage: AssetImage(
                              "lib/img/Explore/${exploreList[5].picture}.jpg",
                            ),
                          ),
                          Text(
                            "${exploreList[5].title}",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    //? Cafe
                    TextButton(
                      onPressed: () {
                        final snackBar = SnackBar(
                          content: Text('Cooming Soon'),
                          action: SnackBarAction(
                            textColor: Colors.white,
                            label: 'Ok',
                            onPressed: () {},
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundImage: AssetImage(
                              "lib/img/Explore/${exploreList[6].picture}.jpg",
                            ),
                          ),
                          Text(
                            "${exploreList[6].title}",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "Sustanaibility Goal",
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TafeTargetsScreen()));
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: Color(0xff2C946F),
                              radius: 60,
                              backgroundImage: AssetImage(
                                "lib/img/new/TAFE.png",
                              ),
                            ),
                            Text(
                              "TAFE Target",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        var data = await http
                            .get(Uri.parse("http://3.16.123.62/api/tip/get/"));

                        if (data.statusCode == 200) {
                          var jsonData = json.decode(data.body);
                          if (!jsonData
                              .toString()
                              .contains("Response: False")) {
                            print(jsonData['Tip']['tip']);
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                backgroundColor: Color(0xffDC4624),
                                title: Row(
                                  children: [
                                    Icon(
                                      Icons.local_fire_department,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Today's Tip",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                                content: Text(
                                  "${jsonData['Tip']['tip']}",
                                  style: TextStyle(color: Colors.white),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'OK'),
                                    child: const Text(
                                      'OK',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            setState(() {});
                          }
                        } else {
                          print("FAILED");
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: Color(0xff2C946F),
                              radius: 60,
                              backgroundImage: AssetImage(
                                "lib/img/new/7901444.png",
                              ),
                            ),
                            Text(
                              "Tips",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GoalsScreen()));
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: Color(0xff2C946F),
                              radius: 60,
                              backgroundImage: AssetImage(
                                "lib/img/new/United nation goals.png",
                              ),
                            ),
                            Text(
                              "SDG Goals",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
