import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.backgroundColor,
      body: SafeArea(
        child: Container(
          height: Get.height,
          width: Get.width,
          child: Stack(
            children: [
              Image.asset(
                "assets/flower.png",
                height: Get.height,
                width: Get.width,
                fit: BoxFit.cover,
              ),
              Positioned(
                left: 32,
                top: 32,
                child: Container(
                  width: Get.width - 64,
                  child: Obx(
                    () => Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            color: Colors.transparent,
                            padding: const EdgeInsets.all(8),
                            child: SvgPicture.asset(
                              "assets/icon-menu.svg",
                              height: 24,
                              width: 24,
                            ),
                          ),
                        ),
                        controller.isSearchOpen.value == true
                            ? Expanded(
                                child: Container(
                                height: 40,
                                color: Colors.black26,
                                child: TextField(),
                              ))
                            : Spacer(),
                        GestureDetector(
                          onTap: () {
                            controller.OpenSearch();
                          },
                          child: Container(
                            color: Colors.transparent,
                            padding: const EdgeInsets.all(8),
                            child: SvgPicture.asset(
                              "assets/icon-search.svg",
                              height: 24,
                              width: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //flower title
              Positioned(
                bottom: Get.height / 6,
                left: 0,
                right: 0,
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    height: Get.height / 5,
                    width: Get.width,
                    color: Colors.black26,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Gazania",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 35),
                        Text(
                          "Native".toUpperCase(),
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Southern Africa",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    )),
              ),
              //price detail
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  height: Get.height / 6,
                  width: Get.width,
                  color: Colors.white,
                  child: Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "Price",
                          style: TextStyle(color: Colors.black),
                          children: [
                            const TextSpan(text: "  "),
                            TextSpan(
                              text: "Rp500.000",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Container(
                        decoration: BoxDecoration(
                            color: Get.theme.primaryColorLight,
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.all(10),
                        child: Icon(
                          Icons.shopping_bag_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
