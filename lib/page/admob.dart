import 'dart:io';

import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MontadorAnuncios {
  static void Inicializar() {
    FirebaseAdMob.instance.initialize(appId: getAppId());
  }

  static void Bar() {
    MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
//      keywords: <String>['flutterio', 'beautiful apps'],
//      contentUrl: 'https://flutter.io',
//      birthday: DateTime.now(),
//      childDirected: false,
//      designedForFamilies: false,
//      gender: MobileAdGender.male, // or MobileAdGender.female, MobileAdGender.unknown
//      testDevices: <String>[], // Android emulators are considered test devices
        );

    BannerAd myBanner = BannerAd(
      // Replace the testAdUnitId with an ad unit id from the AdMob dash.
      // https://developers.google.com/admob/android/test-ads
      // https://developers.google.com/admob/ios/test-ads
      adUnitId: BannerAd.testAdUnitId,
      size: AdSize.smartBanner,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("BannerAd event is $event");
      },
    );

    myBanner.listener = (event) {
      if (event == MobileAdEvent.loaded)
        myBanner.show(anchorType: AnchorType.bottom,
            anchorOffset: 0.0,
        horizontalCenterOffset: 0.0);
    };

    myBanner.load();
  }

  static void Prepare(RewardEvent rewardEvent) {
    MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
        //keywords: <String>['flutterio', 'beautiful apps'],
        //contentUrl: 'https://flutter.io',
        //birthday: DateTime.now(),
        //childDirected: false,
        //designedForFamilies: false,
        //gender: MobileAdGender.male, // or MobileAdGender.female, MobileAdGender.unknown
        //testDevices: <String>[], // Android emulators are considered test devices
        );

    var instanceAd = RewardedVideoAd.instance;

    var load = () => instanceAd.load(
        adUnitId: getRewardedVideoAdUnitId(), targetingInfo: targetingInfo);

    instanceAd.listener = (event, {rewardType, rewardAmount}) {
      switch (event) {
        case RewardedVideoAdEvent.loaded:
          instanceAd.show();
          break;
        case RewardedVideoAdEvent.failedToLoad:
          load();
          break;
        case RewardedVideoAdEvent.opened:
          // TODO: Handle this case.
          break;
        case RewardedVideoAdEvent.leftApplication:
          // TODO: Handle this case.
          break;
        case RewardedVideoAdEvent.closed:
          //load();
          break;
        case RewardedVideoAdEvent.rewarded:
          //load();
          rewardEvent(rewardType, rewardAmount);
          break;
        case RewardedVideoAdEvent.started:
          // TODO: Handle this case.
          break;
        case RewardedVideoAdEvent.completed:
          //load();
          break;
      }
    };

    load();
  }
}

typedef void RewardEvent(String type, int amount);

String getRewardedVideoAdUnitId() {
  if (!kReleaseMode) return RewardedVideoAd.testAdUnitId;

  if (Platform.isIOS) {
    return 'ca-app-pub-XXXXXXXXXXXXXXXX/XXXXXXXXXX';
  } else if (Platform.isAndroid) {
    return 'ca-app-pub-8117934386190849/9268297421';
  }
  return null;
}

String getAppId() {
  if (!kReleaseMode) return FirebaseAdMob.testAppId;

  if (Platform.isIOS) {
    return 'ca-app-pub-XXXXXXXXXXXXXXXX/XXXXXXXXXX';
  } else if (Platform.isAndroid) {
    return 'ca-app-pub-8117934386190849~2567157709';
  }

  return null;
}
