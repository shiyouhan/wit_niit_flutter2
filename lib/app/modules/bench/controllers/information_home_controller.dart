import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:wit_niit_flutter2/main.dart';

import '../../../config/net_url.dart';

class InformationHomeController extends GetxController {
  //TODO: Implement HealthController

  var display = false.obs;
  var data = [].obs;
  var typeid = 1.obs;
  final pageIndex = 1.obs;
  final pageSize = 5.obs;
  @override
  void onInit() {
    super.onInit();
    getInfo();
    getInfoList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setDisplay() => display.value = !display.value;

  //获取资讯类型列表
  getInfoList() {
    request.get("/information/typeList").then((value) {
      print(value);
    }).catchError((_) {
      EasyLoading.showError('获取资讯类型列表数据解析异常');
    });
  }

  //获取南工资讯
  getInfo() {
    Map<String, dynamic> params = {
      // "pageIndex": pageIndex.value,
      // "pageSize": pageSize.value,
      "typeId": typeid.value,
    };
    request
        .get("${NetUrl.kHttp_HostName}/information/query", params: params)
        .then((value) {
      print(value);
    }).catchError((_) {
      EasyLoading.showError('数据解析异常');
    });
  }
}
