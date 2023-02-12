import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wit_niit_flutter2/app/modules/bench/views/network_fault_student.dart';
import 'package:wit_niit_flutter2/app/modules/bench/views/network_fault_teacher.dart';

import 'network_fault_others.dart';

class NetworkFaultHomePage extends StatelessWidget {
  const NetworkFaultHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //设置顶部导航栏（中间）
        title: const Text('网络故障'),
        //标题居中
        centerTitle: true,
        //右侧图标
        actions: const [Icon(Icons.more_vert_outlined)],
      ),
      body: Container(),
      bottomNavigationBar: Row(
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              width: 60.w,
              height: 50.h,
              decoration: BoxDecoration(
                //设置边框
                border: Border.all(color: Colors.grey, width: 0.5),
                //背景颜色
                color: Colors.white,
                //设置圆角
                borderRadius: BorderRadius.circular((5.0)),
                //设置阴影
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey,
                      offset: Offset(1.0, 1.0),
                      blurRadius: 1.0,
                      spreadRadius: 1.0),
                ],
              ),
              child: const Icon(Icons.unfold_more),
            ),
          ),
          GestureDetector(
            // onTap: () => NetworkFaultStudentPage(),
            onTap: () => Get.to(NetworkFaultStudentPage()),
            child: Container(
              alignment: Alignment.center,
              width: 110.w,
              height: 50.h,
              decoration: BoxDecoration(
                //设置边框
                border: Border.all(color: Colors.grey, width: 0.5),
                //背景颜色
                color: Colors.white,
                //设置圆角
                borderRadius: BorderRadius.circular((5.0)),
                //设置阴影
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey,
                      offset: Offset(1.0, 1.0),
                      blurRadius: 1.0,
                      spreadRadius: 1.0),
                ],
              ),
              child: Text(
                '学生报障',
                textAlign: TextAlign.center,
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Get.to(NetworkFaultTeacherPage()),
            child: Container(
              alignment: Alignment.center,
              width: 110.w,
              height: 50.h,
              decoration: BoxDecoration(
                //设置边框
                border: Border.all(color: Colors.grey, width: 0.5),
                //背景颜色
                color: Colors.white,
                //设置圆角
                borderRadius: new BorderRadius.circular((5.0)),
                //设置阴影
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey,
                      offset: Offset(1.0, 1.0),
                      blurRadius: 1.0,
                      spreadRadius: 1.0),
                ],
              ),
              child: Text('教师报障'),
            ),
          ),
          GestureDetector(
            onTap: () => Get.to(NetworkFaultOthersPage()),
            child: Container(
              alignment: Alignment.center,
              width: 110.w,
              height: 50.h,
              decoration: BoxDecoration(
                //设置边框
                border: Border.all(color: Colors.grey, width: 0.5),
                //背景颜色
                color: Colors.white,
                //设置圆角
                borderRadius: BorderRadius.circular((5.0)),
                //设置阴影
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey,
                      offset: Offset(1.0, 1.0),
                      blurRadius: 1.0,
                      spreadRadius: 1.0),
                ],
              ),
              child: Text('其他报障'),
            ),
          )
        ],
      ),
    );
  }
}
