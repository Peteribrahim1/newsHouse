import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:provider/provider.dart';

import '../providers/news_provider.dart';
import '../widgets/news_item.dart';


class NewsScreen extends StatefulWidget {
  static const routeName = '/news';

  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  //define class members
  late final BannerAd bannerAd;
  bool isAdLoaded = false;
  //final String adUnitId = "ca-app-pub-4953766457305867/9693512176";
  final String adUnitId = "ca-app-pub-3940256099942544/6300978111";
  bool loadingAd = false;


  @override
  void initState() {
    super.initState();
    loadAd();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final newsProvider = Provider.of<NewsProvider>(context, listen: false);
      newsProvider.getNews();
      setState(() {});
    });

    // //initialize banner ad
    // bannerAd = BannerAd(
    //     size: AdSize.banner,
    //     adUnitId: adUnitId,
    //     listener: BannerAdListener(
    //       onAdLoaded: (ad) {
    //         setState(() {
    //           isAdLoaded = true;
    //         });
    //       },
    //       onAdFailedToLoad: (ad, error) {
    //         ad.dispose();
    //         print(error);
    //       },
    //     ),
    //     request: const AdRequest());
    // // load ad here
    // bannerAd.load();
  }

  /// Loads a banner ad.
  void loadAd() {
    bannerAd = BannerAd(
      adUnitId: adUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          debugPrint('$ad loaded.');
          setState(() {
            loadingAd = true;
          });
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (ad, err) {
          debugPrint('BannerAd failed to load: $err');
          // Dispose the ad here to free resources.
          ad.dispose();
        },
      ),
    )..load();
  }

  @override
  Widget build(BuildContext context) {
    final getNewsProvider = context.watch<NewsProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Newz House",
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600)),
        backgroundColor: Colors.white70,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body:
      SafeArea(
        child: Consumer<NewsProvider>(
          builder: (context, newsProvider, child) {
            return newsProvider.isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  )
                : ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: getNewsProvider.newsDisplay?.length,
                    itemBuilder: (context, index) {
                      final newsDataVariable =
                          getNewsProvider.newsDisplay![index];
                      return NewsItem(newsItem: newsDataVariable!);
                    },
                  );
          },
        ),
      ),
      bottomNavigationBar: loadingAd
          ? SizedBox(
              height: bannerAd.size.height.toDouble(),
              width: bannerAd.size.width.toDouble(),
              child: AdWidget(ad: bannerAd),
            )
          : const SizedBox(),
    );
  }
}
