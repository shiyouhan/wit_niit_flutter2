import 'package:get/get.dart';

class SetMsgNoticeController extends GetxController {
  var flag1 = false.obs;
  var flag2 = false.obs;
  var flag3 = false.obs;
  var flag4 = false.obs;
  var flag5 = false.obs;

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

  void msgSwitch() {
    if (flag1.value) {
      flag1.value = !flag1.value;
    } else {
      flag1.value = !flag1.value;
    }
  }

  void vvSwitch() {
    if (flag2.value) {
      flag2.value = !flag2.value;
    } else {
      flag2.value = !flag2.value;
    }
  }

  void soundSwitch() {
    if (flag3.value) {
      flag3.value = !flag3.value;
    } else {
      flag3.value = !flag3.value;
    }
  }

  void newsSwitch() {
    if (flag4.value) {
      flag4.value = !flag4.value;
    } else {
      flag4.value = !flag4.value;
    }
  }

  void receiveSwitch() {
    if (flag5.value) {
      flag5.value = !flag5.value;
    } else {
      flag5.value = !flag5.value;
    }
  }
}
