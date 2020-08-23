import 'dart:convert';
import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

//import 'package:geolocator/geolocator.dart';
const apiKey = "3b4d07b8b588abefb29c799e988d3db3";

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
//  void getLocation() async{
//    Position position =await
//    Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
//    print(position);
//  }

//  void getLocation() async {
//    Position position = await Geolocator()
//        .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
//    print(position);
//  }

//  @override
//  void initState() {
//    getLocation();
//
//    super.initState();
//  }

  @override
  void initState() {
    getLocation();
    getData();
    super.initState();
  }

  Future<void> getLocation() async {
    Location loc = Location();
    await loc.getCurrentLocation();
    print(loc.long);
    print(loc.lat);
  }

  Future<void> getData() async {
    http.Response response = await http.get(
        "https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=$apiKey");
    if (response.statusCode == 200) {
      var decodeData = jsonDecode(response.body);

      double temp = decodeData["main"]["temp"];
      int id = decodeData["weather"][0]["id"];
      String name = decodeData["name"];
      print(name);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
//        child: RaisedButton(
//          onPressed: () {
//            //Get the current location
//            getLocation();
//          },
//          child: Text('Get Location'),
//        ),
          ),
    );
  }
}
