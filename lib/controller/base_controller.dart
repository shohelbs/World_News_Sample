import 'package:get/get.dart';

class BaseController extends GetxController {
  var isLoading = false.obs;

  void showLoader() {
    isLoading.value = true;
    update();
  }

  void hideLoader() {
    isLoading.value = false;
    update();
  }

  void showSnackBar({String title = 'Error', String body}) {
    Get.snackbar(title, body);
  }
}
