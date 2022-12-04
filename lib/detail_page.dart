import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'baseWeatherData.dart';

const dayStyle = TextStyle(
  fontSize: 20,
  color: Colors.white,
);

class detailPage extends StatelessWidget {
  const detailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff030317),
      body: Column(
        children: [
          GlowContainer(
            glowColor: Color(0xff00A1ff),
            color: Color(0xff00A1f),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(60.0),
              bottomRight: Radius.circular(60.0),
            ),
            child: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(top: 50, right: 30, left: 30, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            color: Colors.white,
                          ),
                          Text(
                            '7 Days',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      Icon(
                        Icons.more_vert,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.width / 2.3,
                        width: MediaQuery.of(context).size.width / 2.3,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/sunny_2d.png'),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Tomorrow',
                            style: TextStyle(
                              fontSize: 30,
                              height: 0.1,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            height: 108,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                GlowText(
                                  '33',
                                  style: TextStyle(
                                    fontSize: 100,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "/" + '15' + '\u00B0',
                                  style: TextStyle(
                                    fontSize: 40,
                                    color: Colors.black54.withOpacity(0.3),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Claud',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 20, right: 50, left: 50),
                  child: Column(
                    children: [
                      Divider(
                        color: Colors.white,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
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
                            wInfo: '50 %',
                            wSection: 'Rain',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: ListView.builder(
                //padding: EdgeInsets.only(top: 30),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 19),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Wed',
                          style: dayStyle,
                        ),
                        Container(
                          //color: Colors.brown,
                          // width: 135,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/sunny.png',
                                width: 40,
                              ),
                              Text(
                                'Clear',
                                style: dayStyle,
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              '+28\u00B0',
                              style: dayStyle,
                            ),
                            SizedBox(width: 5),
                            Text(
                              '+19\u00B0',
                              style: dayStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
