import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/config/net_url.dart';
import 'package:wit_niit_flutter2/main.dart';

class SmartController extends GetxController {
  //创建用户组输入框框控制器
  late TextEditingController groupTextController;

  //创建用户组输入框框控制器
  late TextEditingController roomTextController;

  //设备号
  late TextEditingController deviceNumTextController;

  //设备显示名称
  late TextEditingController deviceNameTextController;

  //设备id
  late TextEditingController clientIdTextController;

  //用户名称
  late TextEditingController deviceUsernameTextController;

  //用户密码
  late TextEditingController devicePasswordTextController;

  //主题
  late TextEditingController topicTextController;

  //组信息
  late var user_group_info = {};

  var user_groupName = "创建用户组".obs;

  //显示选择信息
  var showDeviceType = '请选择添加设备类型'.obs;

  //设备类型列表
  late List<dynamic> device_type = [];

  //用户组添加方法
  add_group(context) {
    Map<String, dynamic> params = {
      "userId": SpUtil.getString('id'),
      "groupName": groupTextController.text
    };
    request.post(NetUrl.create_group, params: params).then((s) {
      Navigator.of(context).pop();
    }).catchError((e) {
      EasyLoading.showError(e.toString());
    });
  }

  //获取用户组信息
  get_group() {
    Map<String, dynamic> params = {
      "userId": SpUtil.getString('id'),
    };
    request.get(NetUrl.get_user_group, params: params).then((value) {
      user_group_info = value[0];
      user_groupName.value = value[0]['groupName'];
    }).catchError((e) {
      EasyLoading.showError(e.toString());
    });
  }

  //获取设备类型
  get_device_type() {
    request.get(NetUrl.get_device_type).then((value) {
      device_type = value;
    }).catchError((e) {
      LogUtil.v(e);
    });
  }

  //设备添加事件
  add_device() {
    Map<String, dynamic> data = {
      "deviceNum": int.parse(deviceNumTextController.text),
      "deviceName": deviceNameTextController.text,
      "clientId": clientIdTextController.text,
      "deviceUsername": deviceUsernameTextController.text,
      "devicePassword": devicePasswordTextController.text,
      "topic": topicTextController.text,
      "roomId": 1,
      "userId": SpUtil.getString('id'),
    };
    request.post(NetUrl.add_device, data: data).then((value) {
      EasyLoading.showSuccess("添加成功！");
    }).catchError((e) {
      EasyLoading.showError(e);
    });
  }

  //场景创建
  create_room(context) {
    Map<String, dynamic> params = {
      "userId": SpUtil.getString("id"),
      "groupId": user_group_info["id"],
      "roomName": roomTextController.text
    };
    request.post(NetUrl.create_room, params: params).then((value) {
      EasyLoading.showSuccess("创建成功");
      Navigator.of(context).pop();
    }).catchError((e) {
      EasyLoading.showError(e);
    });
  }

  @override
  void onInit() {
    groupTextController = new TextEditingController();
    deviceNameTextController = new TextEditingController();
    deviceUsernameTextController = new TextEditingController();
    deviceNumTextController = new TextEditingController();
    clientIdTextController = new TextEditingController();
    devicePasswordTextController = new TextEditingController();
    topicTextController = new TextEditingController();
    roomTextController = new TextEditingController();
    get_device_type();
    get_group();
    super.onInit();
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
