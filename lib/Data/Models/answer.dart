import 'dart:convert';

class Answer {
  final String questionId;
  final String answer;

  Answer({
    required this.questionId,
    required this.answer,
  });

   Map<String, dynamic> toJson() {
    return {
      'questionId': questionId,
      'answer': answer,
    };
  }


 // toJson() {}


  // /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  // /// factory.
  // factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
  //
  // /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  // Map<String, dynamic> toJson() => _$PersonToJson(this);

  // static dynamic _answerToJson(dynamic object) {
  //   if (object is Answer) {
  //     return object.toJSON();
  //   }
  //   return object;
  // }
  //
  // static String encode(List<Answer> answers) {
  //   return const JsonEncoder(_answerToJson).convert(answers);
  // }
}
