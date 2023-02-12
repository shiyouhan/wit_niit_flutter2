import 'dart:convert';

import 'package:flustars/flustars.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../../main.dart';
import '../../../config/net_url.dart';
import '../model/User.dart';

class MineController extends GetxController {
  //TODO: Implement MineController

  final id = ''.obs;
  final token = ''.obs;
  final photo = 'http://img.syhan.top/uPic/nonothing.jpg'.obs;
  final name = '未登录'.obs;
  final gender = 'M'.obs;
  final phone = ''.obs;
  final classes = ''.obs;
  final sno = ''.obs;
  final college = ''.obs;

  @override
  void onInit() {
    getUser();
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

  // 获取用户信息
  getUser() {
    id.value = SpUtil.getString("id")!;
    token.value = SpUtil.getString("token")!;
    Map<String, dynamic> params = {"id": id.value};
    Map<String, dynamic> headers = {"token": token.value};
    request
        .get('/users/getUserNoToken/${id.value}', params: params)
        .then((value) {
      photo.value = User.fromJson(value).photo;
      name.value = User.fromJson(value).name;
      gender.value = User.fromJson(value).gender;
      phone.value = User.fromJson(value).phone;
      classes.value = User.fromJson(value).classes;
      sno.value = User.fromJson(value).sno;
      college.value = User.fromJson(value).college;
      print(value);
    }).catchError((_) {
      EasyLoading.showError('数据解析异常');
    });
  }
}
