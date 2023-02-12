import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/modules/bench/controllers/live_detail_controller.dart';


class LiveDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LiveDetailController>(
          () => LiveDetailController(),
    );
  }
}
