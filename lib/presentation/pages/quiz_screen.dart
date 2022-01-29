import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../core/themes/dank_colors.dart';
import '../../core/themes/dank_text_theme.dart';
import '../widgets/answer_buttion.dart';
import 'home_screen.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: DankColors.dankLightGrey,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Get.off(const HomeScreen()),
            icon: const Icon(Icons.close_sharp),
          ),
          backgroundColor: DankColors.dankBlack,
          centerTitle: false,
          title: Text(
            '3문제 남았어요',
            style: DankTextTheme.bodyText2.copyWith(
              color: DankColors.dankWhite,
            ),
          ),
          actions: [
            Center(
              child: Text(
                '00:27',
                style: DankTextTheme.bodyText2.copyWith(
                  color: DankColors.dankWhite,
                ),
              ),
            ),
            const SizedBox(width: 16),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LinearPercentIndicator(
              padding: EdgeInsets.zero,
              lineHeight: 5.0,
              percent: 2 / 5,
              backgroundColor: DankColors.dankLightRed,
              progressColor: DankColors.dankRed,
            ),
            const _Question(),
            const AnswerButton(),
            const AnswerButton(),
            const AnswerButton(),
            const AnswerButton(),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    DankColors.dankDarkGrey,
                  ),
                ),
                onPressed: () {},
                child: Text(
                  '다음 문제',
                  style: DankTextTheme.bodyText2.copyWith(
                    color: DankColors.dankWhite,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Question extends StatelessWidget {
  const _Question({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SizedBox(height: 24),
          Text(
            'Qeustion 2',
            style: DankTextTheme.headline5,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 36.0),
            child: Text(
              '사용자의 요구에 따라 정보를 처리해주고 데이터베이스를 관리해주는 소프트웨어는?',
              style: DankTextTheme.subtitle2,
            ),
          ),
        ],
      ),
    );
  }
}
