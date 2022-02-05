import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/themes/dank_colors.dart';
import '../../core/themes/dank_text_theme.dart';
import '../controllers/quiz_controller.dart';

class OptionButton extends GetWidget<QuizController> {
  final int optionNumber;

  const OptionButton({
    Key? key,
    required this.optionNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            controller.selectedOption.value == optionNumber ? DankColors.dankGrey : DankColors.dankLightGrey,
          ),
          elevation: MaterialStateProperty.all<double>(0),
          padding: MaterialStateProperty.all<EdgeInsets>(
            const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 8.0,
            ),
          ),
        ),
        onPressed: _onPressed,
        child: Row(
          children: [
            _NumberContainer(optionNumber: optionNumber),
            const SizedBox(width: 20),
            _OptionText(optionNumber: optionNumber),
            const Spacer(),
            _RemoveOptionButton(optionNumber: optionNumber),
          ],
        ),
      ),
    );
  }

  void _onPressed() {
    if (!controller.removedOptions.contains(optionNumber)) {
      if (controller.currentQuestionNumber.isOdd) {
        Get.snackbar(
          '😊',
          '조금만 더 힘내세요!',
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(milliseconds: 1000),
        );
      }
      controller.selectOption(optionNumber);
    }
  }
}

class _NumberContainer extends GetWidget<QuizController> {
  const _NumberContainer({
    Key? key,
    required this.optionNumber,
  }) : super(key: key);

  final int optionNumber;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 1.0,
            color: controller.removedOptions.contains(optionNumber) ? DankColors.dankGrey : DankColors.dankBlack,
          ),
          color: controller.selectedOption.value == optionNumber ? DankColors.dankBlack : DankColors.dankLightGrey,
        ),
        child: Center(
            child: Text(
          '$optionNumber',
          style: DankTextTheme.headline3.copyWith(
            color: controller.selectedOption.value == optionNumber
                ? DankColors.dankWhite
                : controller.removedOptions.contains(optionNumber)
                    ? DankColors.dankGrey
                    : DankColors.dankBlack,
          ),
        )),
      ),
    );
  }
}

class _OptionText extends GetWidget<QuizController> {
  const _OptionText({
    Key? key,
    required this.optionNumber,
  }) : super(key: key);

  final int optionNumber;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Text(
          controller.options[controller.questionIndex.value][optionNumber - 1],
          style: DankTextTheme.subtitle2.copyWith(
            color: controller.removedOptions.contains(optionNumber) ? DankColors.dankGrey : DankColors.dankBlack,
          ),
        );
      },
    );
  }
}

class _RemoveOptionButton extends GetWidget<QuizController> {
  final int optionNumber;

  const _RemoveOptionButton({
    Key? key,
    required this.optionNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: 1,
      padding: EdgeInsets.zero,
      alignment: Alignment.centerRight,
      onPressed: () => controller.removeOption(optionNumber),
      icon: Obx(
        () => Icon(
          controller.removedOptions.contains(optionNumber) ? Icons.edit_off_sharp : Icons.edit_off_outlined,
          color: DankColors.dankBlack,
        ),
      ),
    );
  }
}
