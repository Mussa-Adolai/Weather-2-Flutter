import 'package:flutter/material.dart';

class WeatherDataColumn extends StatelessWidget {
  WeatherDataColumn(
      {this.weatherIcon, required this.wInfo, required this.wSection});
  late final IconData? weatherIcon;
  late final String wInfo;
  late final String wSection;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        Icon(
          // CupertinoIcons.drop,
          weatherIcon,
          color: Colors.white,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          wInfo,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          wSection,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
