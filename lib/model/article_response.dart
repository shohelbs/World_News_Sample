
import 'article.dart';

class ArticleResponse {
  final String status;
  final String message;
  final int totalResults;
  final List<ArticleModel> articles;


  ArticleResponse(this.status, this.message, this.totalResults, this.articles);

  ArticleResponse.fromJson(Map<String, dynamic> map)
      : status = map["status"],
        message = map["message"],
        totalResults = map["totalResults"],
        articles = (map["articles"] as List)
            .map((e) => new ArticleModel.fromJson(e))
            .toList();

  ArticleResponse.withError(String message)
      : articles = [],
        totalResults = 0,
        message = message,
        status = "error";

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = status;
    data['totalResults'] = totalResults;
    data['articles'] = articles;
    data['message'] = message;
    return data;
  }
}
