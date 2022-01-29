import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/themes/dank_colors.dart';
import '../../core/themes/dank_text_theme.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          DankColors.dankLightGrey,
        ),
        padding: MaterialStateProperty.all<EdgeInsets>(
          const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 8.0,
          ),
        ),
      ),
      onPressed: () {
        Get.snackbar(
          '😊',
          '조금만 더 힘내세요!',
          snackPosition: SnackPosition.BOTTOM,
        );
      },
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 1.0,
                color: DankColors.dankBlack,
              ),
              color: DankColors.dankLightGrey,
            ),
            child: const Center(
                child: Text(
              '1',
              style: DankTextTheme.headline3,
            )),
          ),
          const SizedBox(width: 20),
          const Text(
            'Answer1',
            style: DankTextTheme.subtitle2,
          ),
          const Spacer(),
          IconButton(
            padding: EdgeInsets.zero,
            alignment: Alignment.centerRight,
            onPressed: () {},
            icon: const Icon(
              Icons.edit_off_outlined,
              color: DankColors.dankBlack,
            ),
          )
        ],
      ),
    );
  }
}
