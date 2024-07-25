// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class LevelPage extends StatefulWidget {
  const LevelPage({super.key, required this.level, required this.data});

  final int level;
  final List data;

  @override
  State<LevelPage> createState() => _LevelPageState();
}

class _LevelPageState extends State<LevelPage> {
  num _verbal = 0;
  num _reasoning = 0;
  num _apptitude = 0;
  num _sessions = 0;
  num _attended = 0;

  List _data = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _data = widget.data;
      for (Map i in _data) {
        if (i['topic'][0] == 'V')
          _verbal += i['attended'];
        else if (i['topic'][0] == 'R')
          _reasoning += i['attended'];
        else
          _apptitude += i['attended'];
        _sessions += i['sessions'];
      }
      _attended = _verbal + _reasoning + _apptitude;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Level - ${(widget.level < 10) ? "0${widget.level}" : widget.level}",
          style: TextStyle(
              color: Color.fromRGBO(13, 131, 70, 1),
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 4,
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.filter_alt,
                    size: 25,
                  ))
            ],
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          children: [
            Session(),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _data.length,
              itemBuilder: (context, index) {
                return Container(
                    width: double.infinity,
                    height: 90,
                    margin: EdgeInsets.only(top: 15),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 3,
                              spreadRadius: -5,
                              offset: Offset(0, 5)),
                        ],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            width: 1, color: Colors.grey.withOpacity(0.2))),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: (_data[index]['topic'][0] == 'V')
                                            ? AssetImage("assets/Verbal.png")
                                            : (_data[index]['topic'][0] == 'R')
                                                ? AssetImage(
                                                    "assets/Reasoning.png")
                                                : AssetImage(
                                                    "assets/Aptitude.png"),
                                        fit: BoxFit.fill)),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Container(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _data[index]["title"],
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromRGBO(13, 131, 71, 1)),
                                    ),
                                    Text(
                                      _data[index]["topic"],
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'No.of sessions: ',
                                          style: TextStyle(
                                              fontSize: 14, color: Colors.grey),
                                        ),
                                        Text("${_data[index]["sessions"]}  ",
                                            style: TextStyle(
                                                color: Colors.green,
                                                fontWeight: FontWeight.w600)),
                                        Text(
                                          'Attended: ',
                                          style: TextStyle(
                                              fontSize: 14, color: Colors.grey),
                                        ),
                                        Text(
                                          "${_data[index]["attended"]}  ",
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontWeight: FontWeight.w600),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                          ),
                          Container(
                              width: 50,
                              height: 50,
                              child: Column(
                                children: [
                                  Transform.rotate(
                                    angle: 22 / 7,
                                    child: CircularPercentIndicator(
                                      radius: 25,
                                      lineWidth: 5,
                                      progressColor: Colors.green,
                                      percent: (_data[index]["attended"] /
                                          _data[index]["sessions"]),
                                      center: Transform.rotate(
                                        angle: 22 / 7,
                                        child: Text(
                                          "${(_data[index]["attended"] / _data[index]["sessions"] * 100).toInt()}%",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget Session() {
    return Container(
      width: double.infinity,
      height: 130,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromRGBO(0, 135, 56, 1)),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Level ${(widget.level < 10) ? "0${widget.level}" : widget.level} Session - ",
                  style: TextStyle(
                      fontSize: 21,
                      color: Colors.green[100],
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "${_attended}/${_sessions}",
                  style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(213, 208, 65, 1)),
                )
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                createTopics("Verbal ", _verbal),
                createTopics("Reasoning ", _reasoning),
                createTopics("Aptitude ", _apptitude),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget createTopics(topic, value) {
    return Container(
      child: Row(
        children: [
          Text(
            topic,
            style: TextStyle(
                fontSize: 15,
                color: Colors.green[100],
                fontWeight: FontWeight.w600),
          ),
          Text(
            "${value}",
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(213, 208, 65, 1)),
          )
        ],
      ),
    );
  }
}
