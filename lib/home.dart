import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff030317),
      body: Column(
        children: <Widget>[
          currentWeather(),
        ],
      ),
    );
  }
}

class currentWeather extends StatefulWidget {
  const currentWeather({Key? key}) : super(key: key);

  @override
  State<currentWeather> createState() => _currentWeatherState();
}

class _currentWeatherState extends State<currentWeather> {
  @override
  Widget build(BuildContext context) {
    var fNode = FocusNode();
    return GestureDetector(
      child: GlowContainer(
        height: MediaQuery.of(context).size.height - 230,
        margin: EdgeInsets.all(2.0),
        padding: EdgeInsets.only(top: 68.0, left: 30.0, right: 30.0),
        glowColor: Color(0xff00A1ff),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(68.0),
          bottomRight: Radius.circular(68.0),
        ),
        color: Color(0xff00A1ff),
        spreadRadius: 5.0,
        child: TextField(
          focusNode: fNode,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            hintText: 'Enter a city',
          ),
        ),
      ),
    );
  }
}
