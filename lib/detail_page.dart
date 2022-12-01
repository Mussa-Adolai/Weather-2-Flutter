import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';

class detailPage extends StatelessWidget {
  const detailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlowContainer(
      glowColor: Color(0xff00A1ff),
      color: Color(0xff00A1ff),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(68.0),
        bottomRight: Radius.circular(68.0),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 50, right: 30, left: 30, bottom: 20),
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
                    SizedBox(width: 8),
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
              children: [
                Container(
                  height: MediaQuery.of(context).size.width / 2.3,
                  width: MediaQuery.of(context).size.width / 2.3,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/sunny.png'),
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
                      height: 105,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          GlowText(
                            '33',
                            style: TextStyle(
                              fontSize: 100,
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
                    Text(
                      'Claude',
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
        ],
      ),
    );
  }
}
