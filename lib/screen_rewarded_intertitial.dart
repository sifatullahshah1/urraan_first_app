import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:urraan_first_app/admob_manager.dart';

class ScreenRewardedIntertitial extends StatefulWidget {
  const ScreenRewardedIntertitial({super.key});

  @override
  State<ScreenRewardedIntertitial> createState() =>
      _ScreenRewardedIntertitialState();
}

class _ScreenRewardedIntertitialState extends State<ScreenRewardedIntertitial> {
  //======= Intertitials Ads Work =====================
  bool isIntertitialAdLoaded = false;
  late RewardedInterstitialAd rewardedInterstitialAd;

  loadRewardedIntertitialAd() {
    RewardedInterstitialAd.load(
      adUnitId: AdmobManager.GetRewardedIntertitialId(),
      request: AdRequest(),
      rewardedInterstitialAdLoadCallback: RewardedInterstitialAdLoadCallback(
        onAdLoaded: (RewardedInterstitialAd rwIntertitialAd) {
          rewardedInterstitialAd = rwIntertitialAd;
          isIntertitialAdLoaded = true;
          setState(() {});
        },
        onAdFailedToLoad: (LoadAdError error) {
          print("objectobjectobjectobject ${error.responseInfo}");
          print("objectobjectobjectobject ${error.code}");
          print("objectobjectobjectobject ${error.message}");
        },
      ),
    );
  }

  bool isrewardedAdLoaded = false;
  late RewardedAd rewardedAd;
  loadRewardedAd() {
    RewardedAd.load(
      adUnitId: AdmobManager.GetRewardedIntertitialId(),
      request: AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (RewardedAd rewardedAd) {
          rewardedAd = rewardedAd;
          isrewardedAdLoaded = true;
          setState(() {});
        },
        onAdFailedToLoad: (LoadAdError error) {
          print("objectobjectobjectobject ${error.responseInfo}");
          print("objectobjectobjectobject ${error.code}");
          print("objectobjectobjectobject ${error.message}");
        },
      ),
    );
  }

  //======= Intertitials Ads Work =====================

  @override
  void initState() {
    super.initState();
    loadRewardedIntertitialAd();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (isInvoked) {
        Navigator.pop(context);
      },
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
          title: Text("Rewarded Intertitial Ads"),
        ),
        body: Container(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    if (isIntertitialAdLoaded) {
                      rewardedInterstitialAd.show(
                          onUserEarnedReward: (ad, rewarded) {
                        print("objectobjectobjectobjectobject Reward earned");
                      });
                    }
                  },
                  child: Text("Rewarded Intertitial Screen")),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    if (isrewardedAdLoaded) {
                      rewardedAd.show(onUserEarnedReward: (ad, rewarded) {
                        print("objectobjectobjectobjectobject Reward earned");
                      });
                    }
                  },
                  child: Text("Rewarded  Screen"))
            ],
          ),
        ),
      ),
    );
  }
}
