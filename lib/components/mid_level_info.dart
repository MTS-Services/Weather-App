import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app_1/components/bottom_info.dart';

class MidLevelInfo extends StatelessWidget {
  const MidLevelInfo({
    super.key,
    required this.sky,
    required this.dayName,
    required this.forecastData,
    required this.screenCheck,
  });
  final String sky;
  final String dayName;
  final String screenCheck;
  final List<dynamic> forecastData;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    List<Widget> walkingWidget = [
      Positioned(
        top: -screenHeight * 0.25,
        right: screenWidth * 0.04,
        child: Image.asset(
          'assets/Sun.png',
          width: 110,
          height: 110,
        ),
      ),
      Positioned(
        top: -screenHeight * 0.28,
        right: screenWidth * 0.73,
        child: Image.asset(
          'assets/cloud.png',
          width: 60,
          height: 100,
        ),
      ),
      Positioned(
        top: -screenHeight * 0.35,
        right: screenWidth * 0.37,
        child: Image.asset(
          'assets/cloud.png',
          width: 70,
          height: 90,
        ),
      ),
      Positioned(
        top: -screenHeight * 0.175,
        left: -screenWidth * 0.2,
        child: Image.asset(
          'assets/walkingGirl.gif',
          height: screenHeight * 0.20,
          width: screenWidth * 0.999,
        ),
      ),
      Image.asset(
        'assets/Meadows.png',
        color: const Color(0xFFE7F7FF),
      ),
      Positioned(
        top: screenHeight * 0.07,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              dayName,
              style: GoogleFonts.josefinSans(
                  fontSize: 28, fontWeight: FontWeight.w700),
            ),
            Text(
              sky,
              style: GoogleFonts.josefinSans(
                  fontSize: 24, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
      BottomInfo(
        forecastData: forecastData,
      )
    ];
    List<Widget> rainGirlWidget = [
      Positioned(
        top: -screenHeight * 0.195,
        left: -screenWidth * 0.01,
        child: Image.asset(
          'assets/rainGirl.gif',
          height: screenHeight * 0.23,
          width: screenWidth * 0.999,
        ),
      ),
      Image.asset('assets/Meadows.png'),
      Positioned(
        top: screenHeight * 0.07,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              dayName,
              style: GoogleFonts.josefinSans(
                  fontSize: 28, fontWeight: FontWeight.w700),
            ),
            Text(
              sky,
              style: GoogleFonts.josefinSans(
                  fontSize: 24, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
      BottomInfo(
        forecastData: forecastData,
      )
    ];
    return SingleChildScrollView(
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: screenCheck == 'Rain' ||
                screenCheck == 'Thunderstorm' ||
                screenCheck == 'Drizzle'
            ? rainGirlWidget
            : walkingWidget,
      ),
    );
  }
}
