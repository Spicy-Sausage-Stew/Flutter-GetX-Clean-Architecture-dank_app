import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';

import '../../data/datasources/quiz_client.dart';
import '../../data/datasources/quiz_data_source.dart';
import '../../data/repositories/quiz_repository_impl.dart';
import '../../domain/usecases/get_quiz.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Dio());
    Get.lazyPut(() => QuizClient(Get.find<Dio>()));
    Get.lazyPut(() => QuizDataSourceImpl(quizClient: Get.find<QuizClient>()));
    Get.lazyPut(() => QuizRepositoryImpl(quizDataSource: Get.find<QuizDataSourceImpl>()));
    Get.lazyPut(() => GetQuiz(quizRepository: Get.find<QuizRepositoryImpl>()));
  }
}
