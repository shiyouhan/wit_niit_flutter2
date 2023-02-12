import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/config/net_url.dart';
import 'package:wit_niit_flutter2/main.dart';

class NoticePageController extends GetxController {
  //TODO: Implement NoticePageController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getAllNotice();
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

  //获取资讯消息
  getAllNotice() {
    request.get("${NetUrl.kHttp_HostName}/shisheng/notice/all").then((value) {
      print(value);
    }).catchError((_) {
      EasyLoading.showError("获取全部资讯消息异常");
    });
  }
}
