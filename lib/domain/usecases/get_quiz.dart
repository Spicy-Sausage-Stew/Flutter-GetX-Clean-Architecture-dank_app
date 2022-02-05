import '../repositories/quiz_repository.dart';
import 'use_case.dart';

class GetQuiz implements UseCase {
  final QuizRepository quizRepository;

  GetQuiz({required this.quizRepository});

  @override
  Future call() async {
    return await quizRepository.getQuiz();
  }
}
