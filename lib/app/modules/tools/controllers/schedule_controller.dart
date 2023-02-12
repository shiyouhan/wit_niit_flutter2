import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScheduleController extends GetxController {
  //TODO: Implement ScheduleController

  //课表颜色列表
  final colorList = [
    Colors.red,
    Colors.lightBlueAccent,
    Colors.red,
    Colors.cyan,
    Colors.blue,
    Colors.deepPurpleAccent,
    Colors.green
  ];

  //课表内容
  final infoLMap = {
    1: "形式与政策-教1一214",
    2: "离散数学-教1一214",
    5: "概率论-教1一214",
    8: "大学英语-教4-309",
    10: "大学英语-教4-309",
    11: "大学英语-教4-309",
    15: "大学英语-教4-309",
    20: "大学英语-教4-309",
    22: "大学英语-教4-309"
  };

  //表头
  final weekList = ['周一', '周二', '周三', '周四', '周五', '周六', '周日'];
  //日期列表
  final dateList = [].obs;
  //当前日期下表
  late var currentWeekIndex = 0.obs;
  final count = 0.obs;

  Widget bottomView = SizedBox(
    height: 30,
    child: Row(
      children: [
        //底部view可自行扩充
      ],
    ),
  );
  @override
  void onInit() {
    super.onInit();
    var monday = 1;
    var mondayTime = DateTime.now();

    //获取本周星期一是几号
    print("------------${mondayTime.weekday}");
    while (mondayTime.weekday != monday) {
      mondayTime = mondayTime.subtract(new Duration(days: 1));
    }

    for (int i = 0; i < 7; i++) {
      dateList.add(
          mondayTime.month.toString() + "/" + (mondayTime.day + i).toString());
      if ((mondayTime.day + i) == DateTime.now().day) {
        currentWeekIndex = (i.obs + 1);
      }
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
