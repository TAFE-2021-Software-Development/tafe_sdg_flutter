import 'package:flutter/material.dart';
import 'package:sdg/Items/AppItems.dart';
import 'package:sdg/Items/LoginItems.dart';
import 'package:sdg/Screens/QuizScreen.dart';
import '../Items/Qestion.dart';

class ChallangesScreen extends StatefulWidget {
  ChallangesScreen({required this.screenSize});

  Size screenSize;

  @override
  _ChallangesScreenState createState() => _ChallangesScreenState();
}

class _ChallangesScreenState extends State<ChallangesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loyalty'),
        backgroundColor: Color(0xff049867),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BigBoxButton(
              theChild: Column(
                children: [
                  Text("Points"),
                  Text("${QuizScore.toString()}",
                      style: TextStyle(
                        fontSize: 100,
                        color: Colors.amber,
                      )),
                ],
              ),
              theOnTap: () {},
              theWidth: widget.screenSize.width - 20),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
