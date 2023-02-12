import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/modules/bench/controllers/add_live_controller.dart';


class LiveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddLiveController>(
          () => AddLiveController(),
    );
  }
}
