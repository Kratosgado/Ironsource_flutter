import 'package:flutter/material.dart';
import 'package:flutter_ironsource_x/ironsource.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:watch_ads/main.dart';

class IronRewarded extends StatefulWidget {
  const IronRewarded({Key? key}) : super(key: key);

  @override
  State<IronRewarded> createState() => _IronRewardedState();
}

class _IronRewardedState extends State<IronRewarded> with IronSourceListener {
  @override
  initState() {
    super.initState();
    init();
  }

  void init() async {
    await IronSource.validateIntegration();
    await IronSource.setUserId("277097");
    await IronSource.initialize(
      appKey: "192b4a10d",
      listener: this,
      gdprConsent: true,
      ccpaConsent: false,
    );
  }

  @override
  void onRewardedVideoAdOpened() {}

  @override
  void onRewardedVideoAdClosed() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const GreetingPage()));
  }

  @override
  void onRewardedVideoAvailabilityChanged(bool isAvailable) {
    setState(() {
      _isRVAvailable = isAvailable;
    });
    Fluttertoast.showToast(msg: "video available");
  }

  @override
  void onRewardedVideoAdRewarded(placement) {}

  @override
  void onRewardedVideoAdShowFailed(error) {}
  @override
  void onRewardedVideoAdClicked(placement) {}

  @override
  void onRewardedVideoAdStarted() {}

  @override
  void onRewardedVideoAdEnded() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue,
              Colors.red,
            ],
          ),
        ),
        child: Card(
          margin:
              const EdgeInsets.only(top: 200, bottom: 200, left: 30, right: 30),
          elevation: 20,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "DEMO ADS APP",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: MaterialButton(
                  color: Colors.teal[100],
                  elevation: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 30.0,
                        width: 30.0,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/googleimage.png',
                            ),
                            fit: BoxFit.cover,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text("Watch Ad"),
                    ],
                  ),
                  onPressed: () async {
                    if (await IronSource.isRewardedVideoAvailable()) {
                      IronSource.showRewardedVideo();
                    } else {
                      Fluttertoast.showToast(msg: "Video not available");
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IronBanner extends StatefulWidget {
  const IronBanner({super.key});

  @override
  State<IronBanner> createState() => _IronBannerState();
}

class _IronBannerState extends State<IronBanner> with IronSourceBannerListener {
  @override
  void onBannerAdClicked() {
    // TODO: implement onBannerAdClicked
  }

  @override
  void onBannerAdLeftApplication() {
    // TODO: implement onBannerAdLeftApplication
  }

  @override
  void onBannerAdLoadFailed(Map<String, dynamic> error) {
    // TODO: implement onBannerAdLoadFailed
  }

  @override
  void onBannerAdLoaded() {
    // TODO: implement onBannerAdLoaded
  }

  @override
  void onBannerAdScreenDismissed() {
    // TODO: implement onBannerAdScreenDismissed
  }

  @override
  void onBannerAdScreenPresented() {
    // TODO: implement onBannerAdScreenPresented
  }

  @override
  Widget build(BuildContext context) {
    return IronSourceBannerAd(
      keepAlive: true,
      listener: this,
      size: BannerSize.BANNER,
    );
  }
}
