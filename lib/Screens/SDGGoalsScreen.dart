import 'package:flutter/material.dart';

class GoalsScreen extends StatelessWidget {
  const GoalsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("17 SDG Goals"),
        backgroundColor: Color(0xff2C946F),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Image(
            image: AssetImage('lib/img/new/goals.png'),
          ),
        ),
      ),
    );
  }
}
