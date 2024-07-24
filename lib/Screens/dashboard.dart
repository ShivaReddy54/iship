// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:iship/Screens/level_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<List> data = [];
  num _sessions=0,_attended=0;
  List<List<bool>> isClicked = [
    [false, false, false],
    [false, false, false],
    [false, false, false],
  ];

  @override
  void initState() {
    super.initState();
    data=[
            [
              {
                "icon": "https://cdn-icons-png.flaticon.com/512/2784/2784461.png",
                "title": "Jumbled Words",
                "topic": "Verbal Ability",
                "sessions": 20,
                "attended": 16
              },
              {
                "icon": "https://cdn-icons-png.flaticon.com/512/2784/2784461.png",
                "title": "Numerical",
                "topic": "Reasoning",
                "sessions": 20,
                "attended": 16
              },
              {
                "icon": "https://cdn-icons-png.flaticon.com/512/2784/2784461.png",
                "title": "Blood Relations",
                "topic": "Apptitude",
                "sessions": 20,
                "attended": 16
              },
              {
                "icon": "https://cdn-icons-png.flaticon.com/512/2784/2784461.png",
                "title": "Jumbled Words",
                "topic": "Verbal Ability",
                "sessions": 20,
                "attended": 16
              },
              {
                "icon": "https://cdn-icons-png.flaticon.com/512/2784/2784461.png",
                "title": "Numerical",
                "topic": "Reasoning",
                "sessions": 20,
                "attended": 16
              },
              {
                "icon": "https://cdn-icons-png.flaticon.com/512/2784/2784461.png",
                "title": "Blood Relations",
                "topic": "Apptitude",
                "sessions": 20,
                "attended": 16
              },
            ],
            [
              {
                "icon": "https://cdn-icons-png.flaticon.com/512/2784/2784461.png",
                "title": "Jumbled Words",
                "topic": "Verbal Ability",
                "sessions": 20,
                "attended": 8
              },
              {
                "icon": "https://cdn-icons-png.flaticon.com/512/2784/2784461.png",
                "title": "Numerical",
                "topic": "Reasoning",
                "sessions": 20,
                "attended": 18
              },
              {
                "icon": "https://cdn-icons-png.flaticon.com/512/2784/2784461.png",
                "title": "Blood Relations",
                "topic": "Apptitude",
                "sessions": 20,
                "attended": 16
              },
              {
                "icon": "https://cdn-icons-png.flaticon.com/512/2784/2784461.png",
                "title": "Jumbled Words",
                "topic": "Verbal Ability",
                "sessions": 20,
                "attended": 19
              },
              {
                "icon": "https://cdn-icons-png.flaticon.com/512/2784/2784461.png",
                "title": "Numerical",
                "topic": "Reasoning",
                "sessions": 20,
                "attended": 10
              },
              {
                "icon": "https://cdn-icons-png.flaticon.com/512/2784/2784461.png",
                "title": "Blood Relations",
                "topic": "Apptitude",
                "sessions": 20,
                "attended": 16
              },
            ],
            [
              {
                "icon": "https://cdn-icons-png.flaticon.com/512/2784/2784461.png",
                "title": "Jumbled Words",
                "topic": "Verbal Ability",
                "sessions": 36,
                "attended": 36
              },
              {
                "icon": "https://cdn-icons-png.flaticon.com/512/2784/2784461.png",
                "title": "Numerical",
                "topic": "Reasoning",
                "sessions": 14,
                "attended": 5
              },
              {
                "icon": "https://cdn-icons-png.flaticon.com/512/2784/2784461.png",
                "title": "Blood Relations",
                "topic": "Apptitude",
                "sessions": 29,
                "attended": 25
              },
              {
                "icon": "https://cdn-icons-png.flaticon.com/512/2784/2784461.png",
                "title": "Jumbled Words",
                "topic": "Verbal Ability",
                "sessions": 42,
                "attended": 16
              },
              {
                "icon": "https://cdn-icons-png.flaticon.com/512/2784/2784461.png",
                "title": "Numerical",
                "topic": "Reasoning",
                "sessions": 44,
                "attended": 23
              },
              {
                "icon": "https://cdn-icons-png.flaticon.com/512/2784/2784461.png",
                "title": "Blood Relations",
                "topic": "Apptitude",
                "sessions": 20,
                "attended": 16
              },
            ],
            [
              {
                "icon": "https://cdn-icons-png.flaticon.com/512/2784/2784461.png",
                "title": "Jumbled Words",
                "topic": "Verbal Ability",
                "sessions": 20,
                "attended": 16
              },
              {
                "icon": "https://cdn-icons-png.flaticon.com/512/2784/2784461.png",
                "title": "Numerical",
                "topic": "Reasoning",
                "sessions": 20,
                "attended": 16
              },
              {
                "icon": "https://cdn-icons-png.flaticon.com/512/2784/2784461.png",
                "title": "Blood Relations",
                "topic": "Apptitude",
                "sessions": 20,
                "attended": 16
              },
              {
                "icon": "https://cdn-icons-png.flaticon.com/512/2784/2784461.png",
                "title": "Jumbled Words",
                "topic": "Verbal Ability",
                "sessions": 20,
                "attended": 16
              },
              {
                "icon": "https://cdn-icons-png.flaticon.com/512/2784/2784461.png",
                "title": "Numerical",
                "topic": "Reasoning",
                "sessions": 20,
                "attended": 16
              },
              {
                "icon": "https://cdn-icons-png.flaticon.com/512/2784/2784461.png",
                "title": "Blood Relations",
                "topic": "Apptitude",
                "sessions": 20,
                "attended": 16
              },
            ],
            [
              {
                "icon": "https://cdn-icons-png.flaticon.com/512/2784/2784461.png",
                "title": "Jumbled Words",
                "topic": "Verbal Ability",
                "sessions": 20,
                "attended": 16
              },
              {
                "icon": "https://cdn-icons-png.flaticon.com/512/2784/2784461.png",
                "title": "Numerical",
                "topic": "Reasoning",
                "sessions": 20,
                "attended": 16
              },
              {
                "icon": "https://cdn-icons-png.flaticon.com/512/2784/2784461.png",
                "title": "Blood Relations",
                "topic": "Apptitude",
                "sessions": 20,
                "attended": 16
              },
              {
                "icon": "https://cdn-icons-png.flaticon.com/512/2784/2784461.png",
                "title": "Jumbled Words",
                "topic": "Verbal Ability",
                "sessions": 20,
                "attended": 16
              },
              {
                "icon": "https://cdn-icons-png.flaticon.com/512/2784/2784461.png",
                "title": "Numerical",
                "topic": "Reasoning",
                "sessions": 20,
                "attended": 16
              },
              {
                "icon": "https://cdn-icons-png.flaticon.com/512/2784/2784461.png",
                "title": "Blood Relations",
                "topic": "Apptitude",
                "sessions": 20,
                "attended": 16
              },
            ],
        ];
    for(int i=0;i<data.length;i++){
      for(int j=0;j<data[i].length;j++){
        _sessions+=data[i][j]["sessions"];
        _attended+=data[i][j]["attended"];
      }
    }
    setState(() {
      _sessions=_sessions;
      _attended=_attended;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.white,
          body: (data.isNotEmpty)?SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(height: 42),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: const Color(0xFF4d4d4d),
                        boxShadow: const [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.grey,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              const SizedBox(height: 25),
                              const Row(
                                children: [
                                  SizedBox(width: 20),
                                  Text(
                                    "Next Session - Time & Speed",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              const Row(
                                children: [
                                  SizedBox(width: 20),
                                  Text(
                                    "03H: 30M: 30Sec",
                                    style: TextStyle(
                                      color: Color(0xFF967d29),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  const SizedBox(width: 20),
                                  InkWell(
                                    child: Container(
                                      height: 35,
                                      width: 90,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.0),
                                        color: Colors.white,
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Join Here",
                                          style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    onTap: () async {
                                      await launchUrlString("https://cl.gy/yFLsW");
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Positioned(
                            right: 0,
                            top: -10,
                            child: Image.network(
                              "https://cdn-icons-png.flaticon.com/512/2784/2784461.png",
                              height: 200,
                              width: 120,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    children: [
                      SizedBox(width: 15),
                      Text(
                        "Stats",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  _createStatContainer(
                      "$_sessions", "Total Sessions", Colors.orange, 24.0, 0),
                  _createStatContainer("$_attended", "Attended Sessions",
                      const Color(0xFF05872d), 15.0, 1),
                  _createStatContainer("${(_attended/_sessions*100).toInt()}%", "Attended Percentage",
                      const Color(0xFF75bc1e), 15.0, 2),
                  const SizedBox(height: 10),
                  const Row(
                    children: [
                      SizedBox(width: 15),
                      Text(
                        "Complexity Level",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    spacing: 10.0,
                    runSpacing: 10.0,
                    children: List.generate(data.length, (index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LevelPage(
                                        level: index + 1,
                                        data: data[index],
                                      )));
                        },
                        child: Container(
                            width: 160.0, // Set the width of each container
                            height: 100.0, // Set the height of each container
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                                border: Border.all(
                                  color: Colors.black.withOpacity(0.3),
                                  width: 1.0,
                                )),
                            alignment: Alignment.center,
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(16.0),
                                  child: CustomPaint(
                                    size: Size(169,
                                        99), // Set the size of the custom paint area
                                    painter: MyCustomPaint(),
                                  ),
                                ),
                                Positioned(
                                  child: Text(
                                    "Level",
                                    style: TextStyle(fontSize: 23),
                                  ),
                                  left: 15,
                                  top: 13,
                                ),
                                Positioned(
                                  right: 15,
                                  bottom: 10,
                                  child: Text(
                                    index + 1 < 10
                                        ? "0${index + 1}"
                                        : "${index + 1}",
                                    style: TextStyle(
                                      color: Colors.yellow,
                                      fontSize: 35.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ):Center(child: CircularProgressIndicator(),)
        ),
    );
  }

  List calculate(topic) {
    num totalSessions = 0, attendedSessions = 0;

    for (int i = 0; i < data.length; i++) {
      for (int j = 0; j < data[i].length; j++) {
        if (data[i][j]["topic"][0] == topic) {
          totalSessions += data[i][j]["sessions"];
          attendedSessions += data[i][j]["attended"];
        }
      }
    }

    return [totalSessions, attendedSessions];
  }

  Widget _createStatContainer(String percentage, String text, Color backColor, double size, row) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(
          color: backColor,
          borderRadius: BorderRadius.circular(7.0),
          boxShadow: const [
            BoxShadow(
              spreadRadius: 1,
              blurRadius: 10,
              color: Colors.grey,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(1.0),
                ),
                child: Center(
                  child: Row(
                    children: [
                      const SizedBox(width: 7),
                      Text(
                        percentage,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 7),
                      Text(
                        text,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            category("V", calculate("V"), Color(0xFF05872d), Colors.white,
                false, row, 0),
            category("R", calculate("R"), Color(0xFF75bc1e), Colors.black,
                false, row, 1),
            category("A", calculate("A"), Color(0xFFffbb00), Color(0xFF0d8114),
                true, row, 2),
          ],
        ),
      ),
    );
  }

  Widget category(frontText, backText, bgColor, textColor, isCurved, row, col) {
    return Expanded(
      child: InkWell(
        onTap: () {
          bool t = isClicked[row][col];
          isClicked[row] = [false, false, false];
          isClicked[row][col] = !t;

          setState(() {});
        },
        child: Container(
          decoration: BoxDecoration(
              color: bgColor,
              borderRadius: isCurved
                  ? BorderRadius.only(
                      topRight: Radius.circular(7.0),
                      bottomRight: Radius.circular(7.0),
                    )
                  : BorderRadius.circular(1.0)),
          child: Center(
            child: Text(
              isClicked[row][col]
                  ? "${(row == 0) ? backText[0] : (row == 1) ? backText[1] : (backText[1] / backText[0] * 100).toInt()}"
                  : frontText,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _createComplexityCont() {
  return Container(
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(16.0),
      border: Border.all(
        color: Colors.black.withOpacity(0.3),
        width: 1.0,
      ),
    ),
  );
}

class MyCustomPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double h = size.height;
    double w = size.width;
    Paint paint = Paint();
    Path path = Path();

    path.moveTo(0, h); // Start at bottom-left corner
    path.lineTo(w, 0); // Move to top-right corner
    path.lineTo(w, h); // Move to bottom-right corner
    path.close(); // Close the path

    paint.color = Color(0xFF05872d);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
