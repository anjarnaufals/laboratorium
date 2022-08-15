import 'package:flower_app/app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppbar extends StatelessWidget {
  final String title;
  final bool? backButton;
  const CustomAppbar({
    Key? key,
    required this.title,
    this.backButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
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
        height: kToolbarHeight,
        child: Row(
          children: [
            Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(25),
                onTap: () {
                  backButton == true ? Get.back() : null;
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: backButton == true
                      ? Icon(
                          Icons.adaptive.arrow_back,
                          color: Colors.white,
                          size: 24,
                        )
                      : SizedBox(width: 24),
                ),
              ),
            ),
            Text(
              title,
              style: textWhite(fontWeight: FontWeight.bold, size: 18),
            )
          ],
        ),
      ),
    );
  }
}
