// Flutter imports:
import 'package:flower_app/app/data/atom/custom_appbar.dart';
import 'package:flower_app/app/data/atom/custom_header_refresh.dart';
import 'package:flower_app/app/data/atom/loading_indicator.dart';
import 'package:flower_app/app/modules/custombutton/views/custombutton_view.dart';
import 'package:flower_app/app/utils/style.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

// Project imports:
import '../controllers/auto_refresh_controller.dart';

class AutoRefreshView extends GetView<AutoRefreshController> {
  @override
  Widget build(BuildContext context) {
    final c = controller;
    return Scaffold(
      appBar: CustomAppbar(
        title: ArPageString.title,
        backButton: true,
      ),
      body: SmartRefresher(
        header: CustomHeaderRefresh(),
        controller: c.refreshController,
        onRefresh: c.onRefresh,
        child: CustomScrollView(
          slivers: [
            _PageDesc(),
            _Content(),
            _Content2(),
          ],
        ),
      ),
    );
  }
}

class _Content2 extends GetWidget<AutoRefreshController> {
  const _Content2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final c = controller;
    return SliverPadding(
      padding: const EdgeInsets.all(16),
      sliver: SliverToBoxAdapter(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.red[300],
                border: Border.all(width: 0.5, color: Colors.black),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  Text(ArPageString.text3),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.warning,
                        color: Colors.white,
                      ),
                      Text("On Development", style: textWhite()),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Obx(() => c.backLoadLvl3.isFalse
                ? Text("backToRefresh2 = ${c.backToRefresh2.value}")
                : LoadingIndicator()),
            const SizedBox(height: 20),
            CustomButton(
              ontap: () {
                c.goToNextPageLvl3();
              },
              text: "Go To Next Page 2",
              bgColor: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}

class _Content extends GetWidget<AutoRefreshController> {
  const _Content({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final c = controller;
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Obx(() => c.backLoad.isFalse
                ? Text("backToRefresh = ${c.backToRefresh.value}")
                : LoadingIndicator()),
            const SizedBox(height: 20),
            CustomButton(
              ontap: () {
                c.goToNextPage();
              },
              text: "Go To Next Page",
              bgColor: Colors.cyan,
            )
          ],
        ),
      ),
    );
  }
}

class _PageDesc extends StatelessWidget {
  const _PageDesc({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      sliver: SliverToBoxAdapter(
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(width: 0.5, color: Colors.black),
            borderRadius: BorderRadius.circular(5),
            color: Colors.orange[100],
          ),
          child: Column(
            children: [
              Text(
                ArPageString.text1,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                ArPageString.text2,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      padding: const EdgeInsets.all(16),
    );
  }
}
