import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const mapUrl = 'https://api.openweathermap.org/data/2.5/weather';
const apiKey = '02bd5a7e3d921a5a82a1976ede9c2d4e';

class WeatherModel {
  Future<dynamic> getWeatherData(String cityName) async {
    var uri = '${mapUrl}?q=$cityName&appid=${apiKey}&units=metric';
    NetWorking netWorking = NetWorking(uri);
    var decodeData = await netWorking.getData();
    return decodeData;
  }

  Future<dynamic> getLocationWeather() async {
    MyLocation location = MyLocation();
    await location.getLocation();
    NetWorking netWorking = NetWorking(
        '$mapUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var decodeData = await netWorking.getData();
    return decodeData;
  }

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
}
