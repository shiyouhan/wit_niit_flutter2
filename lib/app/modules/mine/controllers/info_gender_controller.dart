import 'package:flustars/flustars.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/modules/mine/controllers/mine_controller.dart';

import '../../../../main.dart';
import '../../../config/net_url.dart';
import '../model/User.dart';
import '../views/person_info_view.dart';

class InfoGenderController extends GetxController {
  MineController mineController = Get.put(MineController());

  var gender = ''.obs;

  final id = SpUtil.getString("id").obs;
  final token = SpUtil.getString("token").obs;

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

  void selectM() => mineController.gender.value = 'M';
  void selectF() => mineController.gender.value = 'F';
  void selectU() => mineController.gender.value = 'U';

  // 修改个人信息
  userEdit() {
    Map<String, dynamic> params = {
      "id": id.value,
      "name": mineController.name.value,
      "gender": mineController.gender.value,
      "photo": mineController.photo.value,
    };
    request.post('/users/edit', data: params).then((value) {
      Get.to(PersonInfoView());
      getUser();
      print(value);
    }).catchError((_) {
      EasyLoading.showError('数据解析异常');
    });
  }

  // 获取用户信息
  getUser() {
    id.value = SpUtil.getString("id")!;
    Map<String, dynamic> params = {"id": id.value};
    request
        .get('${NetUrl.kHttp_HostName}/users/getUserNoToken/${id.value}',
            params: params)
        .then((value) {
      gender.value = User.fromJson(value).gender;
      print(value);
      // print(User.fromJson(value).photo);
    }).catchError((_) {
      EasyLoading.showError('数据解析异常');
    });
  }
}
