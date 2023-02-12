import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/modules/tools/controllers/micro_disk_controller.dart';

class ToolsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MicroDiskController>(
      () => MicroDiskController(),
    );
  }
}
