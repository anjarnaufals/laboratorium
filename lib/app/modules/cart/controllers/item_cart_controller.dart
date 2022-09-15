// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:flower_app/app/modules/cart/controllers/cart_controller.dart';

class ItemCartController extends GetxController {
  var qty = 0.obs;

  void add(String id, int pos) {
    var priceselect = Get.find<CartController>().cartItem[pos].price;
    Get.find<CartController>().total.value += priceselect!;
    qty++;
  }

  void remove(String id, int pos) {
    if (qty == 1) {
      Get.find<CartController>().removeItem(id);
    } else {
      var priceselect = Get.find<CartController>().cartItem[pos].price;
      Get.find<CartController>().total.value -= priceselect!;
      qty--;
    }
  }
}
