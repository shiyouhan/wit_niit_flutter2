import 'package:flustars/flustars.dart';
import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/modules/mine/controllers/mine_controller.dart';

class HealthReportController extends GetxController {
  //TODO: Implement HealthReportController
  final mineController = Get.put(MineController());

  // final sno = SpUtil.getString('sno').obs;

  final count = 0.obs;

  var sno = SpUtil.getString('sno').obs;
  @override
  void onInit() {
    super.onInit();
    getUserInfo();
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

  //获取当前用户信息
  getUserInfo() {
    Map<String, dynamic> params = {
      'sno': mineController.sno.value,
    };
    print("______________");
    print(params);
  }
}
