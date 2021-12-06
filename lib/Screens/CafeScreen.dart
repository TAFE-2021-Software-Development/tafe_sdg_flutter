import 'package:flutter/material.dart';
import 'package:sdg/Screens/FoodScreen.dart';
import 'package:sdg/Screens/TableBookingScreen.dart';

class CafeScreen extends StatelessWidget {
  const CafeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Positioned(
            bottom: 0,
            child: Image.asset(
              "lib/img/Woods.jpg",
              height: MediaQuery.of(context).size.height,
            ),
          ),
          Positioned(
            top: 70,
            left: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Column(
                  children: [
                    Text(
                      "TAFE Menu",
                      style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.w900,
                          color: Colors.white),
                    ),
                    Text(
                      "Enjoy delicious selection of food",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 190,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FoodScreen(
                            screenSize: MediaQuery.of(context).size,
                          ),
                        ),
                      );
                    },
                    child: Stack(
                      children: <Widget>[
                        Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      "lib/img/Explore/demi-deherrera-L-sm1B4L1Ns-unsplash.jpeg"))),
                        ),
                        Positioned(
                          top: 150,
                          left: 20,
                          child: Text(
                            "Food and Drink menu",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TableBookingScreen(),
                        ),
                      );
                    },
                    child: Stack(
                      children: <Widget>[
                        Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      "lib/img/Explore/restaurant_reservation_shutterstock_1570118485.jpg"))),
                        ),
                        Positioned(
                          top: 150,
                          left: 20,
                          child: Text(
                            "Book a table",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
