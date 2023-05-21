// import 'package:flutter/material.dart';
// import 'package:fyp/Student/class_announcements.dart';
// import 'package:fyp/Student/regrade_requests_student.dart';
// import 'package:fyp/Student/take_assessment.dart';
// import 'package:fyp/Student/view_assess_student.dart';
// import 'package:fyp/Student/view_score.dart';
// import 'package:fyp/Teacher/view_students.dart';
// import '../Data/Models/assessment_model.dart';
//
// class ViewClassStudent extends StatefulWidget {
//   const ViewClassStudent({Key? key}) : super(key: key);
//
//   @override
//   State<ViewClassStudent> createState() => _ViewClassStudentState();
// }
//
// String className = '';
// final Color background2 = Color(0xFFBDCDD6);
// final Color fill2 = Colors.white; // Active Quiz
// final double fillPercent2 = 70; // fills 70%
// final double fillStop2 = (100 - fillPercent2) / 100;
// final List<double> stops2 = [0.0, fillStop2, fillStop2, 1.0];
//
// final List<Color> active = [
//   background2,
//   background2,
//   fill2,
//   fill2,
// ];
//
// class _ViewClassStudentState extends State<ViewClassStudent> {
// //Testing ListBuilder
//   List<AssessmentModel> assess = [];
//
//   @override
//   void initState() {
//     super.initState();
//     AssessmentModel result = AssessmentModel();
//     assess.add(result);
//     assess.add(result);
//     assess.add(result);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double h = MediaQuery.of(context).size.height;
//     double w = MediaQuery.of(context).size.width;
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(35),
//         child: AppBar(
//           leading: const BackButton(color: Colors.black),
//           shape:
//               const Border(bottom: BorderSide(color: Colors.black, width: 1)),
//           //title: Text('Salam'),
//           backgroundColor: const Color(0xFFD2721A),
//         ),
//       ),
//       body: Stack(
//         children: [
//           const BackgroundScreen(),
//           Positioned(
//             top: h / 128,
//             left: w / 32,
//             right: w / 32,
//             bottom: -10,
//             child: Card(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(20),
//                     topRight: Radius.circular(20)),
//               ),
//               elevation: 5.0,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     height: h / 25,
//                   ),
//                   mainText(w, "Physics Evening"),
//                   const SizedBox(height: 10),
//                   SubText(w, "PHY-012"),
//                   const SizedBox(height: 20),
//                   Stack(
//                     children: [
//                       Container(
//                           height: assess.length < 3 ? 400 : 585,
//                           color: const Color(0xFFF4F4F4)),
//                       Positioned(
//                         child: Column(
//                           children: [
//                             Row(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(
//                                       top: 8, left: 8, right: 8),
//                                   child: Material(
//                                     elevation: 3,
//                                     shadowColor: Colors.grey,
//                                     borderRadius: BorderRadius.circular(20),
//                                     child: Ink(
//                                       decoration: const BoxDecoration(
//                                           color: Color(0xFF6CB460),
//                                           borderRadius: BorderRadius.all(
//                                               Radius.circular(20))),
//                                       child: InkWell(
//                                         borderRadius: const BorderRadius.all(
//                                             Radius.circular(20)),
//                                         splashColor:
//                                             Colors.blueGrey, // Splash color
//                                         onTap: () => Navigator.of(context).push(
//                                           MaterialPageRoute(
//                                               builder: (context) =>
//                                                   const ViewScore()),
//                                         ),
//                                         child: SizedBox(
//                                           width:  w * 0.5,
//                                           height: 100,
//                                           child: Row(
//                                             children: [
//                                               Column(
//                                                 children: [
//                                                   SizedBox(height: 40),
//                                                   Text(
//                                                     "87%",
//                                                     style: TextStyle(
//                                                         color: Colors.white,
//                                                         fontWeight:
//                                                             FontWeight.bold,
//                                                         fontSize: 20),
//                                                   ),
//                                                   SizedBox(height: 10),
//                                                   Padding(
//                                                     padding: const EdgeInsets.only(left: 10.0),
//                                                     child: Text(
//                                                       "Score",
//                                                       style: TextStyle(
//                                                           color: Colors.white,
//                                                           fontWeight:
//                                                               FontWeight.bold,
//                                                           fontSize: 18),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                               SizedBox(width: 50),
//                                               Padding(
//                                                 padding:
//                                                     const EdgeInsets.fromLTRB(
//                                                         8, 0, 0, 0),
//                                                 child: Text(
//                                                   "A",
//                                                   style: TextStyle(
//                                                       color: Colors.white,
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       fontSize: 75),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(top: 8.0),
//                                   child: Material(
//                                     elevation: 3,
//                                     shadowColor: Colors.grey,
//                                     borderRadius: BorderRadius.circular(20),
//                                     child: Ink(
//                                       decoration: const BoxDecoration(
//                                           //color: Color(0xFF6096B4),
//                                           color: Color(0xFF6096B4),
//                                           borderRadius: BorderRadius.all(
//                                               Radius.circular(20))),
//                                       child: InkWell(
//                                         borderRadius: const BorderRadius.all(
//                                             Radius.circular(20)),
//                                         splashColor:
//                                             Colors.blueGrey, // Splash color
//                                         onTap: () => Navigator.of(context).push(
//                                           MaterialPageRoute(
//                                               builder: (context) =>
//                                                   const RegradeRequestsStudent(
//                                                       // Some parameter here?
//                                                       )),
//                                         ),
//                                         child: SizedBox(
//                                           width:  w * 0.35,
//                                           height: 100,
//                                           child: Align(
//                                               alignment: Alignment.bottomLeft,
//                                               child: Padding(
//                                                 padding: EdgeInsets.all(10.0),
//                                                 child: Text(
//                                                   "Regrade\nRequests",
//                                                   style: TextStyle(
//                                                       color: Colors.white,
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       fontSize: 15),
//                                                 ),
//                                               )),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: 7),
//                             Row(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 8.0),
//                                   child: Material(
//                                     elevation: 3,
//                                     shadowColor: Colors.grey,
//                                     borderRadius: BorderRadius.circular(20),
//                                     child: Ink(
//                                       decoration: const BoxDecoration(
//                                           //color: Color(0xFF6096B4),
//                                           color: Color(0xFF6096B4),
//                                           borderRadius: BorderRadius.all(
//                                               Radius.circular(20))),
//                                       child: InkWell(
//                                         borderRadius: const BorderRadius.all(
//                                             Radius.circular(20)),
//                                         splashColor:
//                                             Colors.blueGrey, // Splash color
//                                         onTap: () => Navigator.of(context).push(
//                                           MaterialPageRoute(
//                                               builder: (context) =>
//                                                   const ClassAnnouncements(
//                                                       // Some parameter here?
//                                                       )),
//                                         ),
//                                         child: SizedBox(
//                                           width: w * 0.5,
//                                           height: 90,
//                                           child: Align(
//                                               alignment: Alignment.bottomLeft,
//                                               child: Padding(
//                                                 padding: EdgeInsets.all(10.0),
//                                                 child: Text(
//                                                   "Announcements",
//                                                   style: TextStyle(
//                                                       color: Colors.white,
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       fontSize: 15),
//                                                 ),
//                                               )),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 8),
//                                   child: Material(
//                                     elevation: 3,
//                                     shadowColor: Colors.grey,
//                                     borderRadius: BorderRadius.circular(20),
//                                     child: Ink(
//                                       decoration: const BoxDecoration(
//                                           //color: Color(0xFF6096B4),
//                                           color: Color(0xFF6096B4),
//                                           borderRadius: BorderRadius.all(
//                                               Radius.circular(20))),
//                                       child: InkWell(
//                                         borderRadius: const BorderRadius.all(
//                                             Radius.circular(20)),
//                                         splashColor:
//                                             Colors.blueGrey, // Splash color
//                                         onTap: () => Navigator.of(context).push(
//                                           MaterialPageRoute(
//                                               builder: (context) =>
//                                                   const ViewAssessStudent(
//                                                       // Some parameter here?
//                                                       )),
//                                         ),
//                                         child:  SizedBox(
//                                           width: w * 0.35,
//                                           height: 90,
//                                           child: Align(
//                                               alignment: Alignment.bottomLeft,
//                                               child: Padding(
//                                                 padding: EdgeInsets.all(10.0),
//                                                 child: Text(
//                                                   "Assessments",
//                                                   style: TextStyle(
//                                                       color: Colors.white,
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       fontSize: 15),
//                                                 ),
//                                               )),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const Align(
//                               alignment: Alignment.topLeft,
//                               child: Padding(
//                                 padding: EdgeInsets.all(32.0),
//                                 child: Text(
//                                   "Active Assessments",
//                                   style: TextStyle(
//                                     color: Color(0xFF737373),
//                                     fontSize: 20.0,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Positioned(
//             top: h * 0.48,
//             left: w / 8,
//             right: w / 8,
//             bottom: 0,
//             child: ListView.builder(
//                 itemCount: _filteredAssessments.length,
//                 itemBuilder: (context, index) {
//                   return Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Material(
//                         elevation: 5,
//                         shadowColor: Colors.grey,
//                         borderRadius: BorderRadius.circular(20),
//                         child: Ink(
//                           decoration: BoxDecoration(
//                               gradient: LinearGradient(
//                                 colors: active,
//                                 stops: stops2,
//                                 end: Alignment.centerRight,
//                                 begin: Alignment.centerLeft,
//                               ),
//                               borderRadius:
//                               BorderRadius.all(Radius.circular(20))),
//                           child: InkWell(
//                             splashColor: Colors.grey, // Splash color
//                             onTap: () => Navigator.of(context).push(
//                               MaterialPageRoute(
//                                   builder: (context) => TakeAssessment(
//                                     // Some parameter here?
//                                   )),
//                             ),
//                             child: Container(
//                               height: 80,
//                               child: Column(
//                                 children: [
//                                   SizedBox(height: 13),
//                                   Row(
//                                     children: [
//                                       SizedBox(width: 28),
//                                       Text(
//                                         'PHY',
//                                         style: TextStyle(
//                                           color: Color(0xFF6096B4),
//                                           fontSize: 16.0,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding:
//                                         const EdgeInsets.only(left: 50.0),
//                                         child: Text(
//                                           _filteredAssessments[index]
//                                               .assessmentName,
//                                           style: TextStyle(
//                                             color: Color(0xFF6096B4),
//                                             fontSize: 16.0,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   SizedBox(height: 16),
//                                   Row(
//                                     children: [
//                                       SizedBox(width: 25),
//                                       Text(
//                                         '9055',
//                                         style: TextStyle(
//                                           color: Color(0xFF6096B4),
//                                           fontSize: 16.0,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                       SizedBox(width: 38),
//                                       Icon(
//                                         Icons.timer_outlined,
//                                         color: Color(0xFF6096B4),
//                                       ),
//                                       Text(
//                                         '20 min',
//                                         style: TextStyle(
//                                           color: Color(0xFF6096B4),
//                                           fontSize: 15.0,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                       SizedBox(width: 45),
//
//                                       _filteredAssessments[index].status ==
//                                           "Graded"
//                                           ? Text(
//                                         _filteredAssessments[index]
//                                             .obtainedMarks.toInt()
//                                             .toString() +
//                                             "/" +
//                                             _filteredAssessments[index]
//                                                 .totalMarks.toInt()
//                                                 .toString(),
//                                         style: TextStyle(
//                                           color: Color(0xFF6096B4),
//                                           fontSize: 19.0,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       )
//                                           : Padding(
//                                         padding: const EdgeInsets.only(left: 18.0),
//                                         child: Text(
//                                           "/" +
//                                               _filteredAssessments[index]
//                                                   .totalMarks.toInt()
//                                                   .toString(),
//                                           style: TextStyle(
//                                             color: Color(0xFF6096B4),
//                                             fontSize: 23.0,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 20)
//                     ],
//                   );
//                 }),
//           )
//         ],
//       ),
//     );
//   }
//
//   Padding subText(double w, String text) {
//     return Padding(
//       padding: EdgeInsets.fromLTRB(w / 16, 0, 0, 0),
//       child: Text(
//         text,
//         style: const TextStyle(
//           color: Color(0xFF737373),
//           fontSize: 18.0,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }
//
//   Padding mainText(double w, String text) {
//     return Padding(
//       padding: EdgeInsets.fromLTRB(w / 16, 0, 0, 0),
//       child: Text(
//         text,
//         style: const TextStyle(
//           color: Color(0xFF737373),
//           fontSize: 28.0,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }
//
//   List<AssessmentModel> get _filteredAssessments {
//     return assess.where((item) => item.status == 'Active').toList();
//   }
// }
//
// class BackgroundScreen extends StatelessWidget {
//   const BackgroundScreen({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//             height: MediaQuery.of(context).size.height / 3,
//             color: const Color(0xFFD2721A)),
//         Expanded(
//           flex: 1,
//           child: Container(
//             color: Colors.black,
//           ),
//         ),
//       ],
//     );
//   }
// }
