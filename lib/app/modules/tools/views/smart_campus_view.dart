import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/modules/tools/component/create_group.dart';
import 'package:wit_niit_flutter2/app/modules/tools/component/create_room.dart';
import 'package:wit_niit_flutter2/app/modules/tools/component/smart_card.dart';
import 'package:wit_niit_flutter2/app/modules/tools/controllers/smart_controller.dart';
import 'package:wit_niit_flutter2/app/modules/tools/views/devices_add_view.dart';

import '../component/data.dart';

class SmartCampusView extends GetView {
  SmartCampusView({Key? key}) : super(key: key);
  SmartController _controller = Get.put(SmartController());

  addDevice() {
    ///TODO：添加设备方法
    Get.to(DevicesAddView());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
          return Text("${_controller.user_groupName.value}");
        }),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              _controller.user_groupName.value == "请选择添加设备类型"
                  ? showDialog(
                      context: context,
                      builder: (context) {
                        return Create_group(context);
                      })
                  : addDevice();
            },
            icon: Icon(Icons.add),
          ),
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Create_room(context);
                    });
              },
              icon: Icon(Icons.home))
        ],
      ),
      body: GridView.count(
        childAspectRatio: 165 / 215,
        crossAxisCount: 2,
        children: smartDataList
            .asMap()
            .keys
            .map((e) => smart_card(
                  name: smartDataList[e].name,
                  icon: smartDataList[e].icon,
                  status: smartDataList[e].status,
                ))
            .toList(),
      ),
    );
  }
}
