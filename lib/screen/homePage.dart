import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/screen/Locationscreen.dart';

import 'package:weather_app/sevices/Locationdata.dart';
import 'package:weather_app/sevices/networking.dart';
import 'package:weather_app/utilities/constants.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void toGet() async {
    final data = await locationData().getLocation();
    final decoded = await Networking().getData(
        'http://api.openweathermap.org/data/2.5/weather?lat=${data.latitude}&lon=${data.longitude}&appid=$apiKey&units=metric');
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LocationScreen(
            weatherData: decoded,
          ),
        ));
  }

  @override
  void initState() {
    toGet();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SpinKitSpinningLines(color: Colors.white),
      ),
    );
  }
}
