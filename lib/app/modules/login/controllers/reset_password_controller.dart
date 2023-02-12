// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/modules/login/views/login_view.dart';

import '../../../../main.dart';
import '../../../config/net_url.dart';

class ResetPasswordController extends GetxController {
  var phoneController = TextEditingController().obs;
  var codeController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;

  final phone = '18018384983'.obs;
  final code = ''.obs;
  final password = '123123'.obs;
  var isShow = true.obs;

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
  resetPwd() {
    Map<String, dynamic> params = {
      // "phone": phone.value,
      // "code": code.value,
      // "password": password.value
      "phone": phoneController.value.text,
      "code": codeController.value.text,
      "password": passwordController.value.text,
    };
    request.post('/users/resetPwd', data: params).then((value) {
      print(value);
      Get.offAll(() => LoginView());
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
}
