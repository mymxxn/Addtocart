import 'package:get/get.dart';

class Controllers extends GetxController{
  var cartaddedornot = false.obs;
  void checkifadded() {
    cartaddedornot.value = !cartaddedornot.value;
    update();
  }
}