import 'package:get/get.dart';

import 'package:wit_niit_flutter2/app/modules/bench/controllers/health_info_id_controller.dart';
import 'package:wit_niit_flutter2/app/modules/bench/controllers/health_report_allstu_controller.dart';
import 'package:wit_niit_flutter2/app/modules/bench/controllers/health_report_controller.dart';
import 'package:wit_niit_flutter2/app/modules/bench/controllers/health_report_prestu_controller.dart';
import 'package:wit_niit_flutter2/app/modules/bench/controllers/notice_page_controller.dart';

import '../controllers/bench_controller.dart';

class BenchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HealthReportController>(
      () => HealthReportController(),
    );
    Get.lazyPut<HealthInfoIdController>(
      () => HealthInfoIdController(),
    );
    Get.lazyPut<NoticePageController>(
      () => NoticePageController(),
    );
    Get.lazyPut<HealthReportPrestuController>(
      () => HealthReportPrestuController(),
    );
    Get.lazyPut<HealthReportAllstuController>(
      () => HealthReportAllstuController(),
    );
    Get.lazyPut<BenchController>(
      () => BenchController(),
    );
  }
}
