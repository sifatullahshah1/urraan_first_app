import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdmobManager {
  static final app_id = "ca-app-pub-3940256099942544~3347511713";
  static final app_open_id = "ca-app-pub-3940256099942544/3419835294";
  static final banner_id = "ca-app-pub-3940256099942544/6300978111";
  static final inter_id = "ca-app-pub-3940256099942544/1033173712";
  static final inter_video_id = "ca-app-pub-3940256099942544/8691691433";
  static final rewarded_id = "ca-app-pub-3940256099942544/5224354917";
  static final rewarded_intertitial_id =
      "ca-app-pub-3940256099942544/1033173712";
  static final native_advanced_id = "ca-app-pub-3940256099942544/2247696110";
  static final native_advanced_video_id =
      "ca-app-pub-3940256099942544/1044960115";

  //==========================================================

  static final android_app_id = "ca-app-pub-3940256099942544~3347511713";
  static final android_app_open_id = "ca-app-pub-3940256099942544/3419835294";
  static final android_banner_id = "ca-app-pub-3940256099942544/6300978111";
  static final android_inter_id = "ca-app-pub-3940256099942544/1033173712";
  static final android_inter_video_id =
      "ca-app-pub-3940256099942544/8691691433";
  static final android_rewarded_id = "ca-app-pub-3940256099942544/5224354917";
  static final android_rewarded_intertitial_id =
      "ca-app-pub-3940256099942544/1033173712";
  static final android_native_advanced_id =
      "ca-app-pub-3940256099942544/2247696110";
  static final android_native_advanced_video_id =
      "ca-app-pub-3940256099942544/1044960115";

  //==========================================================

  static final ios_app_id = "ca-app-pub-3940256099942544~3347511713";
  static final ios_app_open_id = "ca-app-pub-3940256099942544/3419835294";
  static final ios_banner_id = "ca-app-pub-3940256099942544/6300978111";
  static final ios_inter_id = "ca-app-pub-3940256099942544/1033173712";
  static final ios_inter_video_id = "ca-app-pub-3940256099942544/8691691433";
  static final ios_rewarded_id = "ca-app-pub-3940256099942544/5224354917";
  static final ios_rewarded_intertitial_id =
      "ca-app-pub-3940256099942544/1033173712";
  static final ios_native_advanced_id =
      "ca-app-pub-3940256099942544/2247696110";
  static final ios_native_advanced_video_id =
      "ca-app-pub-3940256099942544/1044960115";

  static String GetBannerId() {
    if (kDebugMode) {
      return banner_id;
    } else if (Platform.isAndroid) {
      return android_banner_id;
    } else {
      return ios_banner_id;
    }
  }

  static String GetIntertitialId() {
    if (kDebugMode) {
      return inter_id;
    } else if (Platform.isAndroid) {
      return android_inter_id;
    } else {
      return ios_inter_id;
    }
  }

  static String GetRewardedIntertitialId() {
    if (kDebugMode) {
      return "ca-app-pub-3940256099942544/5354046379";
    } else if (Platform.isAndroid) {
      return android_rewarded_intertitial_id;
    } else {
      return ios_rewarded_intertitial_id;
    }
  }

  static String GetRewardedId() {
    if (kDebugMode) {
      return rewarded_id;
    } else if (Platform.isAndroid) {
      return android_rewarded_intertitial_id;
    } else {
      return ios_rewarded_intertitial_id;
    }
  }

  static Widget GetBannerView(bool isDisplayBannerAds, BannerAd bannerAd) {
    return Container(
      color: Colors.grey.shade200,
      padding: EdgeInsets.symmetric(vertical: 6),
      width: double.infinity,
      height: bannerAd.size.height.toDouble(),
      child: isDisplayBannerAds ? AdWidget(ad: bannerAd) : SizedBox(),
    );
  }
}
