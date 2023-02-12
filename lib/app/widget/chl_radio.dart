import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/modules/bench/controllers/leave_add_controller.dart';
import 'package:wit_niit_flutter2/app/utils/request.dart';
import 'package:wit_niit_flutter2/app/widget/required.dart';

class chlRadio extends StatelessWidget {
  int groupValue;
  var value;
  String title;

  chlRadio(
      {Key? key,
      required this.groupValue,
      required this.value,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    LeaveAddController leaveAddController = Get.put(LeaveAddController());
    return Row(
      children: [
        chlRequired(text: Text(title)),
        Row(
          children: [
            Obx(() {
              return Radio(
                ///此单选框绑定的值 必选参数
                value: 0,

                ///当前组中这选定的值  必选参数
                groupValue: leaveAddController.occupyGroup.value,

                ///点击状态改变时的回调 必选参数
                onChanged: (v) {
                  print(v);
                  leaveAddController.occupyGroup.value = v! as int;
                  leaveAddController.leaveFromModel.value.occupy = true;
                },
              );
            }),
            Text("是")
          ],
        ),
        Row(
          children: [
            Obx(() {
              return Radio(
                ///此单选框绑定的值 必选参数
                value: 1,

                ///当前组中这选定的值  必选参数
                groupValue: leaveAddController.occupyGroup.value,

                ///点击状态改变时的回调 必选参数
                onChanged: (v) {
                  print(v);
                  leaveAddController.occupyGroup.value = v! as int;
                  leaveAddController.leaveFromModel.value.occupy = false;
                },
              );
            }),
            Text("否")
          ],
        ),
      ],
    );
  }
}
