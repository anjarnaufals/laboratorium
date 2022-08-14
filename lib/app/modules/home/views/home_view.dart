import 'package:flower_app/app/utils/style.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Get.theme.primaryColor,
        title: Text(
          'Filter Widget',
          style: textWhite(size: 18, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: Obx(
        () => controller.isFilterOpen.isTrue
            ? controller.isLoading.isTrue
                ? Center(
                    child: CircularProgressIndicator(
                        strokeWidth: 1,
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Get.theme.primaryColorDark)))
                : controller.filter.length != 0
                    ? Container(
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
                        child: ListView.separated(
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
                      )
                    : Center(
                        child: Text("Filter tidak ditemukan !"),
                      )
            : Center(
                child: Container(
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
                        controller.openFilter();
                      },
                      child: Center(
                        child: Obx(() => Text(
                              "${controller.filterName.value} ",
                              style: textWhite(fontWeight: FontWeight.bold),
                            )),
                      ),
                    ),
                  ),
                ),
              ),
      ),
      bottomNavigationBar: SafeArea(
        child: Obx(
          () => Container(
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
            height: controller.selectedFilter.length > 0 ? 35 : 0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(5),
                onTap: () {
                  controller.selectedFilter.clear();
                  controller.openFilter();
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
        ),
      ),
    );
  }
}
