import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/sevices/networking.dart';
import 'package:weather_app/sevices/weathermodel.dart';

class CityScreen extends StatefulWidget {
  final cityData;

  const CityScreen({Key? key, this.cityData}) : super(key: key);

  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  DateTime date = DateTime.now();
  int? condition;
  int? temperature;
  String? place;
  String text = '';

  @override
  void initState() {
    getCity(widget.cityData);

    super.initState();
  }

  Future<void> getCity(String text) async {
    final data = await Networking().getCity(
        'http://api.openweathermap.org/data/2.5/weather?q=$text&appid=7a8717cfb54fea32bdf6464917701593&units=metric');
    condition = data['weather'][0]['id'];
    double temp = data['main']['temp'];
    temperature = temp.toInt();
    place = data['name'];
    print(temperature);
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
            text = value;
          },
          decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () async {
                  await getCity(text);
                  setState(() {});
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
                '$temperature°',
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
