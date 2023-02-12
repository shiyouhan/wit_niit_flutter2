import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/micro_disk_model.dart';

class MicroDiskController extends GetxController {
  //TODO: Implement MicroDiskController

  final count = 0.obs;

  var docList = [
    MicroDiskModel(
        Icon(
          // Icons.file_open,
          Icons.dashboard,

          color: Colors.blue,
        ),
        "快速上手收集表...日健康情况收集",
        "李xx * 11/3浏览"),
    MicroDiskModel(
        Icon(
          Icons.assessment_outlined,
          color: Colors.orange,
        ),
        "快速上手表格————项目管理",
        "李xx * 11/3浏览"),
    MicroDiskModel(
        Icon(
          Icons.file_open,
          color: Colors.orange,
        ),
        "快速上手文档————工作汇报",
        "李xx * 11/3浏览"),
  ].obs;

  void addFile() {}

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

  void increment() => count.value++;
}
