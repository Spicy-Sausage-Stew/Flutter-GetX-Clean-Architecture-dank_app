import 'dart:async';

import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/quiz.dart';
import '../../domain/usecases/get_quiz.dart';

class QuizController extends GetxController with StateMixin<QuizController> {
  final GetQuiz getQuiz;

  QuizController({required this.getQuiz});

  RxList<Quiz> quizzes = <Quiz>[].obs;
  RxList<int> answers = <int>[].obs;
  RxList<String> questions = <String>[].obs;
  RxList<List<String>> options = <List<String>>[].obs;

  RxInt currentQuestionNumber = 1.obs;
  RxInt questionIndex = 0.obs;

  RxBool isDone = false.obs;

  RxSet<int> removedOptions = <int>{}.obs;
  RxInt selectedOption = 0.obs;
  RxList<int> selectedOptions = <int>[].obs;

  late Timer _timer;
  RxString time = '00:00:00'.obs;

  Map<String, dynamic> results = {};

  @override
  void onInit() {
    _loadQuiz();
    _setTimer();
    super.onInit();
  }

  Future<void> _loadQuiz() async {
    change(state, status: RxStatus.loading());

    final res = await getQuiz();

    for (var quiz in res) {
      final question = quiz.title;
      final answer = quiz.answer;
      final quizBody = quiz.body.split('/');
      final option = List<String>.generate(quizBody.length, (index) {
        final optionText = quizBody[index].replaceAll('.', ' ');
        int splitIndex = optionText.indexOf(' ');
        if (splitIndex == -1) splitIndex = 1;

        return optionText.substring(splitIndex);
      });

      quizzes.add(quiz);
      questions.add(question);
      answers.add(answer);
      options.add(option);

      change(state, status: RxStatus.success());
    }
  }

  void _setTimer() {
    final startTime = DateTime.utc(0);

    int seconds = 0;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      seconds++;
      time(DateFormat('HH:mm:ss').format(startTime.add(Duration(seconds: seconds))).toString());
    });
  }

  void increaseIndex() {
    currentQuestionNumber++;
    questionIndex++;

    if (currentQuestionNumber.value == questions.length) {
      isDone(true);
    }
  }

  void selectOption(int option) {
    removedOptions.remove(option);
    selectedOption(option);
  }

  void removeOption(int option) {
    if (selectedOption.value == option) {
      selectedOption(0);
    }
    if (removedOptions.contains(option)) {
      removedOptions.remove(option);
    } else {
      removedOptions.add(option);
    }
  }

  void addOption() {
    selectedOptions.add(selectedOption.value);
  }

  void resetOptions() {
    selectedOption(0);
    removedOptions.removeWhere((element) => true);
  }

  void calcuateScore() {
    int score = 0;

    for (var i = 0; i < answers.length; i++) {
      if (answers[i] == selectedOptions[i]) {
        score += 10;
      }
    }

    results['score'] = score;
  }

  void setTime() {
    _timer.cancel();
    results['time'] = time;
  }
}
