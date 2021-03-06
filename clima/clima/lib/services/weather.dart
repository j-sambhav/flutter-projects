import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const String apiKey = '8dc863db54b80428c55da370942efaba';

class WeatherModel {
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }

  String imageData(int temp) {
    if (temp > 25) {
      return 'images/hot.jpg';
    } else if (temp > 20) {
      return 'images/location_background.jpg';
    } else if (temp < 20) {
      return 'images/location_background.jpg';
    } else {
      print(temp);
      return 'images/hot.jpg';
    }
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();

    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        url:
            'http://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var decodedData = await networkHelper.getData();
    return decodedData;
  }

  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        url:
            'http://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=8dc863db54b80428c55da370942efaba&units=metric');

    var locatData = await networkHelper.getData();
    return locatData;
  }
}
