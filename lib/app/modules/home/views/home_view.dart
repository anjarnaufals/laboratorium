import 'package:flower_app/app/data/atom/custom_appbar.dart';
import 'package:flower_app/app/utils/style.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CustomAppbar(title: "Custom Filter"),
          ),
          SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 100),
                Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Get.theme.primaryColor,
                          Get.theme.primaryColorLight,
                          Get.theme.primaryColorDark,
                        ]),
                  ),
                  height: 35,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(5),
                      onTap: () {
                        controller.loadFilters();
                        Get.bottomSheet(
                            isScrollControlled: true,
                            Obx(
                              () => controller.isLoading.isTrue
                                  ? Container(
                                      height: Get.height / 12,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Get.theme.primaryColor,
                                              Get.theme.primaryColorLight,
                                              Get.theme.primaryColorDark,
                                            ]),
                                      ),
                                      child: Center(
                                          child: CircularProgressIndicator(
                                              strokeWidth: 1,
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                      Colors.white))),
                                    )
                                  : controller.filter.length != 0
                                      ? Filter()
                                      : Error(),
                            ));
                      },
                      child: Center(
                        child: Obx(
                          () => Text(
                            "${controller.filterName.value} ",
                            style: textWhite(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => controller.selectedFilter.length > 0
                      ? Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Get.theme.primaryColor,
                                  Get.theme.primaryColorLight,
                                  Get.theme.primaryColorDark,
                                ]),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                controller.selectedFilter.clear();
                                controller.filterName.value = "Filter";
                              },
                              child: Icon(
                                Icons.cancel,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                          ),
                        )
                      : Container(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Error extends StatelessWidget {
  const Error({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width / 2,
      height: Get.height / 4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Get.theme.primaryColor,
              Get.theme.primaryColorLight,
              Get.theme.primaryColorDark,
            ]),
      ),
      child: Center(
        child: Text(
          "Filter tidak ditemukan !",
          style: textWhite(size: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class Filter extends GetWidget<HomeController> {
  const Filter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: Get.height,
      width: Get.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Get.theme.primaryColor,
              Get.theme.primaryColorLight,
              Get.theme.primaryColorDark,
            ]),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListView.separated(
            shrinkWrap: true,
            itemCount: controller.filter.length,
            itemBuilder: (_, i) {
              var id = controller.filter[i].id;
              var filter = controller.filter[i].filter;
              // var last = i == controller.filter.length - 1;
              return Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    controller.selectFilter(id);
                  },
                  child: Container(
                    height: Get.width / 10,
                    width: Get.width,
                    child: Row(
                      children: [
                        const SizedBox(width: 16),
                        Text(
                          "${filter}",
                          style: textWhite(),
                        ),
                        Spacer(),
                        Obx(() => Icon(
                              controller.selected(id)
                                  ? Icons.check_box
                                  : Icons.check_box_outline_blank,
                              color: Colors.white,
                            )),
                        const SizedBox(width: 16),
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (_, i) {
              return const SizedBox(height: 16);
            },
          ),
          Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.black26,
            ),
            height: 35,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(5),
                onTap: () {
                  Get.back();
                },
                child: Center(
                  child: Text(
                    "Simpan",
                    style: textWhite(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
