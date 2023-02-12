import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/modules/bench/controllers/leave_add_controller.dart';
import 'package:wit_niit_flutter2/app/modules/bench/controllers/teacher_controller.dart';

class TeachersView extends StatefulWidget {
  const TeachersView({Key? key}) : super(key: key);

  @override
  State<TeachersView> createState() => _TeachersViewState();
}

class _TeachersViewState extends State<TeachersView> {
  @override
  Widget build(BuildContext context) {
    LeaveAddController leaveAddController = Get.put(LeaveAddController());
    var ids = [
      1,
      2,
      3,
      4,
    ];
    List<String> names = ["张三", "王五", "李四", "小红"];
    var checks = [false, false, false, false];
    return Scaffold(
      appBar: AppBar(
        title: Text('选择老师'),
      ),
      body: Column(children: <Widget>[
        ListView.builder(
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              children: [
                Checkbox(
                  value: checks[index],
                  // 改变后的事件
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      checks[index] = !checks[index];
                      if (!leaveAddController.teachers.value
                              .contains(names[index]) ||
                          checks[index] == true) {
                        leaveAddController.teachers.value.add(names[index]);
                      } else {
                        leaveAddController.teachers.value.remove(names[index]);
                      }
                    });
                  },
                  // 选中后的颜色
                  activeColor: Colors.red,
                  // 选中后对号的颜色
                  checkColor: Colors.blue,
                ),
                Text(names[index]),
              ],
            );
          },
          itemCount: ids.length,
        )
      ]),
    );
  }
}
// Widget _checkbox
