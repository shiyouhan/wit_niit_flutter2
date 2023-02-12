import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/modules/bench/controllers/apply_into_controller.dart';

import '../controllers/bench_controller.dart';

class ApplyIntoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApplyIntoController>(
      () => ApplyIntoController(),
    );
  }
}
