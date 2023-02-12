import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/modules/bench/controllers/leave_add_controller.dart';

class TeachersController extends GetxController {
  //TODO: Implement HealthController

  var ids = [
    1,
    2,
    3,
    4,
  ].obs;
  var names = ["张三", "王五", "李四", "小红"].obs;
  var checks = [false, false, false, false].obs;

  @override
  void onInit() {
    super.onInit();
    LeaveAddController leaveAddController = Get.put(LeaveAddController());
    leaveAddController.teachers.value.remove("请选择任课老师");
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
