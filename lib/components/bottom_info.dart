import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class BottomInfo extends StatefulWidget {
  const BottomInfo({super.key, required this.forecastData});
  final List<dynamic> forecastData;

  @override
  State<BottomInfo> createState() => _BottomInfoState();
}

class _BottomInfoState extends State<BottomInfo> {
  String selectedTab = 'Today';

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Positioned(
      bottom: -screenHeight * 0.263,
      child: Container(
        color: Colors.white,
        alignment: Alignment.center,
        width: screenWidth,
        height: screenHeight * 0.4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(Icons.navigate_before),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTab = 'Yesterday';
                    });
                  },
                  child: Text(
                    'Yesterday',
                    style: GoogleFonts.josefinSans(
                        fontSize: selectedTab == 'Yesterday' ? 22 : 20,
                        fontWeight: selectedTab == 'Yesterday'
                            ? FontWeight.bold
                            : FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTab = 'Today';
                    });
                  },
                  child: Text(
                    'Today',
                    style: GoogleFonts.josefinSans(
                        fontSize: selectedTab == 'Today' ? 22 : 20,
                        fontWeight: selectedTab == 'Today'
                            ? FontWeight.bold
                            : FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTab = 'Tomorrow';
                    });
                  },
                  child: Text(
                    'Tomorrow',
                    style: GoogleFonts.josefinSans(
                        fontSize: selectedTab == 'Tomorrow' ? 22 : 20,
                        fontWeight: selectedTab == 'Tomorrow'
                            ? FontWeight.bold
                            : FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
                const Icon(Icons.navigate_next),
              ],
            ),
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  final hourlyForecast = widget.forecastData[index + 1];
                  final hourlyTemp =
                      (hourlyForecast['main']['temp'] as num).toInt();

                  final hourlyTempIcon =
                      widget.forecastData[index + 1]['weather'][0]['main'];

                  final time = DateTime.parse(hourlyForecast['dt_txt']);
                  final hourlyTime = DateFormat.j().format(time);
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          color: Color(0xFFE7F7FF),
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(40),
                              top: Radius.circular(40))),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          children: [
                            Text(
                              hourlyTime,
                              style: GoogleFonts.josefinSans(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(height: 10),
                            hourlyTempIcon == 'Clear'
                                ? const Icon(Icons.sunny)
                                : hourlyTempIcon == 'Clouds'
                                    ? const Icon(Icons.cloud)
                                    : hourlyTempIcon == 'Rain' ||
                                            hourlyTempIcon == 'Thunderstorm' ||
                                            hourlyTempIcon == 'Drizzle'
                                        ? const Icon(Icons.cloud)
                                        : hourlyTempIcon == 'Snow'
                                            ? const Icon(Icons.ac_unit)
                                            : const Icon(Icons.sunny),
                            const SizedBox(height: 10),
                            Text(
                              '$hourlyTemp° C',
                              style: GoogleFonts.josefinSans(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
