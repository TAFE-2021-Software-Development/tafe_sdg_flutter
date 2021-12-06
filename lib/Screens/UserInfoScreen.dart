import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:sdg/Screens/HomeScreen.dart';
import 'package:sdg/Screens/RewardScreen.dart';

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({Key? key, required this.userName}) : super(key: key);
  final userName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/img/Woods.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            margin: EdgeInsets.only(top: 100),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Account Settings",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 50,
                ),
                CircleAvatar(
                  radius: 90,
                  backgroundImage: AssetImage(
                    "lib/img/cat-pp.png",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 30),
                  child: Text(
                    "$userName",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {},
                    child: Container(
                      width: 290,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xff2C946F),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Center(
                          child: Text(
                        "Account Information",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      )),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChallangesScreen(
                                    screenSize: MediaQuery.of(context).size,
                                  )));
                    },
                    child: Container(
                      width: 290,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xff2C946F),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Center(
                          child: Text(
                        "Loyalty Point",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      )),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 290,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xff2C946F),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Center(
                          child: Text(
                        "Sign Out",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
