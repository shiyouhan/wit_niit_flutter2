import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/modules/bench/controllers/leave_controller.dart';
import 'package:wit_niit_flutter2/app/modules/bench/controllers/leave_details_controller.dart';


class LeaveDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LeaveDetailsController>(
          () => LeaveDetailsController(),
    );
  }
}
