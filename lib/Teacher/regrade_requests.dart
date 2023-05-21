import 'package:flutter/material.dart';
import '../Data/Models/assessment_model.dart';

class RegradeRequests extends StatefulWidget {
  const RegradeRequests({Key? key}) : super(key: key);

  @override
  State<RegradeRequests> createState() => _RegradeRequestsState();
}

// For DropDown Container
final Color background = Colors.white;
final Color fill = Color(0xFF6096B4);
final double fillPercent = 20;
final double fillStop = (100 - fillPercent) / 100;
final List<double> stops = [0.0, fillStop, fillStop, 1.0];
final List<Color> gradient = [
  background,
  background,
  fill,
  fill,
];

// For Quizzes Container
final Color background2 = Color(0xFF6EAACB);
final Color fill2 = Color(0XFF6096B4);
final double fillPercent2 = 70;
final double fillStop2 = (100 - fillPercent2) / 100;
final List<double> stops2 = [0.0, fillStop2, fillStop2, 1.0];

// for marks obtained container
final double fillPercent3 = 30;
final double fillStop3 = (100 - fillPercent3) / 100;
final List<double> stops3 = [0.0, fillStop3, fillStop3, 1.0];


final List<Color> marks = [
  Color(0xff6096B4),
  Color(0xff6096B4),
  fill2,
  fill2,
];

final List<Color> active = [
  background2,
  background2,
  fill2,
  fill2,
];



class _RegradeRequestsState extends State<RegradeRequests> {
  // Setting initial value for Dropdown
  String dropdownValue = 'All';

//Testing ListBuilder
  List<AssessmentModel> assess = [];
  List<String> dropdownItems = ['All', 'Assessment1', 'Assessment2', 'Assessment3', 'Active'];

  @override
  void initState() {
    super.initState();
    AssessmentModel result = new AssessmentModel();
    print(assess.length);
    assess.add(result);
    assess.add(result);assess.add(result);assess.add(result);assess.add(result);assess.add(result);assess.add(result);assess.add(result);
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(35),
        child: AppBar(
          leading: BackButton(color: Colors.black),
          shape: Border(bottom: BorderSide(color: Colors.black, width: 1)),
          //title: Text('Salam'),
          backgroundColor: Color(0xFFD2721A),
        ),
      ),
      body: Stack(
        children: [
          BackgroundScreen(),
          Positioned(
            top: h / 128,
            left: w / 32,
            right: w / 32,
            bottom: -10,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              elevation: 5.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: h / 25,
                  ),
                  MainText(w, "Physics Class"),
                  SubText(w, h, "PHY-9055"),
                  Stack(
                    children: [
                      Container(
                          height: _filteredAssessments.length < 2 ? 400 : 585,
                          color: Color(0xFFF4F4F4)),
                      Positioned(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(20, h / 32, 20, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Regrade Requests',
                                style: TextStyle(
                                  color: Color(0xFF737373),
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  'Select Assessment',
                                  style: TextStyle(
                                    color: Color(0xFF737373),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              MaterialDropdown(dropdownItems, w),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: h * 0.37,
            left: w / 8,
            right: w / 8,
            bottom: 0,
            child: ListView.builder(
                itemCount: _filteredAssessments.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Material(
                        elevation: 5,
                        shadowColor: Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                        child: Ink(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: active,
                                stops: stops2,
                                end: Alignment.centerRight,
                                begin: Alignment.centerLeft,
                              ),
                              borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                          child: InkWell(
                            splashColor: Colors.grey, // Splash color
                            onTap: () => {}, // to regrade screen
                            child: Container(
                              height: h * 0.075,
                              child: Row(
                                children: [
                                  SizedBox(width: 30),
                                  Text(
                                    'Q2',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 45),
                                  Text(
                                    'Tap to Regrade',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 45),

                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20)
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }

  MaterialDropdown(List<String> dropdownItems, double w) {
    return Material(
      elevation: 3,
      shadowColor: Colors.grey,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradient,
            stops: stops,
            end: Alignment.centerRight,
            begin: Alignment.centerLeft,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: DropdownButton<String>(
          value: dropdownValue,
          icon: Padding(
            padding: EdgeInsets.only(right: w / 20),
            child: Icon(Icons.arrow_downward_rounded),
          ),
          iconEnabledColor: Colors.white,
          isExpanded: true,
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
          items: dropdownItems.map<DropdownMenuItem<String>>(
                (String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    value,
                    style: TextStyle(
                      color: Color(0xFF737373),
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }


  Padding SubText(double w, double h, String text) {
    return Padding(
      padding: EdgeInsets.fromLTRB(w / 16, h / 128, 0, h / 32),
      child: Text(text,
        style: TextStyle(
          color: Color(0xFF6096B4),
          fontSize: 15.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Padding MainText(double w, String text) {
    return Padding(
      padding: EdgeInsets.fromLTRB(w / 16, 0, 0, 0),
      child: Text(
        text,
        style: TextStyle(
          color: Color(0xFF737373),
          fontSize: 28.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  List<AssessmentModel> get _filteredAssessments {
    return assess.where((item) => item.status == dropdownValue).toList();
  }
}

class BackgroundScreen extends StatelessWidget {
  const BackgroundScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
