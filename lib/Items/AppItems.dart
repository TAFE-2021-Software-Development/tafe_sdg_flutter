import 'package:flutter/material.dart';

class MiniBoxButton extends StatelessWidget {
  const MiniBoxButton({
    Key? key,
    required this.theChild,
    required this.theOnTap,
  }) : super(key: key);

  final Widget theChild;
  final VoidCallback theOnTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 6),
            blurRadius: 5,
            // spreadRadius: 20,
            color: Color(0xff049867).withOpacity(0.2),
          )
        ],
      ),
      child: TextButton(
        onPressed: theOnTap,
        child: Center(
          child: theChild,
        ),
      ),
    );
  }
}

class BigBoxButton extends StatelessWidget {
  const BigBoxButton({
    Key? key,
    required this.theChild,
    required this.theOnTap,
    required this.theWidth,
  }) : super(key: key);

  final Widget theChild;
  final VoidCallback theOnTap;
  final double theWidth;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: theOnTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        width: theWidth,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 6),
              blurRadius: 5,
              // spreadRadius: 20,
              color: Color(0xff049867).withOpacity(0.2),
            )
          ],
        ),
        child: Center(
          child: theChild,
        ),
      ),
    );
  }
}
