import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/quiz.dart';

part 'quiz_model.freezed.dart';
part 'quiz_model.g.dart';

@freezed
class QuizModel extends Quiz with _$QuizModel {
  factory QuizModel({
    required String title,
    required String body,
    required int answer,
  }) = _QuizModel;

  factory QuizModel.fromJson(Map<String, dynamic> json) =>
      _$QuizModelFromJson(json);
}
