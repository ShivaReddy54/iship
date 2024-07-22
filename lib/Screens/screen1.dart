import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(height: 50),
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
                                  Container(
                                    height: 35,
                                    width: 90,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Colors.white,
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "Join Here",
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
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
                      "40", "No of Sessions", Colors.orange, 24.0),
                  _createStatContainer("32", "No of Sessions Attended",
                      const Color(0xFF05872d), 15.0),
                  _createStatContainer("80%", "Attended Percentage",
                      const Color(0xFF75bc1e), 15.0),
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
                  const SizedBox(height: 20,),
                  Wrap(
                    spacing: 20.0,
                    runSpacing: 15.0,
                    children: List.generate(6, (index) {
                      return Container(
                          width: 170.0, // Set the width of each container
                          height: 100.0, // Set the height of each container
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              border: Border.all(
                                color: Colors.black.withOpacity(0.3),
                                width: 1.0,
                              )
                          ),
                          alignment: Alignment.center,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16.0),
                                child: CustomPaint(
                                  size: Size(169, 99), // Set the size of the custom paint area
                                  painter: MyCustomPaint(),
                                ),
                              ),
                              Positioned(
                                child: Text("Level",style: TextStyle(fontSize: 23),),
                                left: 15,
                                top: 13,
                              ),
                              Positioned(
                                right: 15,
                                bottom: 10,
                                child: Text(
                                  index + 1 < 10 ? "0${index + 1}" : "${index + 1}",
                                  style: TextStyle(
                                    color: Colors.yellow,
                                    fontSize: 35.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          )
                      );
                    }),
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}
Widget _createStatContainer(
    String percentage, String text, Color backColor, double size) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
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
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF05872d),
                borderRadius: BorderRadius.circular(1.0),
              ),
              child: const Center(
                child: Text(
                  "V",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF75bc1e),
                borderRadius: BorderRadius.circular(1.0),
              ),
              child: const Center(
                child: Text(
                  "R",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFffbb00),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(7.0),
                  bottomRight: Radius.circular(7.0),
                ),
              ),
              child: const Center(
                child: Text(
                  "A",
                  style: TextStyle(
                    color: Color(0xFF0d8114),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
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
