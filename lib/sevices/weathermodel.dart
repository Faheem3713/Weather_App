import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WeatherModel {
  Object getWeatherIcon(int condition) {
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
      return Icon(
        Icons.wb_sunny_rounded,
        size: 100,
        color: Colors.white70,
      );
    } else if (condition <= 804) {
      return Icon(
        FontAwesomeIcons.cloud,
        size: 110,
        color: Colors.white70,
      );
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

  String getDayString(int day) {
    switch (day) {
      case 1:
        return 'Mon,';
      case 2:
        return 'Tue,';
      case 3:
        return 'Wed,';
      case 4:
        return 'Thu,';
      case 5:
        return 'Fri,';
      case 6:
        return 'Sat,';
      case 7:
        return 'Sun,';
      default:
        return 'Error';
    }
  }

  String getMonthString(int month) {
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sept';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return 'Err';
    }
  }
}
