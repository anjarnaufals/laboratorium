// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:flower_app/app/utils/style.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool? backButton;
  final bool? isSliver;
  const CustomAppbar({
    Key? key,
    required this.title,
    this.backButton,
    this.isSliver,
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

  @override
  Size get preferredSize => Size(0, kToolbarHeight);
}
