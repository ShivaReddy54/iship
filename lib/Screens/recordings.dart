import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class recordings extends StatefulWidget {
  const recordings({super.key});

  @override
  State<recordings> createState() => _recordingsState();
}
DateTime now = new DateTime.now();
DateTime date = new DateTime(now.year, now.month, now.day);

class _recordingsState extends State<recordings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recordings",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w400),),
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            SizedBox(height: 10,),
            Row(
              children: [
                SizedBox(width: 20,),
                Text("All Recordings",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
              ],
            ),
            SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.all(8.0),
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
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  buildListView('A'),
                  buildListView('R'),
                  buildListView('V'),
                ],
              ),
            ),
          ],
        )
      )
    );
  }
}

Widget buildListView(String topic) {
  return Expanded(
    child: Padding(
      padding: EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          if (topic != '') {
            return Container(
              height: 110,
              margin: EdgeInsets.only(top: 15),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: const [
                  BoxShadow(
                      blurRadius: 3, spreadRadius: -5, offset: Offset(0, 5)),
                ],
                  border: Border.all(
                      width: 1, color: Colors.grey.withOpacity(0.3))
              ),
              child: Row(
                children: [
                  SizedBox(width: 15),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/Recordings.png")
                    ],
                  ),
                  SizedBox(width: 30),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                getTopicText(topic),
                                style: TextStyle(
                                  color: Color(0xFF05872d),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),

                              Text("26/07/2024"),
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                topic == 'A'
                                    ? "Aptitude"
                                    : (topic == 'R'
                                    ? "Reasoning"
                                    : (topic == 'V' ? "Verbal Ability" : "")),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Icon(FontAwesomeIcons.clock,size: 10,),
                                    SizedBox(width: 5,),
                                    Text("Expires in"),
                                    SizedBox(width: 5,),
                                    Text("15 days",style: TextStyle(color: Colors.green),)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: 210,
                          child: LinearProgressIndicator(
                            backgroundColor: Colors.grey[300],
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow),
                            value: 0.7,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: Text(topic),
            );
          }
        },
      ),
    ),
  );
}

String getTopicText(String topic) {
  switch (topic) {
    case 'A':
      return "Time and Speed";
    case 'R':
      return "Reasoning";
    case 'V':
      return "Verbal Ability";
    default:
      return "";
  }
}

