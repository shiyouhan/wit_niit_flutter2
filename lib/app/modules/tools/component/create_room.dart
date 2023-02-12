import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:wit_niit_flutter2/app/modules/tools/controllers/smart_controller.dart';

Widget Create_room(context) {
  SmartController _controller = Get.put(SmartController());
  return AlertDialog(
    title: Center(child: Text("创建环境")),
    content: Container(
      child: TextField(
        controller: _controller.roomTextController,
        decoration: InputDecoration(hintText: "环境名称"),
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
            _controller.create_room(context);
          },
          child: Text(
            "确定",
            style: TextStyle(color: Colors.black),
          )),
    ],
  );
}
