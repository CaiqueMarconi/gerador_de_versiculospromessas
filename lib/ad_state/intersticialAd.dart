import 'package:google_mobile_ads/google_mobile_ads.dart';


 final AdRequest request = AdRequest(
  nonPersonalizedAds: true,
);

InterstitialAd _interstitialAd;
bool _interstitialReady = false;

void createInterstitialAd() {
  _interstitialAd ??= InterstitialAd(
    adUnitId: InterstitialAd.testAdUnitId,
    request: request,
    listener: AdListener(
      onAdLoaded: (Ad ad) {
        print('${ad.runtimeType} loaded.');
        _interstitialReady = true;
      },
      onAdFailedToLoad: (Ad ad, LoadAdError error) {
        print('${ad.runtimeType} failed to load: $error.');
        ad.dispose();
        _interstitialAd = null;
        createInterstitialAd();
      },
      onAdOpened: (Ad ad) => print('${ad.runtimeType} onAdOpened.'),
      onAdClosed: (Ad ad) {
        print('${ad.runtimeType} closed.');
        ad.dispose();
        createInterstitialAd();
      },
      onApplicationExit: (Ad ad) =>
          print('${ad.runtimeType} onApplicationExit.'),
    ),
  )..load();
}