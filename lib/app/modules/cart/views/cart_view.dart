// Dart imports:
import 'dart:math';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:flower_app/app/data/atom/custom_appbar.dart';
import 'package:flower_app/app/data/model/product_model.dart';
import 'package:flower_app/app/modules/cart/controllers/item_cart_controller.dart';
import 'package:flower_app/app/modules/custombutton/views/custombutton_view.dart';
import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _AppBar(),
          Obx(() => controller.onLoading.isFalse
              ? controller.cartItem.length > 0
                  ? _OnSuccess()
                  : _OnError()
              : _OnLoading())
        ],
      ),
      bottomNavigationBar: _BottomArea(),
    );
  }
}

class _OnSuccess extends GetWidget<CartController> {
  const _OnSuccess({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(16.0),
      sliver: Obx(() => SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: controller.cartItem.length,
              (_, i) {
                var item = controller.cartItem[i];
                return _Item(item: item, i: i);
              },
            ),
          )),
    );
  }
}

class _OnError extends StatelessWidget {
  const _OnError({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(child: Center(child: Text("Cart Empty")));
  }
}

class _OnLoading extends StatelessWidget {
  const _OnLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: Center(
        child: SizedBox(
          height: 25,
          width: 25,
          child: CircularProgressIndicator(
            color: Get.theme.primaryColorLight,
            strokeWidth: 1,
          ),
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    Key? key,
    required this.item,
    required this.i,
  }) : super(key: key);

  final Product item;
  final int i;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemCartController>(
      init: ItemCartController(),
      tag: "cart-item-${item.id}",
      builder: (c) {
        c.qty.value = item.qty ?? 0;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  width: 1,
                  color: Colors.black26,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 100,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color.fromARGB(
                          Random().nextInt(200),
                          Random().nextInt(100),
                          Random().nextInt(50),
                          Random().nextInt(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${item.id}"),
                        const SizedBox(height: 5),
                        Text("${item.name}"),
                        const SizedBox(height: 5),
                        Text("Rp${item.price}"),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            InkWell(
                              borderRadius: BorderRadius.circular(25),
                              onTap: () {
                                c.remove(item.id!, i);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.black26),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Icon(Icons.remove),
                              ),
                            ),
                            const SizedBox(width: 15),
                            Obx(() => Text("${c.qty.value}")),
                            const SizedBox(width: 15),
                            InkWell(
                              borderRadius: BorderRadius.circular(25),
                              onTap: () {
                                c.add(item.id!, i);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.black26),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Icon(Icons.add),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        );
      },
    );
  }
}

class _BottomArea extends GetWidget<CartController> {
  const _BottomArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Get.theme.scaffoldBackgroundColor,
            border: Border(top: BorderSide(width: 0.5, color: Colors.black))),
        child: Row(
          children: [
            Obx(() => Text("Total  Rp${controller.total.value}")),
            Spacer(),
            SizedBox(
              width: 100,
              child: Material(
                child: CustomButton(
                  ontap: () {},
                  text: "Checkout",
                  isGradient: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0.2,
      pinned: true,
      flexibleSpace: CustomAppbar(
        title: "Cart",
        backButton: true,
      ),
    );
  }
}
