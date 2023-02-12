import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/modules/bench/controllers/leave_add_controller.dart';
import 'package:wit_niit_flutter2/app/modules/bench/controllers/leave_controller.dart';


class LeaveAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LeaveAddController>(
          () => LeaveAddController(),
    );
  }
}
