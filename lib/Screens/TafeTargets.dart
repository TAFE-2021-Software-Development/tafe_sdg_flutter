import 'package:flutter/material.dart';

class TafeTargetsScreen extends StatelessWidget {
  const TafeTargetsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TAFE Targets"),
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
