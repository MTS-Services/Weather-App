import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationInfo extends StatelessWidget {
  const LocationInfo(
      {super.key,
      required this.temparature,
      this.date,
      required this.cityName,
      required this.countryName});
  final dynamic temparature;
  final dynamic date;
  final String cityName;
  final String countryName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              date,
              style: GoogleFonts.josefinSans(
                  fontSize: 20, fontWeight: FontWeight.w500),
            ),
            Row(
              children: [
                Text(
                  '$cityName, ',
                  style: GoogleFonts.josefinSans(
                      fontSize: 20, fontWeight: FontWeight.w400),
                ),
                Text(
                  countryName,
                  style: GoogleFonts.josefinSans(
                      fontSize: 20, fontWeight: FontWeight.w400),
                ),
              ],
            )
          ],
        ),
        Text(
          '$temparature °C',
          style: GoogleFonts.josefinSans(
              fontSize: 35, fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
