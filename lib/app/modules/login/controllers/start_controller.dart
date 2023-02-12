import 'package:get/get.dart';

class StartController extends GetxController {
  var isSelected = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void radioSelect(value) => isSelected.value = true;
}
