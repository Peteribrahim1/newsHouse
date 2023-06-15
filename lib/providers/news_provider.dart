import 'package:flutter/material.dart';
import '../model/news_model.dart';
import 'package:http/http.dart' as http;

class NewsProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<ArticleAttribute?>? _news = [];
  List<ArticleAttribute?>? get news => _news;

  List<ArticleAttribute?>? _newsDisplay = [];
  List<ArticleAttribute?>? get newsDisplay => _newsDisplay;

//fetch news
  Future<List<ArticleAttribute?>> getNews() async {
    List<ArticleAttribute?>? newsHere = [];
    _newsDisplay = [];
    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.get(
        Uri.parse('http://newsapi.org/v2/top-headlines?country=us&category=general&apiKey=e71c0ad4b46a4b9d911ce5c43aac4d0e'),
      );

      if (response.statusCode == 200) {
        // print('fetch success');
        final news = newsFromJson(response.body);
        _news = news.articles;
        _newsDisplay!.addAll(_news!);

        _isLoading = false;
        notifyListeners();
      }
      _isLoading = false;
      notifyListeners();
    } catch (err) {
      debugPrint(err.toString());
    }
    _isLoading = false;
    notifyListeners();
    return newsHere!;
  }


}
