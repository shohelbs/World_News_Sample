import 'package:world_news/model/source.dart';

class ArticleModel {
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;
  final SourceModel source;

  ArticleModel(this.author, this.title, this.description, this.url,
      this.urlToImage, this.publishedAt, this.content, this.source);

  ArticleModel.fromJson(Map<String, dynamic> map)
      : author = map["author"],
        title = map["title"],
        description = map["description"],
        url = map["url"],
        urlToImage = map["urlToImage"],
        publishedAt = map["publishedAt"],
        content = map["content"],
        source = SourceModel.fromJson(map["source"]);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['author'] = author;
    data['title'] = title;
    data['description'] = description;
    data['url'] = url;
    data['urlToImage'] = urlToImage;
    data['publishedAt'] = publishedAt;
    data['content'] = content;
    data['source'] = source;
    return data;
  }
}
