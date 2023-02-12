import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/modules/bench/controllers/entrance_controller.dart';

import '../controllers/bench_controller.dart';

class EntranceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EntranceController>(
      () => EntranceController(),
    );
  }
}
