import 'dart:io';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdController extends GetxController {
  InterstitialAd? interstitialAd;

  final String _androidAdUnitId = 'ca-app-pub-3940256099942544/1033173712';
  final String _iOSAdUnitId = 'ca-app-pub-3940256099942544/4411468910';

  @override
  void onInit() {
    loadAd();
    super.onInit();
  }

  void loadAd() {
    InterstitialAd.load(
      adUnitId: Platform.isAndroid ? _androidAdUnitId : _iOSAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          interstitialAd = ad;
        },
        onAdFailedToLoad: (LoadAdError error) {},
      ),
    );
  }
}
