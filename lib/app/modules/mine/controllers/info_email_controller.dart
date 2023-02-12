import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../../main.dart';
import '../../../config/net_url.dart';
import '../views/person_info_view.dart';

class InfoEmailController extends GetxController {
  var emailController = TextEditingController().obs;
  var codeController = TextEditingController().obs;

  final email = ''.obs;
  final code = ''.obs;
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

  void emailEdit(value) => email.value = value;
  void codeNumber(value) => code.value = value;

  //发送验证码
  getEmailCode() {
    if (email.isNotEmpty) {
      Map<String, dynamic> params = {"email": email.value};
      request.post('/users/sendEmail', data: params).then((value) {
        print(value);
      }).catchError((error) {
        EasyLoading.showError(error);
      });
    }
  }

  // 更改手机号
  changePhone() {
    Map<String, dynamic> params = {
      "email": emailController.value.text,
      "code": codeController.value.text,
    };
    request.post('/users/bindEmail', data: params).then((value) {
      print(value);
      Get.offAll(() => PersonInfoView());
    }).catchError((error) {
      EasyLoading.showError(error);
    });
  }
}
