import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/screens/city_screen.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});

  final locationWeather;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String cityName;
  double temperature;
  int condition;
  String imageAdd;
  String dispTemp;
  String weatherIcon;
  String message;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var decodedData = widget.locationWeather;
    updateUI(decodedData);
  }

  WeatherModel weatherModel = WeatherModel();

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        cityName = 'retrieving data';
        dispTemp = '0';
        weatherIcon = "Error.";
        message = 'ERROR';
        imageAdd = 'images/location_background.jpg';
        return;
      }
      cityName = weatherData['name'];
      temperature = weatherData['main']['temp'];
      condition = weatherData['weather'][0]['id'];
      dispTemp = temperature.toStringAsFixed(0);
      weatherIcon = weatherModel.getWeatherIcon(condition);
      imageAdd = weatherModel.imageData(temperature.roundToDouble().toInt());
      message = weatherModel.getMessage(temperature.toInt());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imageAdd),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      updateUI(await weatherModel.getLocationWeather());
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      var typed = await Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CityScreen();
                      }));

                      if (typed != null) {
                        print(typed);
                        var weatherData =
                            await weatherModel.getCityWeather(cityName = typed);
                        updateUI(weatherData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$dispTemp° ',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Container(
                height: 150,
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$message in $cityName",
                  textAlign: TextAlign.center,
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
