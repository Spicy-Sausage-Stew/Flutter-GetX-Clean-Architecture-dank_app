import '../models/quiz_model.dart';
import 'quiz_client.dart';

abstract class QuizDataSource {
  Future<List<QuizModel>> getQuiz();
}

class QuizDataSourceImpl implements QuizDataSource {
  final QuizClient quizClient;

  QuizDataSourceImpl({required this.quizClient});

  @override
  Future<List<QuizModel>> getQuiz() async {
    try {
      return await quizClient.getQuiz();
    } catch (e) {
      throw Exception();
    }
  }
}
