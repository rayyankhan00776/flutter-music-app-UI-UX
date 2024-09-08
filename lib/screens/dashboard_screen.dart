import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lms_system/screens/setting_page.dart';
import 'package:percent_indicator/percent_indicator.dart';

class dashboard extends StatefulWidget {
  const dashboard({super.key});

  @override
  State<dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<dashboard> {
  bool changeicon = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Padding(
          padding: const EdgeInsets.only(left: 70.0),
          child: Text(
            "P L A Y L I S T ",
            style: GoogleFonts.lato(textStyle: const TextStyle(fontSize: 25)),
          ),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
                child: Center(
              child: Icon(Icons.music_note),
            )),
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => setting_page()));
                },
                child: ListTile(
                  title: Text(
                    "S E T T I N G",
                    style: GoogleFonts.lato(
                        textStyle: const TextStyle(fontSize: 20)),
                  ),
                  leading: Icon(Icons.settings),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 30),
            child: Container(
              height: 350,
              width: 350,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      offset: Offset(5, 5),
                      blurRadius: 2,
                      spreadRadius: 1),
                  BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5, -5),
                      blurRadius: 4,
                      spreadRadius: 2),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    width: 330,
                    height: 300,
                    child: Image.asset(
                      "Pics/87495397_670362460398946_6659500380478504960_n.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 14.0),
                          child: Text(
                            "maha ki batein",
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(fontSize: 19)),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 14.0),
                          child: Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 27,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 405.0, left: 41),
            child: LinearPercentIndicator(
              width: 330.0,
              lineHeight: 10.0,
              percent: 0.6,
              backgroundColor: Colors.grey,
              progressColor: Colors.red,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 430.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("2:50"),
                Icon(Icons.shuffle),
                Icon(Icons.repeat),
                Text("4:27"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 490.0, left: 23),
            child: SizedBox(
              height: 80,
              child: Row(
                children: [
                  Container(
                    height: 90,
                    width: 99,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            offset: Offset(5, 5),
                            blurRadius: 2,
                            spreadRadius: 1),
                        BoxShadow(
                            color: Colors.white,
                            offset: Offset(-5, -5),
                            blurRadius: 4,
                            spreadRadius: 2),
                      ],
                    ),
                    child: Icon(Icons.skip_previous),
                  ),
                  GestureDetector(
                    onTap: () async {
                      setState(() {
                        changeicon = !changeicon;
                      });
                    },
                    child: Container(
                      height: 90,
                      width: 160,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              offset: Offset(5, 5),
                              blurRadius: 2,
                              spreadRadius: 1),
                          BoxShadow(
                              color: Colors.white,
                              offset: Offset(-5, -5),
                              blurRadius: 4,
                              spreadRadius: 2),
                        ],
                      ),
                      child: changeicon
                          ? Icon(Icons.pause)
                          : Icon(Icons.play_arrow),
                    ),
                  ),
                  Container(
                    height: 90,
                    width: 99,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            offset: Offset(5, 5),
                            blurRadius: 2,
                            spreadRadius: 1),
                        BoxShadow(
                            color: Colors.white,
                            offset: Offset(-5, -5),
                            blurRadius: 4,
                            spreadRadius: 2),
                      ],
                    ),
                    child: Icon(Icons.skip_next),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
