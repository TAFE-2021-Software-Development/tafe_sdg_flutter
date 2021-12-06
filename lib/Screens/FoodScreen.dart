import 'package:flutter/material.dart';
import '../Items/AppItems.dart';
import '../Items/Constant.dart';

class FoodScreen extends StatefulWidget {
  FoodScreen({required this.screenSize});

  Size screenSize;

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  List<BigBoxButton> _cafeMenuWidgetList = [];

  List<Container> _cafeMenuWidgetListContainer = [];

  void _getCafeMenuContainerList() {
    for (int i = 0; i < menuList.length; i++) {
      _cafeMenuWidgetListContainer.add(Container(
        margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
        child: Center(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${menuList[i].title}",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff049867)),
                    ),
                    // Container(
                    //   child: Text("${menuList[i].description}",
                    //       style: TextStyle(
                    //           fontWeight: FontWeight.w600,
                    //           fontSize: 16,
                    //           color: Color(0xff049867))),
                    //   height: 20,
                    //   width: 100,
                    // ),

                    Container(
                        margin: EdgeInsets.only(top: 15),
                        padding:
                            EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                        child: Text(
                          "${menuList[i].price}",
                          style: TextStyle(
                            fontSize: 20,
                            // fontWeight: FontWeight.w500,
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          color: Colors.amberAccent,
                        )),
                  ],
                ),
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              "lib/img/Menu/${menuList[i].picture}.jpg"))),
                ),
              ],
            ),
          ),
        ),
      ));
    }
  }

  void _getCafeMenuBigButton() {
    for (int i = 0; i < menuList.length; i++) {
      _cafeMenuWidgetList.add(BigBoxButton(
        theChild: Center(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${menuList[i].title}",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff049867)),
                    ),
                    Image.asset(
                      "lib/img/Menu/${menuList[i].picture}.jpg",
                      height: 100,
                      width: 100,
                    ),
                    Text("see cafe menu",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Color(0xff049867))),
                  ],
                ),
                Text(
                  "${menuList[i].price}",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      color: Color(0xff049867)),
                ),
              ],
            ),
          ),
        ),
        theOnTap: () {
          print(menuList[i].price);
        },
        theWidth: widget.screenSize.width - 20,
      ));
    }
  }

  @override
  void initState() {
    super.initState();

    _getCafeMenuContainerList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff049867),
        title: Text("Restaurant Menu"),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: _cafeMenuWidgetListContainer,
          ),
        ),
      ),
    );
  }
}
