import 'package:flutter/material.dart';

class LoginTextFieldContainer extends StatelessWidget {
  final Widget theChild;

  LoginTextFieldContainer({required this.theChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(13.0)),
      ),
      child: theChild,
    );
  }
}

class LoginButton extends StatelessWidget {
  final VoidCallback theOnPressed;
  final String theText;
  final Color theColor;
  final Color theTextColor;

  LoginButton(
      {required this.theOnPressed,
      required this.theText,
      required this.theColor,
      required this.theTextColor});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: theColor,
      borderRadius: BorderRadius.all(Radius.circular(15)),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Text(
          theText,
          style: TextStyle(
              color: theTextColor, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        onPressed: theOnPressed,
      ),
    );
  }
}
