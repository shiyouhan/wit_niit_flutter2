import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/modules/mine/views/person_info_view.dart';

import '../../../../main.dart';
import '../../../config/net_url.dart';

class InfoPasswordController extends GetxController {
  var oldPassController = TextEditingController().obs;
  var newPassController = TextEditingController().obs;

  final oldPass = '123123'.obs;
  final newPass = '123111'.obs;

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

  void oldPassNumber(value) => oldPass.value = value;
  void newPassNumber(value) => newPass.value = value;

  // 重置密码
  changePwd() {
    Map<String, dynamic> params = {
      "oldPwd": oldPassController.value.text,
      "newPwd": newPassController.value.text,
    };
    request.post('/users/changePwd', data: params).then((value) {
      print(value);
      Get.offAll(() => PersonInfoView());
    }).catchError((error) {
      EasyLoading.showError(error);
    });
  }
}
