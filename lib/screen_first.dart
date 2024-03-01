import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:urraan_first_app/admob_manager.dart';

class ScreenFirst extends StatefulWidget {
  const ScreenFirst({super.key});

  @override
  State<ScreenFirst> createState() => _ScreenFirstState();
}

class _ScreenFirstState extends State<ScreenFirst> {
  //======= Intertitials Ads Work =====================
  bool isIntertitialAdLoaded = false;
  late InterstitialAd interstitialAd;

  loadIntertitialAd() {
    InterstitialAd.load(
      adUnitId: AdmobManager.GetIntertitialId(),
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (interstitialAd) {
          setState(() {
            this.interstitialAd = interstitialAd;
            isIntertitialAdLoaded = true;
          });
        },
        onAdFailedToLoad: (error) {
          print(error.responseInfo);
          print(error.message);
          print(error.code);
          setState(() {
            this.interstitialAd.dispose();
            isIntertitialAdLoaded = false;
          });
        },
      ),
    );
  }
  //======= Intertitials Ads Work =====================

  @override
  void initState() {
    super.initState();
    loadIntertitialAd();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (isInvoked) {
        if (isIntertitialAdLoaded) {
          interstitialAd.show();
        }
        Navigator.pop(context);
      },
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              if (isIntertitialAdLoaded) {
                interstitialAd.show();
              }
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
          title: Text("First Screen"),
        ),
      ),
    );
  }
}
