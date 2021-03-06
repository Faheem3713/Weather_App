import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/screen/city.dart';
import 'package:weather_app/sevices/networking.dart';
import 'package:weather_app/sevices/weathermodel.dart';

class LocationScreen extends StatefulWidget {
  final weatherData;

  const LocationScreen({Key? key, this.weatherData}) : super(key: key);
  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  DateTime date = DateTime.now();
  int? condition;
  int? temperature;
  String? place;
  String? text;

  void getWeather() {
    condition = widget.weatherData['weather'][0]['id'];
    double temp = widget.weatherData['main']['temp'];
    temperature = temp.toInt();
    place = widget.weatherData['name'];
  }

  @override
  void initState() {
    getWeather();
    print(condition);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF334960),
        elevation: 0,
        title: TextField(
          onChanged: (value) {
            setState(() {
              text = value;
            });
          },
          decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () async {
                  await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CityScreen(
                          cityData: text,
                        ),
                      ));
                },
                icon: Icon(FontAwesomeIcons.search),
                color: Colors.black54,
              ),
              hintText: 'Enter city name',
              border: OutlineInputBorder(),
              fillColor: Colors.white70,
              filled: true),
        ),
      ),
      backgroundColor: Color(0xFF334960),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$place",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text(
                      '${WeatherModel().getDayString(date.weekday)} ${date.day} ${WeatherModel().getMonthString(date.month)}',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: WeatherModel().getWeatherIcon(condition!) as Widget,
              ),
              Text(
                '$temperature??',
                style: TextStyle(fontSize: 50, color: Colors.white70),
              ),
              Text(WeatherModel().getMessage(temperature!),
                  style: TextStyle(color: Colors.white, fontSize: 20))
            ],
          ),
        ),
      ),
    );
  }
}
