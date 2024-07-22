import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Screen2 extends StatelessWidget {
  Screen2({super.key});

  int _sessions = 54;
  int _totalSessions = 60;
  int _verbal = 18;
  int _reasoning = 16;
  int _apptitude = 20;
  List _data = [
    {
      "icon":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR816NMJ9LjiBWjhHjy1dkGfpUURDnlymqeRg&s",
      "title": "Jumbled Words",
      "topic": "Verbal Ability",
      "sessions": 20,
      "attended": 16,
      "percentage": 87
    },
    {
      "icon": "https://cdn-icons-png.flaticon.com/512/5663/5663239.png",
      "title": "Jumbled Words",
      "topic": "Verbal Ability",
      "sessions": 20,
      "attended": 16,
      "percentage": 87
    },
    {
      "icon": "https://cdn-icons-png.flaticon.com/512/5663/5663239.png",
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
                itemBuilder: (context, index) {
                  return box(index);
                })
          ],
        ),
      ),
    );
  }

  Widget box(index) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [BoxShadow(spreadRadius: -7, blurRadius: 10)]),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(_data[index]["icon"]),
                      fit: BoxFit.cover)),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _data[index]["title"],
                  style: TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(13, 131, 70, 1),
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  _data[index]["topic"],
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      fontWeight: FontWeight.w700),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "No.of Sessions:",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    Text(
                      "${_data[index]["sessions"]}",
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Attended:",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    Text(
                      "${_data[index]["attended"]}",
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.w600),
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(),
          )
        ],
      ),
    );
  }

  Widget Session() {
    return Container(
      width: double.infinity,
      height: 150,
      margin: EdgeInsets.only(bottom: 10),
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
                SizedBox()
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
