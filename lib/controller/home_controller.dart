import 'package:world_news/controller/base_controller.dart';
import 'package:world_news/model/article.dart';
import 'package:world_news/model/article_response.dart';
import 'package:world_news/network/news_repository.dart';

class HomeController extends BaseController {
  List<ArticleModel> articleList = [];
  final repository = NewsRepository();

  @override
  void onInit() {
    repository
        .getTopArticles()
        .then((articleResponse) => _addArticle(articleResponse));
    super.onInit();
  }

  _addArticle(ArticleResponse response) {
    articleList.clear();
    articleList.addAll(response.articles);
    update();
  }
}
