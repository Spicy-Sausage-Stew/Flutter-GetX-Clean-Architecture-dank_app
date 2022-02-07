import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../config/dank_url.dart';
import '../models/quiz_model.dart';

part 'quiz_client.g.dart';

@RestApi(baseUrl: DankUrl.baseUrl)
abstract class QuizClient {
  factory QuizClient(Dio dio, {String baseUrl}) = _QuizClient;

  @GET(DankUrl.quizUrl)
  Future<List<QuizModel>> getQuiz();
}
