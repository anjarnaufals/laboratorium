import 'package:get/get.dart';

class MainController extends GetxController {
  var isSearchOpen = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void OpenSearch() {
    isSearchOpen.value = !isSearchOpen.value;
  }
}
