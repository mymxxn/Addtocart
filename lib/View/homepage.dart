import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/Controller/controller.dart';
import 'package:shopping/View/cartpage.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  List<String> allproducts = [
    "Product 1",
    "Product 2",
    "Product 3",
    "Product 4",
    "Product 5"
  ];
  List<String> cartproducts = [];
  final controller = Get.put(Controllers());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    "All products",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900),
                  )),
                  IconButton(
                      onPressed: () {
                        Get.to(() => CartPage(cartlist: cartproducts));
                      },
                      icon: Icon(Icons.shopping_cart_outlined)),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                        height: 16,
                      ),
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 20),
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${allproducts[index]}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 20),
                              ),
                              Obx(() => controller.cartaddedornot.value
                                  ? Icon(Icons.check)
                                  : ElevatedButton(
                                      onPressed: () {
                                        controller.checkifadded();
                                        cartproducts.add(allproducts[index]);
                                        Get.defaultDialog(
                                            middleText: "Added to cart");
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.black,
                                      ),
                                      child: Text("Add to cart")))
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
