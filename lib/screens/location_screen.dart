import 'package:clima/screens/city_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  final LocationWeather;

  LocationScreen({@required this.LocationWeather});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = WeatherModel();
  @override
  void initState() {
    // ignore: unnecessary_statements

    getUi(widget.LocationWeather);
    print(widget.LocationWeather);
    super.initState();
  }

  int temp2;
  String idIcon;
  String temIcon;
  String name;

  void getUi(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        name = "Error";
        temp2 = 0;
        idIcon = "tey again";
        idIcon = "try again";
        return;
      }
      double temp = weatherData["main"]["temp"];
      temp2 = temp.toInt();
      int CondationIcon = weatherData["weather"][0]["id"];
      idIcon = weatherModel.getWeatherIcon(CondationIcon);
      temIcon = weatherModel.getMessage(temp2);
      name = weatherData["name"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      var weatherData1 =
                          await weatherModel.getLocationWeather();
                      getUi(weatherData1);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      var typeName = await Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CityScreen();
                      }));
                      print(typeName);
                      if (typeName != null) {
                        var weatherData =
                            await weatherModel.getCityName(typeName);
                        getUi(weatherData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temp2°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$idIcon',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$temIcon in $name",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
