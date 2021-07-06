import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:world_news/model/article_response.dart';

class NewsRepository {
  static const String baseUrl = "https://newsapi.org/v2";
  final String apiKey = "2d5e2245aa3e4ea0b856ffdafe43e506";

  final sourcesUrl = "$baseUrl/sources";
  final topHeadlineUrl = "$baseUrl/top-headlines";
  final everythingUrl = "$baseUrl/everything";

  final Dio _dio = Dio();

  Future<ArticleResponse> getTopArticles() async {
    final params = {"apiKey": apiKey, "country": "us"};

    try {
      var response = await _dio.get(topHeadlineUrl, queryParameters: params);
      return ArticleResponse.fromJson(response.data);
    } catch (error) {
      showSnackBar(body: error.toString());
      return ArticleResponse.withError(error.toString());
    }
  }

  void showSnackBar({String title = 'Error', String body}) {
    Get.snackbar(title, body);
  }
}
