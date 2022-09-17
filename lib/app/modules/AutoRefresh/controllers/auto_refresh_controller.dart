// Package imports:
import 'package:get/get.dart';
import 'package:flower_app/app/routes/app_pages.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class AutoRefreshController extends GetxController {
  late RefreshController refreshController;

  var backToRefresh = false.obs;
  var backToRefresh2 = false.obs;
  var backLoad = false.obs;
  var backLoadLvl3 = false.obs;

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

  void initialRefresh() {
    refreshController = RefreshController(initialRefresh: true);
  }

  Future<void> onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1200));
    refreshController.refreshCompleted();
  }

  Future<void> onBackRefresh() async {
    if (backLoad.isTrue) {
      refreshController.requestRefresh();
      await Future.delayed(Duration(milliseconds: 1200));
      refreshController.refreshCompleted();
      backToRefresh(true);
      backLoad(false);
    }
  }

  Future<void> onBackRefreshLvl2() async {
    if (backLoadLvl3.isTrue) {
      refreshController.requestRefresh();
      await Future.delayed(Duration(milliseconds: 1200));
      refreshController.refreshCompleted();
      backToRefresh2(true);
      backLoadLvl3(false);
    }
  }

  Future<void> goToNextPage() async {
    backLoad.value = await Get.toNamed(Routes.AUTO_REFRESH_LVL2);
    onBackRefresh();
  }

  Future<void> goToNextPageLvl3() async {
    backLoadLvl3.value = await Get.toNamed(Routes.AUTO_REFRESH_LVL2);
    onBackRefreshLvl2();
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
