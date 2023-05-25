import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Controllers/create_assessment_provider.dart';
import 'package:intl/intl.dart';
import '../Data/Models/create_assessment_model.dart';



class CreateAssessment extends StatefulWidget {

  final String classId;
  final String className;
  final String authToken;

  const CreateAssessment(
      {Key? key,
      required this.classId,
      required this.className,
      required this.authToken})
      : super(key: key);

  @override
  _CreateAssessmentState createState() => _CreateAssessmentState();
}

class _CreateAssessmentState extends State<CreateAssessment> {
  Color _buttonColorTeacher = Colors.grey.shade500;
  Color _buttonColorStudent = Colors.blue.shade900;

  String className = '';
  String authToken = '';
  String classID = '';
  bool teacher = false;
  bool student = true;

  bool _obscurePassword = true;
  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  TextEditingController _titleController = TextEditingController();
  TextEditingController _durationController = TextEditingController();
  DateTime openDateTime = DateTime.now();
  DateTime closeDateTime = DateTime.now();
  Duration assessmentDuration = Duration(hours: 2, minutes: 30);
  bool manualGrading = false;
  // List<TextEditingController> ansControllers = List.generate(5, (index) => TextEditingController());
  // List<TextEditingController> ansControllers2 = List.generate(5, (index) => TextEditingController());

  List<List<TextEditingController>> nestedList = List.generate(
      2, (_) => List.generate(5, (index) => TextEditingController()));

  //List<TextEditingController> ansControllers = [];
  //List<List<TextEditingController>> nestedList = [ansControllers];
  //List<TextEditingController> ansControllers = List.generate(5, (index) => TextEditingController());

  //List<Map<String, dynamic>> questions = [];
  List<OneQuestion> questionss = [];

  @override
  void initState() {
    super.initState();
    authToken = widget.authToken;
    className = widget.className;
    classID = widget.classId;
  }

  @override
  Widget build(BuildContext context) {
    final myProvider = Provider.of<CreateAssessmentProvider>(context);

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
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: double.infinity,
                    color: Colors.orange,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: double.infinity,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Card(
              color: Colors.white,
              elevation: 30,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: SizedBox(
                height: (MediaQuery.of(context).size.height) * 0.9,
                width: MediaQuery.of(context).size.width * 0.9,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Text(
                          className,
                          style: TextStyle(
                            fontSize: (MediaQuery.of(context).size.height) * 0.04,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Arial',
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Text(
                          'New Assessment',
                          style: TextStyle(
                            fontSize: (MediaQuery.of(context).size.height) * 0.03,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Arial',
                            color: Colors.grey.shade800,
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          controller: _titleController,
                          decoration: InputDecoration(
                            labelText: 'Assessment Title',
                          ),
                        ),
                      ),
                      //SizedBox(height: MediaQuery.of(context).size.height * 0.01),

                      SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Select Question Type:'),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      buildOptionButton(
                                        context,
                                        'MCQs',
                                        Icons.assignment,
                                        () {
                                          Navigator.pop(context, 'MCQs');
                                          showMCQsDialog();
                                        },
                                      ),
                                      buildOptionButton(
                                        context,
                                        'Subjective',
                                        Icons.edit,
                                        () {
                                          Navigator.pop(context, 'Subjective');
                                          _showSubjectiveDialog();
                                        },
                                      ),
                                      buildOptionButton(
                                        context,
                                        'Fill in the blanks',
                                        Icons.short_text,
                                        () {
                                          Navigator.pop(
                                              context, 'Fill in the blanks');
                                          _showFillInTheBlanksDialog();
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          icon: Icon(Icons.add),
                          label: Text('Add Question'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 20,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                      if (questionss.isNotEmpty)
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: questionss.length,
                                    itemBuilder: (context, index) {
                                      final question = questionss[index];
                                      print('Question ${index + 1} preview');

                                      return Card(
                                        color: Colors.lightGreen.shade600,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 4),
                                        child: ListTile(
                                          title: Text('Question ${index + 1}'),
                                          subtitle:
                                              Text('Type: ${question.questionType}'),
                                          trailing:
                                              Text('Marks: ${question.totalMarks}'),
                                          onTap: () {
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.08,
            left: MediaQuery.of(context).size.width * 0.2,
            right: MediaQuery.of(context).size.width * 0.2,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
              width: MediaQuery.of(context).size.width * 0.6,
              child: FloatingActionButton(
                onPressed: () {
                  print(questionss);
                  _showDateTimePicker(context);
                },
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Continue',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Icon(Icons.arrow_forward),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildOptionButton(BuildContext context, String text, IconData icon,
      VoidCallback onPressed) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.zero,
      ),
      child: Row(
        children: <Widget>[
          Icon(icon),
          SizedBox(width: 8),
          Text(text),
        ],
      ),
    );
  }

  void showMCQsDialog() {
    TextEditingController questionController = TextEditingController();
    List<TextEditingController> optionControllers =
        List.generate(4, (index) => TextEditingController());
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add MCQ Question:'),
          content: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  controller: questionController,
                  decoration: InputDecoration(
                    labelText: 'Question',
                  ),
                ),
                SizedBox(height: (MediaQuery.of(context).size.height) * 0.02),
                TextFormField(
                  controller: optionControllers[0],
                  decoration: InputDecoration(
                    labelText: 'Option 1 (Correct Option)',
                    labelStyle: TextStyle(color: Colors.lightGreen.shade600),
                  ),
                ),
                for (int i = 1; i < 4; i++)
                  TextFormField(
                    controller: optionControllers[i],
                    decoration: InputDecoration(
                      labelText: 'Option ${i + 1}',
                    ),
                  ),
                SizedBox(height: (MediaQuery.of(context).size.height) * 0.02),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.lightGreen.shade600),
                  ),
                  onPressed: () {
                    setState(() {
                      questionss.add(OneQuestion(
                        question: questionController.text,
                        questionType: "MCQ",
                        totalMarks: 1,
                        msAnswer: [
                          [optionControllers[0].text],
                          [optionControllers[1].text],
                          [optionControllers[2].text],
                          [optionControllers[3].text],
                        ],
                      ));
                    });
                    Navigator.pop(context);
                  },
                  child: Text('Add Question'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showSubjectiveDialog() {
    TextEditingController questionController = TextEditingController();
    int totalMarks = 1;
    List<String> answers = [];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Subjective Question:'),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 8.0),
                              TextFormField(
                                controller: questionController,
                                maxLines: null, // Allows unlimited lines
                                minLines: 1, // Minimum of 1 line
                                decoration: InputDecoration(
                                  hintText: 'Enter Question',
                                  //border: OutlineInputBorder(),
                                  filled:
                                      true, // Set to true to fill background
                                  fillColor:
                                      Colors.white, // Set background color
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    DropdownButton<int>(
                      value: totalMarks,
                      onChanged: (value) {
                        setState(() {
                          totalMarks = value!;
                        });
                      },
                      items: [
                        DropdownMenuItem<int>(
                          value: 1,
                          child: Text('1 Mark'),
                        ),
                        DropdownMenuItem<int>(
                          value: 2,
                          child: Text('2 Marks'),
                        ),
                      ],
                    ),
                    SizedBox(
                        height: (MediaQuery.of(context).size.height) * 0.01),
                    for (int i = 0; i < totalMarks; i++)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () async {
                            _showNumberPopup(i);
                          },
                          child: Text('Enter Answer ${i + 1}'),
                        ),
                      ),
                    SizedBox(
                        height: (MediaQuery.of(context).size.height) * 0.05),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.lightGreen.shade600),
                      ),
                      onPressed: () {
                        setState(() {
                          questionss.add(OneQuestion(
                            question: questionController.text,
                            questionType: 'DESCRIPTIVE',
                            totalMarks: totalMarks,
                            msAnswer: [
                              nestedList[0]
                                  .map((controller) => controller.text)
                                  .toList(),
                              nestedList[1]
                                  .map((controller) => controller.text)
                                  .toList()
                            ].sublist(0, totalMarks),
                          ));
                        });
                        Navigator.pop(context);
                      },
                      child: Text('Add Question'),
                    ),
                    SizedBox(
                        height: (MediaQuery.of(context).size.height) * 0.02),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  void _showFillInTheBlanksDialog() {
    TextEditingController questionController = TextEditingController();
    TextEditingController blankController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add fill in the blank question:'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                controller: questionController,
                decoration: InputDecoration(
                  labelText: 'Question',
                ),
              ),
              SizedBox(height: (MediaQuery.of(context).size.height) * 0.01),
              TextFormField(
                controller: blankController,
                decoration: InputDecoration(
                  labelText: 'Enter Blank Word',
                ),
              ),
              SizedBox(height: (MediaQuery.of(context).size.height) * 0.05),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.lightGreen.shade600),
                ),
                onPressed: () {
                  setState(() {

                    questionss.add(OneQuestion(
                      question: questionController.text,
                      questionType: 'FILL_IN_THE_BLANK',
                      totalMarks: 1,
                      msAnswer: [
                       [blankController.text]
                      ],
                    ));
                  });
                  Navigator.pop(context);
                },
                child: Text('Add Question'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showDateTimePicker(BuildContext context) {
    DateTime? openDate;
    TimeOfDay? openTime;
    DateTime? closeDate;
    TimeOfDay? closeTime;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, setState) {
            return AlertDialog(
              title: Text('Set Assessment Dates'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.lightGreen.shade600),
                          ),
                          onPressed: () async {
                            final selectedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2021),
                              lastDate: DateTime(2100),
                            );
                            if (selectedDate != null) {
                              setState(() {
                                openDate = selectedDate;
                              });
                            }
                          },
                          child: Text('Open Date'),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.lightGreen.shade600),
                          ),
                          onPressed: () async {
                            final selectedTime = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            if (selectedTime != null) {
                              setState(() {
                                openTime = selectedTime;
                              });
                            }
                          },
                          child: Text('Open Time'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.red),
                          ),
                          onPressed: () async {
                            final selectedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2021),
                              lastDate: DateTime(2100),
                            );
                            if (selectedDate != null) {
                              setState(() {
                                closeDate = selectedDate;
                              });
                            }
                          },
                          child: Text('Close Date'),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.red),
                          ),
                          onPressed: () async {
                            final selectedTime = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            if (selectedTime != null) {
                              setState(() {
                                closeTime = selectedTime;
                              });
                            }
                          },
                          child: Text('Close Time'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  if (openDate != null && openTime != null)
                    Center(
                        child: Text(
                            'Open Date and Time: ${formatDateTime(openDate!, openTime!)}')),
                  if (closeDate != null && closeTime != null)
                    Center(
                        child: Text(
                            'Close Date and Time: ${formatDateTime(closeDate!, closeTime!)}')),
                ],
              ),
              actions: [
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      // Perform any required action with the selected dates and times
                      if (openDate != null &&
                          openTime != null &&
                          closeDate != null &&
                          closeTime != null) {
                        openDateTime = DateTime(
                          openDate!.year,
                          openDate!.month,
                          openDate!.day,
                          openTime!.hour,
                          openTime!.minute,
                        );
                        closeDateTime = DateTime(
                          closeDate!.year,
                          closeDate!.month,
                          closeDate!.day,
                          closeTime!.hour,
                          closeTime!.minute,
                        );
                        print('Open Date and Time: $openDateTime');
                        print('Close Date and Time: $closeDateTime');
                        assessmentDuration =
                            closeDateTime.difference(openDateTime);

                        int hours = assessmentDuration.inHours;
                        int minutes =
                            assessmentDuration.inMinutes.remainder(60);

                        print(
                            'Assessment Duration: $hours hours and $minutes minutes');
                        //Navigator.pop(context);
                        _showNumberPopup(2);
                      }
                      Navigator.pop(context);
                    },
                    child: Text('Save Dates'),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      _showInfoPopup(context);
                    },
                    child: Text('Preview Details'),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  String formatDateTime(DateTime date, TimeOfDay time) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(date);
    String formattedTime = time.format(context);
    return '$formattedDate $formattedTime';
  }

  void _showNumberPopup(ind) {
    int numberValue = 1;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: Text('Answer Variations'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            if (numberValue > 1) {
                              numberValue--;
                            }
                          });
                        },
                      ),
                      SizedBox(width: 16),
                      Text(
                        numberValue.toString(),
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(width: 16),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            // Assuming max value is 5
                            if (numberValue < 5) {
                              numberValue++;
                            }
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  for (int i = 0; i < numberValue; i++)
                    TextFormField(
                      controller: nestedList[ind][i],
                      decoration: InputDecoration(
                        labelText: 'Answer Variation ${i + 1}',
                      ),
                    ),
                ],
              ),
              actions: [
                Center(
                  child: ElevatedButton(
                    style: ButtonStyle(),
                    onPressed: () {
                      nestedList[ind] = nestedList[ind].sublist(0, numberValue);

                      Navigator.pop(context);
                    },
                    child: Text('Save'),
                  ),
                ),
                SizedBox(height: 10)
              ],
            );
          },
        );
      },
    );
  }

  void _showInfoPopup(BuildContext context) {
    String assessmentTitle = _titleController.text;
    int numberOfQuestions = questionss.length;
    int totalMarks = 0;

    for (int i = 0; i < questionss.length; i++) {
      int marks = questionss[i].totalMarks;
      totalMarks += marks;
    }

    bool allowManualGrading = false;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Assessment Information'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Assessment Title: $assessmentTitle'),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Text('Open Date and Time: $openDateTime'),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Text('Close Date and Time: $closeDateTime'),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Text('Duration: $assessmentDuration'),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Text('Number of Questions: $numberOfQuestions'),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Text('Total Marks: $totalMarks'),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Row(
                children: [
                  Switch(
                    value: allowManualGrading,
                    onChanged: (value) {
                      setState(() {
                        allowManualGrading = value;
                      });
                    },
                  ),
                  Text('Allow Manual Grading'),
                ],
              ),
            ],
          ),
          actions: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    // final myProvider =
                    //     Provider.of<CreateAssessmentProvider>(context, listen: false);
                    // print("Open Token: " + openDateTime.toIso8601String());
                    //
                    // myProvider.createAssessmentData(
                    //     classID,
                    //     _titleController.text,
                    //     'some value',
                    //     openDateTime.toIso8601String(),
                    //     closeDateTime.toIso8601String(),
                    //     assessmentDuration.inSeconds,
                    //     questionss,
                    //     allowManualGrading,
                    //     authToken,
                    //     context);
                    // Navigator.pop(context);
                    print("The Questions Array:");
                    print(questionss);
                  },
                  child: Text('Post Assessment'),
                ),
              ),
            ),
          ],
          //SizedBox(height: MediaQuery.of(context).size.height * 0.015),
        );
      },
    );
  }
}
