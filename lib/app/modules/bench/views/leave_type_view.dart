import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/modules/bench/controllers/leave_add_controller.dart';
import 'package:wit_niit_flutter2/app/modules/bench/controllers/leave_type_controller.dart';

class LeaveTypeView extends GetView<LeaveTypeController> {
  const LeaveTypeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LeaveAddController leaveAddController = Get.put(LeaveAddController());
    return Scaffold(
      appBar: AppBar(
        title: Text('请假类型'),
      ),
      // body:,
    );
  }
}
