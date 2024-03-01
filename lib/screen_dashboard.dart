import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:urraan_first_app/admob_manager.dart';
import 'package:urraan_first_app/screen_first.dart';
import 'package:urraan_first_app/screen_rewarded_intertitial.dart';

class ScreenDashboard extends StatefulWidget {
  @override
  State<ScreenDashboard> createState() => _ScreenDashboardState();
}

class _ScreenDashboardState extends State<ScreenDashboard> {
  //======= Banner Ads Work =====================
  BannerAd? bannerAd;
  bool isBannerAdLoaded = false;

  loadBannerAd() {
    bannerAd = BannerAd(
      size: AdSize.leaderboard,
      adUnitId: AdmobManager.GetBannerId(),
      listener: BannerAdListener(onAdLoaded: (ad) {
        setState(() {
          isBannerAdLoaded = true;
          print("Ads Loaded");
        });
      }, onAdFailedToLoad: (ad, error) {
        print("Ads failed");
        ad.dispose();
        print(error.responseInfo);
        print(error.message);
        print(error.code);
      }),
      request: AdRequest(),
    );
    bannerAd!.load();
  }

  //======= Banner Ads Work =====================

  @override
  void initState() {
    super.initState();
    loadBannerAd();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admob Ads Integration"),
      ),
      bottomNavigationBar:
          AdmobManager.GetBannerView(isBannerAdLoaded, bannerAd!),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (builder) => ScreenFirst()));
                },
                child: Text("Open First Screen")),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => ScreenRewardedIntertitial()));
                },
                child: Text("Rewarded Intertitial Screen"))
          ],
        ),
      ),
    );
  }
}
