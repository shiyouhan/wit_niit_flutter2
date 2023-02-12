import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/modules/tools/controllers/smart_controller.dart';

Widget Create_group(context) {
  SmartController _controller = Get.put(SmartController());
  return AlertDialog(
    title: Center(child: Text("创建用户组")),
    content: Container(
      child: TextField(
        controller: _controller.groupTextController,
        decoration: InputDecoration(hintText: "用户组名称"),
      ),
    ),
    actions: [
      TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            "取消",
            style: TextStyle(color: Colors.black),
          )),
      TextButton(
          onPressed: () {
            _controller.add_group(context);
          },
          child: Text(
            "确定",
            style: TextStyle(color: Colors.black),
          )),
    ],
  );
}
