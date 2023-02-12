import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/modules/bench/controllers/leave_controller.dart';


class LeaveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LeaveController>(
          () => LeaveController(),
    );
  }
}
