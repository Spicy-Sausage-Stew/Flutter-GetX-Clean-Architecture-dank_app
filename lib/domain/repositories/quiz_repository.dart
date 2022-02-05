import '../entities/quiz.dart';

abstract class QuizRepository {
  Future<List<Quiz>> getQuiz();
}
