// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import '../controllers/auto_refresh_controller.dart';

class AutoRefreshView extends GetView<AutoRefreshController> {
//TODO : implement auto refresh while Get.back() , on development
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AutoRefreshView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AutoRefreshView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
