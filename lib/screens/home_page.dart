import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_news/controller/home_controller.dart';
import 'package:timeago/timeago.dart' as timeAgo;
import 'package:world_news/model/article.dart';

class HomePage extends StatelessWidget {
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: controller,
      builder: (_) => _buildHeadlineSlider(context, controller.articleList),
    );
  }

  Widget _buildHeadlineSlider(
      BuildContext context, List<ArticleModel> articles) {
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(
            enlargeCenterPage: false, height: 200, viewportFraction: 0.8),
        items: _getNewsSliders(context, articles),
      ),
    );
  }

  List<Widget> _getNewsSliders(
      BuildContext context, List<ArticleModel> articles) {
    return articles
        .map((article) => GestureDetector(
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => NewsDetailsScreen(
                //         articleModel: article,
                //       ),
                //     ));
              },
              child: Container(
                padding:
                    EdgeInsets.only(left: 5, top: 10, right: 5, bottom: 10),
                child: Stack(
                  children: [
                    Hero(
                      tag: article.hashCode,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            shape: BoxShape.rectangle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: article.urlToImage == null
                                    ? AssetImage(
                                        "assets/image/news_placeholder.jpeg")
                                    : NetworkImage(article.urlToImage))),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        gradient: LinearGradient(
                            colors: [
                              Colors.black.withOpacity(0.9),
                              Colors.white.withOpacity(0.0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            stops: [0.1, 0.9]),
                      ),
                    ),
                    Positioned(
                      bottom: 30,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          article.title,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      left: 10,
                      child: Text(
                        article.source.name,
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                            color: Colors.white70),
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      right: 10,
                      child: Text(
                        _getTimeOfArticle(DateTime.parse(article.publishedAt)),
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                            color: Colors.white60),
                      ),
                    ),
                  ],
                ),
              ),
            ))
        .toList();
  }

  String _getTimeOfArticle(DateTime dateTime) {
    return timeAgo.format(dateTime, allowFromNow: true, locale: 'en');
  }
}
