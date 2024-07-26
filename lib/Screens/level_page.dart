import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
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
  num _aptitude = 0;
  num _sessions = 0;
  num _attended = 0;

  List _data = [];

  @override
  void initState() {
    super.initState();
    _data = widget.data;
    for (Map i in _data) {
      if (i['topic'][0] == 'V') {
        _verbal += i['attended'];
      } else if (i['topic'][0] == 'R')
        _reasoning += i['attended'];
      else
        _aptitude += i['attended'];
      _sessions += i['sessions'];
    }
    _attended = _verbal + _reasoning + _aptitude;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Level - ${(widget.level < 10) ? "0${widget.level}" : widget
                .level}",
            style: TextStyle(
                color: Color.fromRGBO(13, 131, 70, 1),
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Session(
                  level: widget.level,
                  attended: _attended.toInt(),
                  sessions: _sessions.toInt(),
                  aptitude: _aptitude.toDouble(),
                  reasoning: _reasoning.toDouble(),
                  verbal: _verbal.toDouble(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12)),
                  height: 50,
                  child: TabBar(
                      dividerColor: Colors.transparent,
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelColor: Colors.white,
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          colors: [
                            Color(0xff008730),
                            Color(0xff95CD7C),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),),
                      tabs: const [
                        Tab(
                          text: "Aptitude",
                        ),
                        Tab(
                          text: "Reasoning",
                        ),
                        Tab(
                          text: "Verbal",
                        ),
                      ]),
                ),
              ),
              Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height - 250, // Adjust as needed
                child: TabBarView(
                  children: <Widget>[
                    buildListView('A'),
                    buildListView('R'),
                    buildListView('V'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildListView(String topic) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: _data.length,
        itemBuilder: (context, index) {
          if (_data[index]['topic'][0] == topic) {
            return Container(
              width: double.infinity,
              height: 90,
              margin: EdgeInsets.only(top: 15),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        blurRadius: 3, spreadRadius: -5, offset: Offset(0, 5)),
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
                                      ? AssetImage("assets/Reasoning.png")
                                      : AssetImage("assets/Aptitude.png"),
                                  fit: BoxFit.fill)),
                        ),
                        SizedBox(
                          width: 6,
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
                                    color: Color.fromRGBO(13, 131, 71, 1)),
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
                                  Text("${_data[index]["attended"]}  ",
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.w600)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ),
                    SizedBox(
                        width: 50,
                        height: 50,
                        child: Column(
                          children: [
                            Percentage(index),
                          ],
                        )),
                  ],
                ),
              ),
            );
          } else {
            return SizedBox.shrink();
          }
        },
      ),
    );
  }

  Widget Percentage(index) {
    num percent =
    (_data[index]["attended"] / _data[index]["sessions"] * 100).toInt();
    return Transform.rotate(
      angle: 3.14,
      child: CircularPercentIndicator(
        radius: 25,
        lineWidth: 5,
        progressColor: (percent >= 75)
            ? Colors.green
            : (percent >= 40)
            ? Colors.orange
            : Colors.red,
        percent: (_data[index]["attended"] / _data[index]["sessions"]),
        center: Transform.rotate(
          angle: 3.14,
          child: Text(
            "$percent%",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget Session({
    required int level,
    required int attended,
    required int sessions,
    required double aptitude,
    required double reasoning,
    required double verbal,
  }) {
    Map<String, double> dataMap = {
      "Aptitude": aptitude,
      "Reasoning": reasoning,
      "Verbal": verbal,
    };

    return Padding(
      padding: const EdgeInsets.all(6),
      child: Container(
        height: 240,
        decoration: BoxDecoration(
          //color: Color(0xFFFAF3E0),
          gradient: LinearGradient(
            colors: [
              Color(0xff008730),
              Color(0xff95CD7C),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(child: Text('')),
                    Text(
                      "Sessions - ",
                      style: TextStyle(
                          fontSize: 21,
                          color: Colors.green[100],
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "$_attended/$_sessions",
                      style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(213, 208, 65, 5)),
                    ),
                    Expanded(child: Text('')),
                  ],

                ),
              ],
            ),
            Positioned.fill(
              top: 23,
              child: PieChart(
                dataMap: dataMap,
                colorList: [
                  Color(0xFF007BFF),
                  Color(0xFFFFA500),
                  Color(0xFF05872d),
                ],
                chartRadius: MediaQuery
                    .of(context)
                    .size
                    .width / 3,
                legendOptions: LegendOptions(
                  showLegends: true,
                  legendPosition: LegendPosition.right,
                  legendShape: BoxShape.circle,
                  legendTextStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                chartValuesOptions: ChartValuesOptions(
                  showChartValues: true,
                  showChartValuesInPercentage: false,
                  decimalPlaces: 0,
                  showChartValueBackground: false,
                  chartValueStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors
                        .black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}