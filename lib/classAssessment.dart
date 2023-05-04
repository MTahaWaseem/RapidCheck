import 'package:flutter/material.dart';

class ClassAssessment extends StatefulWidget {
  const ClassAssessment({Key? key}) : super(key: key);

  @override
  State<ClassAssessment> createState() => _ClassAssessmentState();
}

final Color background = Colors.white;
final Color fill = Color(0xFF6096B4);

final List<Color> gradient = [
  background,
  background,
  fill,
  fill,
];
final double fillPercent = 20; // fills 56.23% for container from bottom
final double fillStop = (100 - fillPercent) / 100;
final List<double> stops = [0.0, fillStop, fillStop, 1.0];

class _ClassAssessmentState extends State<ClassAssessment> {
  String dropdownValue = 'Active';

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(30),
        child: AppBar(
          shape: Border(bottom: BorderSide(color: Colors.black, width: 1)),
          title: Text('Salam'),
          backgroundColor: Color(0xFFD2721A),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                  height: MediaQuery.of(context).size.height / 3,
                  color: Color(0xFFD2721A)),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Positioned(
            top: h / 128,
            left: w / 32,
            right: w / 32,
            bottom: h / 16,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              elevation: 5.0,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: h / 25,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(w / 16, 0, 0, 0),
                    child: Text(
                      'Physics Evening',
                      style: TextStyle(
                        color: Color(0xFF737373),
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(w / 16, h / 128, 0, h / 32),
                    child: Text(
                      'PHY-507',
                      style: TextStyle(
                        color: Color(0xFF6096B4),
                        fontSize: 13.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                          height: MediaQuery.of(context).size.height / 2,
                          color: Color(0xFFF4F4F4)),
                      Positioned(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(w / 10, h / 32, 0, 0),
                          child: Text(
                            'Class Assignments',
                            style: TextStyle(
                              color: Color(0xFF737373),
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: h / 13,
                        left: w / 12,
                        right: w / 9,
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: gradient,
                                stops: stops,
                                end: Alignment.centerRight,
                                begin: Alignment.centerLeft,
                              ),
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.white,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: DropdownButton<String>(
                            value: dropdownValue,
                            icon: Padding(
                                padding: EdgeInsets.only( right: w/30),
                                child: Icon(Icons.arrow_downward_rounded)),
                            iconEnabledColor: Colors.white,
                            isExpanded: false,
                            iconSize: 24,
                            elevation: 16,
                            style: TextStyle(color: Colors.deepPurple),
                            underline: Container(),
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                setState(() {
                                  dropdownValue = newValue;
                                });
                              }
                            },
                            items: <String>[
                              'Active',
                              'Ungraded',
                              'Graded',
                              'Cancelled'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 30),
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                      color: Color(0xFF737373),
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      Positioned(
                        top: h / 5,
                        left: w / 12,
                        right: w / 9,
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: gradient,
                                stops: stops,
                                end: Alignment.centerRight,
                                begin: Alignment.centerLeft,
                              ),
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.white,
                              ),
                              borderRadius:
                              BorderRadius.all(Radius.circular(10))),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
