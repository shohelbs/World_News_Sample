import 'package:world_news/controller/base_controller.dart';
import 'package:world_news/utils/app_helper.dart';

class MainController extends BaseController {
  int defaultNavItem = 0;

  pickNavItem(int index) {
    switch (index) {
      case 0:
        defaultNavItem = AppHelper.home;
        break;
      case 1:
        defaultNavItem = AppHelper.sources;
        break;
      case 2:
        defaultNavItem = AppHelper.search;
        break;
    }
    update();
  }
}
