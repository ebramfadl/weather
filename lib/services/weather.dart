import 'package:weather/services/location.dart';
import 'package:weather/services/networking.dart';

const apiKey = 'e72ca729af228beabd5d20e3b7749713';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class Weather{
  
  Future<dynamic> getCityWeather(String cityName) async{
    Network network = Network(url: '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric');
    var weatherData = await network.getData();
    return weatherData;
  }
  
  Future<dynamic> getLocationWeather() async{
    Location location = Location();
    await location.getCurrentLocation();
    Network network = Network(url: '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    var weather = await network.getData();
    return weather;
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