import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../../main.dart';
import '../../../config/net_url.dart';
import '../../home/views/home_view.dart';
import '../../mine/model/User.dart';

class LogonController extends GetxController {
  var phoneController = TextEditingController().obs;
  var codeController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;

  final phone = '18018384983'.obs;
  final code = ''.obs;
  final password = ''.obs;
  var isShow = true.obs;

  final id = SpUtil.getString("id").obs;
  final token = SpUtil.getString("token").obs;
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
  void passwordNumber(value) => password.value = value;
  void openShow() => isShow.value = false;
  void closeShow() => isShow.value = true;

  //注册
  register() {
    Map<String, dynamic> params = {
      // "phone": phone.value,
      // "code": code.value,
      // "password": password.value,
      "phone": phoneController.value.text,
      "code": codeController.value.text,
      "password": passwordController.value.text,
    };
    request.post('/users/phoneRegister', data: params).then((value) {
      print(value);
      Get.offAll(() => HomeView());
    }).catchError((error) {
      EasyLoading.showError(error);
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
      });
    }
  }

  // 获取用户信息
  getUser() {
    Map<String, dynamic> params = {"id": id.value};
    Map<String, dynamic> headers = {"token": token.value};
    request
        .get('/users/getUser/${id.value}', params: params, headers: headers)
        .then((value) {
      photo.value = User.fromJson(value).photo;
      print(value);
      print(photo.value);
    }).catchError((_) {
      EasyLoading.showError('数据解析异常');
    });
  }
}
