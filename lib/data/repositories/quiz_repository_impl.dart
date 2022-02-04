import '../../domain/entities/quiz.dart';
import '../../domain/repositories/quiz_repository.dart';
import '../datasources/quiz_data_source.dart';

class QuizRepositoryImpl implements QuizRepository {
  final QuizDataSource quizDataSource;

  QuizRepositoryImpl({required this.quizDataSource});

  @override
  Future<List<Quiz>> getQuiz() async {
    return await quizDataSource.getQuiz();
  }
}
