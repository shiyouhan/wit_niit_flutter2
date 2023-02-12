import 'package:get/get.dart';

class SetLanguageController extends GetxController {
  final isSelected = 0.obs;

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

  void languageOne() => isSelected.value = 0;
  void languageTwo() => isSelected.value = 1;
  void languageThree() => isSelected.value = 2;
}
