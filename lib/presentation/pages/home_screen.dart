import 'package:dank_app/presentation/widgets/dank_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../config/dank_url.dart';
import '../../core/dank_routes.dart';
import '../../core/themes/dank_colors.dart';
import '../../core/themes/dank_text_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: DankColors.dankBlack,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 40.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('빅데이터 시험대비',
                  textAlign: TextAlign.center,
                  style: DankTextTheme.headline1.copyWith(
                    color: DankColors.dankWhite,
                  )),
              const SizedBox(height: 200),
              TextButton(
                onPressed: () => launch(DankUrl.dataManimLink),
                child: Text(
                  '작업형 문제풀이 링크로 들어가기',
                  style: DankTextTheme.bodyText2.copyWith(
                    color: DankColors.dankWhite,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () => launch(DankUrl.openKakao),
                child: Text(
                  '오픈 카톡방 들어가기',
                  style: DankTextTheme.bodyText2.copyWith(
                    color: DankColors.dankWhite,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              DankElevatedButton(
                onPressed: () => Get.toNamed(DankRoutes.quiz),
                child: Text(
                  '지금 문제 풀기',
                  style: DankTextTheme.bodyText2.copyWith(
                    color: DankColors.dankWhite,
                  ),
                ),
                color: DankColors.dankRed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
