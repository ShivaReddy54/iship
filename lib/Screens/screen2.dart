// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Screen2 extends StatelessWidget {
  Screen2({super.key});

  int _sessions = 54;
  int _totalSessions = 60;
  int _verbal = 18;
  int _reasoning = 16;
  int _apptitude = 20;

  List _data = [
    {
      "icon": "https://cdn-icons-png.flaticon.com/512/2784/2784461.png",
      "title": "Jumbled Words",
      "topic": "Verbal Ability",
      "sessions": 20,
      "attended": 16,
      "percentage": 87
    },
    {
      "icon": "https://cdn-icons-png.flaticon.com/512/2784/2784461.png",
      "title": "Jumbled Words",
      "topic": "Verbal Ability",
      "sessions": 20,
      "attended": 16,
      "percentage": 87
    },
    {
      "icon": "https://cdn-icons-png.flaticon.com/512/2784/2784461.png",
      "title": "Jumbled Words",
      "topic": "Verbal Ability",
      "sessions": 20,
      "attended": 16,
      "percentage": 87
    },
    {
      "icon": "https://cdn-icons-png.flaticon.com/512/2784/2784461.png",
      "title": "Jumbled Words",
      "topic": "Verbal Ability",
      "sessions": 20,
      "attended": 16,
      "percentage": 87
    },
    {
      "icon": "https://cdn-icons-png.flaticon.com/512/2784/2784461.png",
      "title": "Jumbled Words",
      "topic": "Verbal Ability",
      "sessions": 20,
      "attended": 16,
      "percentage": 87
    },
    {
      "icon": "https://cdn-icons-png.flaticon.com/512/2784/2784461.png",
      "title": "Jumbled Words",
      "topic": "Verbal Ability",
      "sessions": 20,
      "attended": 16,
      "percentage": 87
    },
    {
      "icon": "https://cdn-icons-png.flaticon.com/512/2784/2784461.png",
      "title": "Jumbled Words",
      "topic": "Verbal Ability",
      "sessions": 20,
      "attended": 16,
      "percentage": 87
    },
    {
      "icon": "https://cdn-icons-png.flaticon.com/512/2784/2784461.png",
      "title": "Jumbled Words",
      "topic": "Verbal Ability",
      "sessions": 20,
      "attended": 16,
      "percentage": 87
    },
    {
      "icon": "https://cdn-icons-png.flaticon.com/512/2784/2784461.png",
      "title": "Jumbled Words",
      "topic": "Verbal Ability",
      "sessions": 20,
      "attended": 16,
      "percentage": 87
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Level - 01",
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
          children: [
            Session(),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _data.length,
                itemBuilder: (context,index){
                  return Container(
                    width: double.infinity,
                    height: 90,
                    margin: EdgeInsets.only(top: 15),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(blurRadius: 10,spreadRadius: -7)]
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(_data[index]["icon"]),
                                      fit: BoxFit.fill
                                    )
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _data[index]["title"],
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromRGBO(13, 131, 71, 1)
                                        ),
                                      ),
                                      Text(
                                        _data[index]["topic"],
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'No.of sessions: ',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey
                                            ),
                                          ),
                                          Text("${_data[index]["sessions"]}  ",style: TextStyle(color: Colors.green)),
                                          Text(
                                            'Attended: ',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey
                                            ),
                                          ),
                                          Text("${_data[index]["attended"]}  ",style: TextStyle(color: Colors.green),)
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ]
                            ),
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            child: CircularPercentIndicator(
                              radius: 25,
                              lineWidth: 5,
                              progressColor: Colors.green,
                              percent: (_data[index]["percentage"]/100),
                              center: Text("${_data[index]["percentage"]}%",style: TextStyle(fontWeight: FontWeight.bold),),
                            )
                          ),
                        ],
                      ),
                    )
                  );
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
      height: 155,
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
                  "Level 01 Session - ",
                  style: TextStyle(
                      fontSize: 21,
                      color: Colors.green[100],
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "${_sessions}/${_totalSessions}",
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
