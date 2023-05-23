class Assessment {
  String? sId;
  String? classId;
  String? assessmentName;
  DateTime? openDate;
  DateTime? dueDate;
  String? description;
  int? duration;
  int? totalMarks;
  DateTime? createdAt;
  int? obtainedMarks;
  String? status;
  bool? allowManualGrading;
  bool? cancelled;


  Assessment(
      {this.sId,
        this.classId,
        this.assessmentName,
        this.openDate,
        this.dueDate,
        this.description,
        this.duration,
        this.totalMarks,
        this.createdAt,
        this.obtainedMarks,
        this.status,
      this.allowManualGrading,
        this.cancelled,
      });

  factory Assessment.fromJson(Map<String, dynamic> json) {
    return Assessment(
      sId: json["_id"],
      classId: json["classId"],
      assessmentName: json["assessmentName"],
      openDate: DateTime.parse(json["openDate"]),
      dueDate: DateTime.parse(json["dueDate"]),
      description: json["description"],
      duration: json["duration"],
      totalMarks: json["totalMarks"],
      cancelled: json["cancelled"],
      allowManualGrading: json["allowManualGrading"],
      createdAt: DateTime.parse(json["createdAt"]),
    );
  }
}

class Question {
  String id;
  String questionType;
  String question;
  int totalMarks;
  List<List<String>> msAnswer;

  Question({
    required this.id,
    required this.questionType,
    required this.question,
    required this.totalMarks,
    required this.msAnswer,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json["_id"],
      questionType: json["questionType"],
      question: json["question"],
      totalMarks: json["totalMarks"],
      msAnswer: List<List<String>>.from(json["msAnswer"].map((x) => List<String>.from(x))),
    );
  }
}

class GetOneAssessModel {
  Assessment? assessment;
  List<Question>? questions;

  GetOneAssessModel({
    this.assessment,
    this.questions,
  });

  factory GetOneAssessModel.fromJson(Map<String, dynamic> json) {
    return GetOneAssessModel(
      assessment: Assessment.fromJson(json["assessment"]),
      questions: List<Question>.from(json["questions"].map((x) => Question.fromJson(x))),
    );
  }
}