import 'package:get/get.dart';

class MessageDetailController extends GetxController {
  //TODO: Implement MessageDetailController

  final name = ''.obs;

  final count = 0.obs;



  @override
  void onInit() {
    super.onInit();
    name.value =  Get.arguments;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;


}
