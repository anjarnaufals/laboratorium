import 'dart:math';

import 'package:flower_app/app/data/model/product_model.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final cartItem = <Product>[].obs;
  var onSuccess, onEmpty, onError, onLoading = false.obs;
  var total = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    loadData();
  }

  @override
  void onClose() {}

  Future<void> loadData() async {
    onLoading(true);

    await Future.delayed(Duration(seconds: 2), () {
      createData();
    });
    setTotal();

    onLoading(false);
  }

  createData() {
    var i;

    for (i = 1; i < 10; i++) {
      var item = Product(
        id: "Id-Item-$i",
        name: "Name-Item-$i",
        qty: i,
        price: (i + Random().nextInt(10000) + 5000) + i,
      );
      cartItem.add(item);
    }
  }

  void removeItem(String id) {
    EasyLoading.show();
    Future.delayed(Duration(milliseconds: 300), () {
      cartItem.removeWhere((item) => item.id == id);
      setTotal();
      EasyLoading.dismiss();
    });
    print(cartItem.length);
  }

  void addItem(String id) {}

  setTotal() {
    total.value = 0;
    for (var item in cartItem) {
      total.value += (item.price! * item.qty!);
    }
  }
}
