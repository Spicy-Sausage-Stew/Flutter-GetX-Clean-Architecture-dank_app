import 'package:get/instance_manager.dart';

import '../../domain/usecases/get_quiz.dart';
import '../controllers/quiz_controller.dart';

class QuizBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => QuizController(
        getQuiz: Get.find<GetQuiz>(),
      ),
    );
  }
}
