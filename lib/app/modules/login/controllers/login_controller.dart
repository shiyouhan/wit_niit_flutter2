// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../../main.dart';
import '../../../config/net_url.dart';
import '../../home/views/home_view.dart';
import '../../mine/model/User.dart';

class LoginController extends GetxController {
  var phoneController = TextEditingController().obs;
  var codeController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;

  final phone = '18018384983'.obs;
  final password = '123123'.obs;
  final code = ''.obs;
  var isShow = true.obs;
  var loginPass = false.obs;

  final id = ''.obs;
  final token = ''.obs;
  final photo = ''.obs;

  @override
  void onInit() {
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

  void phoneNumber(value) => phone.value = value;
  void codeNumber(value) => code.value = value;
  void passwordNumber(value) => code.value = value;
  void passwordLogin() => loginPass.value = true;
  void openShow() => isShow.value = false;
  void closeShow() => isShow.value = true;

  //登录
  login() {
    Map<String, dynamic> params = {
      // "phone": phone.value,
      // "code": code.value,
      "phone": phoneController.value.text,
      "code": codeController.value.text
    };
    request.post('/users/login', data: params).then((value) {
      SpUtil.putString("token", value["token"]);
      SpUtil.putString("id", value["id"]);
      Get.offAll(HomeView());
      print(value);
    }).catchError((_) {
      EasyLoading.showError('数据解析异常');
    });
  }

  // 密码登录
  passLogin() {
    Map<String, dynamic> params = {
      // "phone": phone.value,
      // "password": password.value,
      "phone": phoneController.value.text,
      "password": passwordController.value.text
    };
    request.post('/users/phone', data: params).then((value) {
      SpUtil.putString("token", value["token"]);
      SpUtil.putString("id", value["id"]);
      Get.offAll(HomeView());
      print(value);
    }).catchError((_) {
      EasyLoading.showError('数据解析异常');
    });
  }

  //发送验证码
  getVerify() async {
    if (phone.isNotEmpty) {
      Map<String, dynamic> params = {
        // "phone": phone.value,
        "phone": phoneController.value.text,
      };
      request.post('/users/sendSms', data: params).then((value) {
        print(value);
      }).catchError((error) {
        EasyLoading.showError(error);
        LogUtil.v("-----------$error");
      });
    }
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
      print(value);
      print(User.fromJson(value).photo);
    }).catchError((_) {
      EasyLoading.showError('数据解析异常');
    });
  }
}
