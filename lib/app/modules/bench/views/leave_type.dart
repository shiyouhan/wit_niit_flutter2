import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/modules/bench/views/leave_add_view.dart';

import '../controllers/leave_add_controller.dart';
import '../controllers/leave_type_controller.dart';

class LeaveType extends StatelessWidget {
  const LeaveType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LeaveTypeController controller = Get.put(LeaveTypeController());
    LeaveAddController leaveAddController = Get.put(LeaveAddController());
    // var groupValue = 0;
    return Scaffold(
        appBar: AppBar(
          title: Text('请假类型'),
          actions: [
            TextButton(
              onPressed: () {
                Get.to(() => LeaveAddView());
              },
              child: Text(
                "确定",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            )
          ],
        ),
        body: Column(children: <Widget>[
          Row(
            children: [
              Obx(() {
                return Radio(
                  ///此单选框绑定的值 必选参数
                  value: 0,

                  ///当前组中这选定的值  必选参数
                  groupValue: controller.groupValue.value,

                  ///点击状态改变时的回调 必选参数
                  onChanged: (v) {
                    controller.groupValue.value = v!;
                    leaveAddController.leaveFromModel.value.type =
                        controller.type1;
                  },
                );
              }),
              Text(controller.type1),
            ],
          ),
          Row(
            children: [
              Obx(() {
                return Radio(
                  ///此单选框绑定的值 必选参数
                  value: 1,

                  ///当前组中这选定的值  必选参数
                  groupValue: controller.groupValue.value,

                  ///点击状态改变时的回调 必选参数
                  onChanged: (v) {
                    controller.groupValue.value = v!;
                    leaveAddController.leaveFromModel.value.type =
                        controller.type2;
                  },
                );
              }),
              Text(controller.type2),
            ],
          ),
          Row(
            children: [
              Obx(() {
                return Radio(
                  ///此单选框绑定的值 必选参数
                  value: 2,

                  ///当前组中这选定的值  必选参数
                  groupValue: controller.groupValue.value,

                  ///点击状态改变时的回调 必选参数
                  onChanged: (v) {
                    controller.groupValue.value = v!;
                    leaveAddController.leaveFromModel.value.type =
                        controller.type3;
                  },
                );
              }),
              Text(controller.type3),
            ],
          )
        ]));
  }
}
