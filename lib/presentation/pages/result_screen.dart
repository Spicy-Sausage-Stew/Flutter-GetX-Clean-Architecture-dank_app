import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/dank_routes.dart';
import '../../core/themes/dank_colors.dart';
import '../../core/themes/dank_text_theme.dart';
import '../controllers/ad_controller.dart';
import '../widgets/dank_elevated_button.dart';

class ResultScreen extends GetWidget<AdController> {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: DankColors.dankBlack,
          actions: [
            IconButton(
              onPressed: () => Get.offAllNamed(DankRoutes.home),
              icon: const Icon(Icons.home_sharp),
            ),
          ],
          title: Text(
            '시험 결과',
            style: DankTextTheme.bodyText2.copyWith(
              color: DankColors.dankWhite,
            ),
          ),
          centerTitle: false,
        ),
        backgroundColor: DankColors.dankLightGrey,
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '테스트 결과 리포트',
                    style: DankTextTheme.headline1,
                  ),
                  const SizedBox(height: 60),
                  _ReportResultRow(
                    title: '문제 풀이 시간',
                    resultText: '${Get.arguments['time']}',
                  ),
                  const SizedBox(height: 16),
                  _ReportResultRow(
                    title: '점수',
                    resultText: '${Get.arguments['score']}',
                  ),
                ],
              ),
              const Spacer(),
              DankElevatedButton(
                onPressed: () {
                  if (controller.interstitialAd == null) {
                    controller.loadAd();
                    controller.interstitialAd?.show();
                  } else {
                    controller.interstitialAd!.show();
                  }
                },
                child: Text(
                  '개발자 도와주러 가기',
                  style: DankTextTheme.bodyText2.copyWith(
                    color: DankColors.dankWhite,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              DankElevatedButton(
                onPressed: () => Get.offAllNamed(DankRoutes.home),
                child: Text(
                  '홈으로 돌아가기',
                  style: DankTextTheme.bodyText2.copyWith(
                    color: DankColors.dankWhite,
                  ),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

class _ReportResultRow extends StatelessWidget {
  final String title;
  final String resultText;

  const _ReportResultRow({
    Key? key,
    required this.title,
    required this.resultText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: DankTextTheme.headline5,
        ),
        Text(
          resultText,
          style: DankTextTheme.headline6,
        ),
      ],
    );
  }
}
