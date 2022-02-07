import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../core/dank_routes.dart';
import '../../core/themes/dank_colors.dart';
import '../../core/themes/dank_text_theme.dart';
import '../controllers/quiz_controller.dart';
import '../widgets/option_buttion.dart';

class QuizScreen extends GetWidget<QuizController> {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: controller.obx(
      (state) => Scaffold(
        backgroundColor: DankColors.dankLightGrey,
        appBar: const _QuizAppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            _ProgressIndicator(),
            _Question(),
            _OptionsContainer(),
            SizedBox(height: 20),
            _SubmitButton(),
          ],
        ),
      ),
    ));
  }
}

class _QuizAppBar extends GetWidget<QuizController> implements PreferredSizeWidget {
  const _QuizAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () => Get.offAllNamed(DankRoutes.home),
        icon: const Icon(Icons.close_sharp),
      ),
      backgroundColor: DankColors.dankBlack,
      centerTitle: false,
      title: Obx(
        () {
          final remainQuestions = controller.questions.length - controller.currentQuestionNumber.value;
          return Text(
            '$remainQuestions 문제 남았어요',
            style: DankTextTheme.bodyText2.copyWith(color: DankColors.dankWhite),
          );
        },
      ),
      actions: [
        Center(
          child: Obx(
            () => Text(
              controller.time.value,
              style: DankTextTheme.bodyText2.copyWith(color: DankColors.dankWhite),
            ),
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _ProgressIndicator extends GetWidget<QuizController> {
  const _ProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final percent = controller.currentQuestionNumber.value / controller.questions.length;

        return LinearPercentIndicator(
          padding: EdgeInsets.zero,
          lineHeight: 5.0,
          percent: percent,
          backgroundColor: DankColors.dankLightRed,
          progressColor: DankColors.dankRed,
        );
      },
    );
  }
}

class _Question extends GetWidget<QuizController> {
  const _Question({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          Obx(
            () => Text(
              'Qeustion ${controller.currentQuestionNumber}',
              style: DankTextTheme.headline5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 36.0),
            child: Obx(
              () => Text(
                controller.questions[controller.questionIndex.value],
                style: DankTextTheme.subtitle2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _OptionsContainer extends GetWidget<QuizController> {
  const _OptionsContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 0,
      child: Obx(
        () => ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: controller.options[controller.questionIndex.value].length,
          itemBuilder: (context, index) {
            return OptionButton(optionNumber: index + 1);
          },
        ),
      ),
    );
  }
}

class _SubmitButton extends GetWidget<QuizController> {
  const _SubmitButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(
        () => ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              DankColors.dankDarkGrey,
            ),
          ),
          onPressed: controller.selectedOption.value == 0
              ? null
              : () {
                  controller.addOption();
                  controller.resetOptions();

                  if (controller.isDone.value) {
                    controller.setTime();
                    controller.calcuateScore();
                    Get.offAllNamed(DankRoutes.result, arguments: controller.results);
                  } else {
                    controller.increaseIndex();
                  }
                },
          child: Text(
            controller.isDone.value ? '제출 하기' : '다음 문제',
            style: DankTextTheme.bodyText2.copyWith(color: DankColors.dankWhite),
          ),
        ),
      ),
    );
  }
}
