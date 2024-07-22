import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  Screen2({super.key});

  int _sessions = 54;
  int _totalSessions = 60;
  int _verbal = 18;
  int _reasoning = 16;
  int _apptitude = 20;

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
          ],
        ),
      ),
    );
  }

  Widget Session() {
    return Container(
      width: double.infinity,
      height: 170,
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
            )
          ],
        ),
      ),
    );
  }
}
