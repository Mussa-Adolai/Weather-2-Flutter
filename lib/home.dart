import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'baseWeatherData.dart';
import 'detail_page.dart';

String city = "London";

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
          TodayWeather(),
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
  var fNode = FocusNode();
  bool searchBar = false;
  // @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: GestureDetector(
        child: GlowContainer(
          //
          //height: MediaQuery.of(context).size.height - 230,
          margin: EdgeInsets.all(2.0),
          padding: EdgeInsets.only(top: 60.0, left: 30.0, right: 30.0),
          glowColor: Color(0xff00A1ff),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(68.0),
            bottomRight: Radius.circular(68.0),
          ),
          color: Color(0xff00A1ff),
          spreadRadius: 5.0,
          child: Column(
            children: <Widget>[
              Container(
                child: searchBar
                    ? TextField(
                        focusNode: fNode,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          // enabledBorder: OutlineInputBorder(
                          //   borderSide: BorderSide(
                          //     width: 3.0, color: Colors.cyan,
                          //   )
                          // ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          hintText: 'Enter a city',
                        ),
                        onSubmitted: (value) {
                          var temp;
                          if (temp == null) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: Colors.white,
                                  title: Text("City is not found !"),
                                  content: Text(
                                    "Please check the city name",
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Ok'),
                                    )
                                  ],
                                );
                              },
                            );
                          }
                        },
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            CupertinoIcons.square_grid_2x2,
                            color: Colors.white,
                          ),
                          Row(
                            children: [
                              Icon(
                                CupertinoIcons.map_fill,
                                color: Colors.white,
                              ),
                              GestureDetector(
                                onTap: () {
                                  searchBar = true;
                                  setState(() {});
                                  print('text F pressed');
                                  fNode.requestFocus();
                                },
                                child: Text(
                                  " " + city,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.more_vert,
                            color: Colors.white,
                          ),
                        ],
                      ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(width: 0.2, color: Colors.white),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Text(
                  'Updated',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                height: 280,
                // color: Colors.brown,
                child: Stack(
                  children: [
                    Image(
                      image: AssetImage('assets/sunny.png'),
                      fit: BoxFit.fill,
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Column(
                          children: [
                            GlowText(
                              "18",
                              style: TextStyle(
                                color: Colors.white,
                                height: 0.1,
                                fontWeight: FontWeight.bold,
                                fontSize: 40,
                              ),
                            ),
                            Text(
                              city,
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Nov 24 2022',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.white,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  WeatherDataColumn(
                    weatherIcon: CupertinoIcons.wind,
                    wInfo: '50 km/h',
                    wSection: 'Wind',
                  ),
                  WeatherDataColumn(
                    weatherIcon: CupertinoIcons.drop,
                    wInfo: '50 %',
                    wSection: 'Humidity',
                  ),
                  WeatherDataColumn(
                    weatherIcon: CupertinoIcons.cloud_drizzle,
                    wInfo: '50 km/h',
                    wSection: 'Rain',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TodayWeather extends StatelessWidget {
  const TodayWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        left: 30,
        right: 30,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Today',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) {
                      return detailPage();
                    }),
                  );
                },
                child: Row(
                  children: [
                    Text(
                      '7 Days',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios_outlined,
                        color: Colors.grey, size: 15),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Container(
            margin: EdgeInsets.only(bottom: 30),
            //
            // padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                todayWeatherInfo(),
                todayWeatherInfo(),
                todayWeatherInfo(),
                todayWeatherInfo(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class todayWeatherInfo extends StatelessWidget {
  const todayWeatherInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        margin: EdgeInsets.all(3),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(
            width: 0.2,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(35),
        ),
        child: Column(
          children: [
            Text(
              '17\u00b0',
              style: dayStyle,
            ),
            SizedBox(height: 5),
            Image.asset(
              'assets/sunny.png',
              height: 50,
              width: 50,
            ),
            SizedBox(height: 5),
            Text(
              '12:00',
              style: TextStyle(
                fontSize: 17,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
