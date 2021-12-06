import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Items/Auth.dart' as auth;

class EventScreen extends StatefulWidget {
  const EventScreen({Key? key}) : super(key: key);

  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _testJ();
  }

  _testJ() async {
    var data = await http.get(Uri.parse("http://3.16.123.62/api/events/all/"));

    if (data.statusCode == 200) {
      var jsonData = json.decode(data.body);
      if (!jsonData.toString().contains("Response: False")) {
        print(jsonData[1]['name']);
      } else {}
    } else {
      print("FAILED");
    }
  }

  Future<List<EventCard>> _getCards() async {
    List<EventCard> theCardList = [];
    var data = await http.get(Uri.parse("http://3.16.123.62/api/events/all/"));

    if (data.statusCode == 200) {
      var jsonData = json.decode(data.body);
      if (!jsonData.toString().contains("Response: False")) {
        setState(() {
          for (int i = 0; i < jsonData.length; i++) {
            theCardList.add(
              EventCard(
                name: jsonData[i]['name'],
                description: jsonData[i]['description'],
                id: jsonData[i]['id'],
                location: jsonData[i]['location'],
                maxAttendees: jsonData[i]['maxAttendees'],
                imgLink: jsonData[i]['imageLink'],
              ),
            );
          }
        });
      } else {}
    } else {
      print("FAILED");
    }

    return theCardList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Event"),
      ),
      body: FutureBuilder(
        future: _getCards(),
        builder:
            (BuildContext context, AsyncSnapshot<List<EventCard>> snapshot) {
          if (snapshot.data == null) {
            return Center(child: CircularProgressIndicator.adaptive());
          } else {
            return SingleChildScrollView(
                child: Column(children: snapshot.data!));
          }
        },
      ),
    );
  }
}

class EventCard extends StatefulWidget {
  final id;
  final name;
  final maxAttendees;
  final description;
  final location;
  final imgLink;

  const EventCard({
    Key? key,
    required this.id,
    required this.name,
    required this.maxAttendees,
    required this.description,
    required this.location,
    required this.imgLink,
  }) : super(key: key);

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  String dropdownValue = '1';
  var dropList = <String>['1', '2'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    dropList = <String>[];

    for (var i = 1; i <= widget.maxAttendees; i++) {
      dropList.add(i.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        print(this.widget.id);

        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return StatefulBuilder(builder: (BuildContext context,
                StateSetter setState /*You can rename this!*/) {
              return Container(
                height: 300,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text('${this.widget.name}',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 20,
                    ),
                    Text('Attendees'),
                    DropdownButton<String>(
                      value: dropdownValue,
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Colors.blueAccent),
                      underline: Container(
                        height: 2,
                        color: Colors.blueAccent,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      items: dropList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      child: Text('Register'),
                      onPressed: () async {
                        print(dropdownValue);
                        var url = Uri.parse(
                            'http://3.16.123.62/api/events/register/');
                        var response =
                            await http.post(url, headers: <String, String>{
                          'Authorization': 'Token ${auth.token}',
                        }, body: {
                          'user': '${auth.id}',
                          'event': '${this.widget.id}',
                          'attendees': dropdownValue,
                        });
                        if (response.statusCode == 200) {
                          var finalResponse = await jsonDecode(response.body);
                          if (!finalResponse
                              .toString()
                              .contains("Response: False")) {
                            print('Response status: ${response.statusCode}');
                            print("Response body: ${finalResponse['message']}");

                            print("Token = " + auth.token);
                            final snackBar = SnackBar(
                              content: Text('Booking Succed'),
                              action: SnackBarAction(
                                textColor: Colors.white,
                                label: 'Ok',
                                onPressed: () {},
                              ),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                            Navigator.pop(context);
                          } else {}
                        } else {
                          print("FAILED");
                          print("Token = " + auth.token);
                        }
                      },
                    )
                  ],
                ),
              );
            });
          },
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        width: MediaQuery.of(context).size.width,
        height: 300,
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
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.amberAccent,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Text(
                  "${widget.name}",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      color: Colors.black54),
                ),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: SingleChildScrollView(
                          child: Text(
                            "${widget.description}",
                          ),
                        ),
                        width: MediaQuery.of(context).size.width / 2 - 35,
                        height: 110,
                      ),
                      SizedBox(height: 15),
                      Text("Max Attendees: ${widget.maxAttendees}"),
                      SizedBox(height: 15),
                      Icon(Icons.location_on),
                      SizedBox(height: 5),
                    ],
                  ),
                  Container(
                    height: MediaQuery.of(context).size.width / 2 - 50,
                    width: MediaQuery.of(context).size.width / 2 - 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: Colors.white,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage("${widget.imgLink}"))),
                  ),
                ],
              ),
              Container(
                child: SingleChildScrollView(
                  child: Text("${widget.location}"),
                ),
                width: MediaQuery.of(context).size.width,
                height: 35,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
