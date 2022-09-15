// Package imports:
import 'package:flower_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class AutoRefreshController extends GetxController {
  late RefreshController refreshController;

  var backToRefresh = false.obs;
  var backLoad = false.obs;

  @override
  void onInit() {
    super.onInit();
    initialRefresh();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> initialRefresh() async {
    refreshController = RefreshController(initialRefresh: true);
    await Future.delayed(Duration(milliseconds: 1500));
    refreshController.refreshCompleted();
  }

  Future<void> onRefresh() async {
    await Future.delayed(Duration(milliseconds: 600));
    refreshController.refreshCompleted();
  }

  Future<void> onBackRefresh() async {
    if (backLoad.isTrue) {
      refreshController.requestRefresh();
      await Future.delayed(Duration(milliseconds: 1500));
      refreshController.refreshCompleted();
      backToRefresh(true);
      backLoad(false);
    }
  }

  Future<void> goToNextPage() async {
    backLoad.value = await Get.toNamed(Routes.AUTO_REFRESH_LVL2);
    onBackRefresh();
  }
}

class ArPageString {
  static const title = "Auto Refresh";
  static const String text1 =
      "# In this page, we learn how to implement \"Refresh On Open Page\". ";
  static const String text2 =
      "# And \"Refresh page\" on back while back from other page.";
  static const text3 =
      "# the next is implement go to page twice, and when back to this page trigger \"Refresh\".";
}
