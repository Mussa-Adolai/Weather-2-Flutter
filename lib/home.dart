import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';

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
    return GestureDetector(
      child: GlowContainer(
        height: MediaQuery.of(context).size.height - 230,
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
                Column(
                  children: [
                    Icon(
                      CupertinoIcons.wind,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('50' + 'km/h'),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Wind'),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      CupertinoIcons.drop,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('50' + '%'),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Humidity'),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      CupertinoIcons.cloud_drizzle_fill,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('50' + 'km/h'),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Rain'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
