import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Items/Auth.dart' as auth;

class TableBookingScreen extends StatefulWidget {
  const TableBookingScreen({Key? key}) : super(key: key);

  @override
  _TableBookingScreenState createState() => _TableBookingScreenState();
}

class _TableBookingScreenState extends State<TableBookingScreen> {
  String date = "";
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  String _phone = "";
  String dropdownValue = '1';
  String chosenTime = "Select Date";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Table Booking'),
        backgroundColor: Color(0xff049867),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 25),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(13.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.15),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ]),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.phone_android_rounded,
                        color: Color(0xff2C946F),
                      ),
                      fillColor: Color(0xff2C946F),
                      hintText: 'Phone',
                      hintStyle: TextStyle(
                        color: Color(0xff2C946F),
                      ),
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      _phone = value;
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 25),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(13.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.15),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ]),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Guests",
                          style: TextStyle(color: Color(0xff2C946F)),
                        ),
                        DropdownButton<String>(
                          value: "1",
                          icon: Icon(Icons.arrow_downward,
                              color: Color(0xff2C946F)),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(color: Color(0xff2C946F)),
                          underline: Container(
                            height: 2,
                            color: Color(0xff2C946F),
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                          items: <String>["1", "2", "3", "4", "5"]
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ]),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  // padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(13.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.15),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ]),
                  child: TextButton(
                    onPressed: () async {
                      await _selectDate(context);

                      var xx = selectedDate.toString();

                      var xxy = xx.substring(0, 10);

                      await _selectTime(context);

                      print(selectedTime.toString());
                      var x = selectedTime.toString();
                      var xy = x.substring(10, 15);

                      var finalChoice = xxy + " " + xy + ":00";

                      setState(() {
                        chosenTime = finalChoice;
                      });
                    },
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Date Time",
                            style: TextStyle(
                                color: Color(0xff2C946F),
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          SizedBox(height: 6),
                          Text(
                            "$chosenTime",
                            style: TextStyle(color: Color(0xff2C946F)),
                          ),
                        ]),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  // padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                  decoration: BoxDecoration(
                      color: Color(0xff2C946F),
                      borderRadius: BorderRadius.all(Radius.circular(13.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.15),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ]),
                  child: TextButton(
                    onPressed: () async {
                      var url =
                          Uri.parse('http://3.16.123.62/api/restaurant/book/');
                      var response =
                          await http.post(url, headers: <String, String>{
                        'Authorization': 'Token ${auth.token}',
                      }, body: {
                        'phone': '$_phone',
                        'guests': '$dropdownValue',
                        'datetime': "$chosenTime",
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
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else {}
                      } else {
                        print("FAILED");
                        print("Token = " + auth.token);
                        print(chosenTime);
                      }
                    },
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Submit",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate)
      setState(() {
        selectedDate = selected;
      });
  }

  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(() {
        selectedTime = timeOfDay;
      });
    }
  }
}
