import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/config/net_url.dart';
import 'package:wit_niit_flutter2/main.dart';

class HealthReportPrestuController extends GetxController {
  //TODO: Implement HealthReportPrestuController

  final count = 0.obs;
  final stuId = 1.obs;
  @override
  void onInit() {
    super.onInit();
    getPerInfo();
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

  //获取个人健康上报信息
  getPerInfo() {
    Map<String, dynamic> params = {
      "stuId": stuId.value,
    };
    request
        .get("${NetUrl.kHttp_HostName}/shisheng/health/student", params: params)
        .then((value) {
      print(value);
    }).catchError((_) {
      EasyLoading.showError('数据解析异常');
    });
  }
}
