import 'package:dank_app/presentation/bindings/home_binding.dart';
import 'package:dank_app/presentation/pages/result_screen.dart';
import 'package:get/route_manager.dart';

import '../presentation/bindings/quiz_binding.dart';
import '../presentation/pages/home_screen.dart';
import '../presentation/pages/quiz_screen.dart';

class DankRoutes {
  DankRoutes._();

  static const String home = '/home';
  static const String quiz = '/quiz';
  static const String result = '/result';
}

class DankPages {
  DankPages._();

  static final pages = [
    GetPage(
      name: DankRoutes.home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: DankRoutes.quiz,
      page: () => const QuizScreen(),
      binding: QuizBinding(),
    ),
    GetPage(
      name: DankRoutes.result,
      page: () => const ResultScreen(),
    ),
  ];
}
