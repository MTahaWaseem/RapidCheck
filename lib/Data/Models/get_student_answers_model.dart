class ResponseGraded {

  Assessment? assessment;
  List<Questions>? questions;
  List<StudentAnswers>? studentAnswers;

  ResponseGraded({this.assessment, this.questions, this.studentAnswers});

  ResponseGraded.fromJson(Map<String, dynamic> json) {
    assessment = json['assessment'] != null
        ? new Assessment.fromJson(json['assessment'])
        : null;
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add(new Questions.fromJson(v));
      });
    }
    if (json['studentAnswers'] != null) {
      studentAnswers = <StudentAnswers>[];
      json['studentAnswers'].forEach((v) {
        studentAnswers!.add(new StudentAnswers.fromJson(v));
      });
    }
  }
}

class Assessment {
  String? sId;
  String? classId;
  String? assessmentName;
  String? openDate;
  String? dueDate;
  String? description;
  int? duration;
  int? totalMarks;
  bool? cancelled;
  bool? allowManualGrading;
  String? createdAt;
  int? iV;

  Assessment(
      {this.sId,
        this.classId,
        this.assessmentName,
        this.openDate,
        this.dueDate,
        this.description,
        this.duration,
        this.totalMarks,
        this.cancelled,
        this.allowManualGrading,
        this.createdAt,
        this.iV});

  Assessment.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    classId = json['classId'];
    assessmentName = json['assessmentName'];
    openDate = json['openDate'];
    dueDate = json['dueDate'];
    description = json['description'];
    duration = json['duration'];
    totalMarks = json['totalMarks'];
    cancelled = json['cancelled'];
    allowManualGrading = json['allowManualGrading'];
    createdAt = json['createdAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['classId'] = this.classId;
    data['assessmentName'] = this.assessmentName;
    data['openDate'] = this.openDate;
    data['dueDate'] = this.dueDate;
    data['description'] = this.description;
    data['duration'] = this.duration;
    data['totalMarks'] = this.totalMarks;
    data['cancelled'] = this.cancelled;
    data['allowManualGrading'] = this.allowManualGrading;
    data['createdAt'] = this.createdAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Questions {
  String id;
  String questionType;
  String question;
  int totalMarks;
  List<List<String>> msAnswer;
  int iV;

  Questions(
      {  required this.id,
        required this.questionType,
        required this.question,
        required this.totalMarks,
        required this.msAnswer,
        required this.iV});

  factory Questions.fromJson(Map<String, dynamic> json) {
    return Questions(
      iV: json['__v'],
      id: json["_id"],
      questionType: json["questionType"],
      question: json["question"],
      totalMarks: json["totalMarks"],
      msAnswer: List<List<String>>.from(json["msAnswer"].map((x) => List<String>.from(x))),
    );
  }

  // factory Questions.fromJson(Map<String, dynamic> json) {
  //   id = json['_id'];
  //   questionType = json['questionType'];
  //   question = json['question'];
  //   totalMarks = json['totalMarks'];
  //   List<List<String>>.from(json["msAnswer"].map((x) => List<String>.from(x)));
  //   iV = json['__v'];
  // }

}

class StudentAnswers {
  Question? question;
  String? answer;
  bool? regradeRequest;
  String? sId;
  int? marks;

  StudentAnswers(
      {this.question, this.answer, this.regradeRequest, this.sId, this.marks});

  StudentAnswers.fromJson(Map<String, dynamic> json) {
    question = json['question'] != null
        ? new Question.fromJson(json['question'])
        : null;
    answer = json['answer'];
    regradeRequest = json['regradeRequest'];
    sId = json['_id'];
    marks = json['marks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.question != null) {
      data['question'] = this.question!.toJson();
    }
    data['answer'] = this.answer;
    data['regradeRequest'] = this.regradeRequest;
    data['_id'] = this.sId;
    data['marks'] = this.marks;
    return data;
  }
}

class Question {
  String? sId;
  String? questionType;
  String? question;
  int? totalMarks;

  Question({this.sId, this.questionType, this.question, this.totalMarks});

  Question.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    questionType = json['questionType'];
    question = json['question'];
    totalMarks = json['totalMarks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['questionType'] = this.questionType;
    data['question'] = this.question;
    data['totalMarks'] = this.totalMarks;
    return data;
  }
}
