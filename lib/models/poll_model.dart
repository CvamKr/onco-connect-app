import 'package:cloud_firestore/cloud_firestore.dart';

class PollModel {
  final String pollId;
  final int questionNo;

  final String question;
  final List<String> options;
  String? selectedOption;

  PollModel({
    this.pollId = "",
    this.questionNo = 0,
    this.question = "",
    required this.options,
    this.selectedOption,
  });

  factory PollModel.fromJson(DocumentSnapshot doc, Map<String, dynamic> json) {
    return PollModel(
      pollId: doc.id,
      questionNo: json['questionNo'] ?? 0,
      question: json['question'] ?? "No question",
      options: List<String>.from(json['options']) ?? [],
      selectedOption: json['selectedOption'] ?? "",
    );
  }
  PollModel copyWith({
    String? pollId,
    int? questionNo,
    String? question,
    List<String>? options,
    String? selectedOption,
  }) {
    return PollModel(
      pollId: pollId ?? this.pollId,
      questionNo: questionNo ?? this.questionNo,
      question: question ?? this.question,
      options: options ?? this.options,
      selectedOption: selectedOption ?? this.selectedOption,
    );
  }
}
