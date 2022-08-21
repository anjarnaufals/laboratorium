import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/example_controller.dart';

class ExampleView extends GetView<ExampleController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ExampleView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ExampleButton',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
