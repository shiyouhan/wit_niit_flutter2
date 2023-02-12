import 'package:get/get.dart';

class SetThemeController extends GetxController {
  final flag = true.obs;
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

  void themeSwitch() {
    if (flag.value) {
      flag.value = !flag.value;
    } else {
      flag.value = !flag.value;
    }
  }

  void selectOne() => isSelected.value = 0;
  void selectTwo() => isSelected.value = 1;
}
