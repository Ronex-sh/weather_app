import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = "3b4d07b8b588abefb29c799e988d3db3";
const openWeatherMapUrl = "https://samples.openweathermap.org/data/2.5/weather";

class WeatherModel {
  Future<dynamic> getCityName(String cityName) async {
    Network net = Network("$openWeatherMapUrl?q=$cityName&appid=$apiKey");
    var weatherData = await net.getDate();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location loc = Location();
    await loc.getCurrentLocation();
    Network net = Network(
        "$openWeatherMapUrl?lat=${loc.lat}&lon=${loc.long}&appid=$apiKey");
    var weatherData = await net.getDate();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
