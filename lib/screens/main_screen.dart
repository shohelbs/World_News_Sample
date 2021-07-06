import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_news/controller/main_controller.dart';
import 'package:world_news/screens/search_page.dart';
import 'package:world_news/screens/sources_page.dart';
import 'package:world_news/utils//theme.dart' as Style;
import 'package:world_news/utils/app_helper.dart';

import 'home_page.dart';

class MainScreen extends StatelessWidget {
  final controller = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: controller,
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text('World News'),
          centerTitle: true,
        ),
        body: getBodyView(controller.defaultNavItem),
        bottomNavigationBar: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey[100], blurRadius: 14, spreadRadius: 1),
                ]),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              child: BottomNavigationBar(
                backgroundColor: Colors.white,
                unselectedItemColor: Style.Colors.grey,
                iconSize: 22,
                selectedFontSize: 10,
                unselectedFontSize: 10,
                type: BottomNavigationBarType.fixed,
                currentIndex: controller.defaultNavItem,
                onTap: controller.pickNavItem,
                fixedColor: Style.Colors.mainColor,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(EvaIcons.homeOutline),
                    activeIcon: Icon(EvaIcons.home),
                    title: Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        "Home",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(EvaIcons.gridOutline),
                    activeIcon: Icon(EvaIcons.grid),
                    title: Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        "Source",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(EvaIcons.searchOutline),
                    activeIcon: Icon(EvaIcons.search),
                    title: Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        "Search",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  Widget getBodyView(int navItem) {
    switch (navItem) {
      case AppHelper.home:
        return HomePage();
      case AppHelper.sources:
        return SourcesPage();
      case AppHelper.search:
        return SearchPage();
      default:
        return Container();
    }
  }
}
