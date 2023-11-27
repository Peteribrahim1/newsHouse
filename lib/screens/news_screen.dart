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

  final String adUnitId = "ca-app-pub-3637998541481333/4205596050";
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
      body: getNewsProvider.resMessage == 'Internet connection not available'
          ? const Padding(
              padding: EdgeInsets.all(20.0),
              child: Center(
                child: Text(
                  'No or bad internet connection! Check your connection, close and restart the app again.',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            )
          : SafeArea(
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
