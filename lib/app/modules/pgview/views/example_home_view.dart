// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:flower_app/app/data/atom/custom_appbar.dart';

class ExHomeView extends GetView<ExHomeViewController> {
  const ExHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _AppBar(),
          _Space(),
          SliverToBoxAdapter(
            child: Container(
              child: TabBar(
                onTap: (i) {
                  controller.changeTabIndex(i);
                },
                controller: controller.tabController,
                tabs: [
                  Container(
                    height: 30,
                    child: Center(
                      child: Text("Page One"),
                    ),
                  ),
                  Container(
                    height: 30,
                    child: Center(
                      child: Text("Page Two"),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: controller.tabController,
              children: [
                _ContentTabBarView(
                  i: 1,
                ),
                _ContentTabBarView(
                  i: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ContentTabBarView extends StatelessWidget {
  final int i;

  const _ContentTabBarView({
    Key? key,
    required this.i,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: i == 1
          ? Color.fromARGB(255, 202, 143, 139)
          : Color.fromARGB(255, 139, 202, 164),
      child: Center(child: Text("TabBarView $i ")),
    );
  }
}

class _Space extends StatelessWidget {
  const _Space({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(height: 20),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: CustomAppbar(title: "ExHomeView"),
    );
  }
}

class ExHomeViewController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  var indexPage = 0.obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(vsync: this, length: 2);
  }

  void changeTabIndex(int i) {
    indexPage.value = i;
  }
}
