import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/modules/mine/views/person_info_view.dart';

import '../../../../main.dart';
import '../../../config/net_url.dart';

class InfoPhoneNumController extends GetxController {
  var phoneController = TextEditingController().obs;
  var codeController = TextEditingController().obs;

  final phone = ''.obs;
  final code = ''.obs;

  final isShow = false.obs;
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
  void show() => {
        isShow.value = true,
        getVerify(),
        print(1),
      };

  //发送验证码
  getVerify() async {
    if (phone.isNotEmpty) {
      Map<String, dynamic> params = {"phone": phoneController.value.text};
      request.post('/users/sendSms', data: params).then((value) {
        print(value);
      }).catchError((error) {
        EasyLoading.showError(error);
      });
    }
  }

  // 更改手机号
  changePhone() {
    Map<String, dynamic> params = {
      "phone": phoneController.value.text,
      "code": codeController.value.text,
    };
    request.post('/users/changePhone', data: params).then((value) {
      print(value);
      Get.offAll(() => PersonInfoView());
    }).catchError((error) {
      EasyLoading.showError(error);
    });
  }
}
