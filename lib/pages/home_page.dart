import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_1/components/location_info.dart';
import 'package:weather_app_1/components/mid_level_info.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app_1/secrets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<Map<String, dynamic>> getCurrentWeather() async {
    try {
      String cityName = 'Dhaka';
      final result = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&units=metric&APPID=$openWeatherAPIKey',
        ),
      );

      final data = jsonDecode(result.body);
      if (data['cod'] != '200') {
        throw 'An unexpected error accoured';
      }
      return data;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getCurrentWeather(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }
        final data = snapshot.data!;
        final weatherData = data['list'][0];
        final currentTemp = weatherData['main']['temp'];
        final currentSky = weatherData['weather'][0]['main'];

        final int timeStamp = weatherData['dt'];
        final DateTime date = DateTime.fromMillisecondsSinceEpoch(
          timeStamp * 1000,
          isUtc: true,
        );
        final dayName = DateFormat('EEEE').format(date);
        final dateTime = DateFormat('MMMM d, yyyy').format(date);
        final cityName = data['city']['name'];
        final countryName = data['city']['country'];
        final skyForcast = weatherData['weather'][0]['main'];
        final List<dynamic> forecastData = data['list'];

        return Scaffold(
          backgroundColor: skyForcast == 'Rain' ||
                  skyForcast == 'Thunderstorm' ||
                  skyForcast == 'Drizzle'
              ? const Color(0xFFB5D6D6)
              : const Color(0xFFCDECFC),
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 22, right: 22, top: 50),
                  child: LocationInfo(
                    cityName: cityName,
                    countryName: countryName,
                    date: dateTime,
                    temparature: currentTemp.toInt(),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                ),
                MidLevelInfo(
                  screenCheck: skyForcast,
                  sky: currentSky,
                  dayName: dayName,
                  forecastData: forecastData,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
