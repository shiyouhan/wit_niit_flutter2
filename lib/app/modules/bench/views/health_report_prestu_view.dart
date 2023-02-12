import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/health_report_prestu_controller.dart';

class HealthReportPrestuView extends GetView {
  const HealthReportPrestuView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final HealthReportPrestuController controller =
        Get.put(HealthReportPrestuController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('学生信息分页查询'),
        centerTitle: true,
      ),
    );
  }
}
