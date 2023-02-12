import 'package:flustars/flustars.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:wit_niit_flutter2/main.dart';

import '../data/HealthReportAllstuModel.dart';

class HealthReportAllstuController extends GetxController {
  //TODO: Implement HealthReportAllstuController

  final count = 0.obs;

  final id = SpUtil.getString('id').obs;
  // final id = 1.obs;
  var healthId = SpUtil.getString('healthId').obs;
  var userId = SpUtil.getString('userId').obs;
  var isHealthy = ''.obs;
  var reportTime = ''.obs;
  var position = ''.obs;
  var address = ''.obs;
  var isInSchool = ''.obs;
  var isTest48 = ''.obs;
  var isAccinated = ''.obs;
  var isSymptom10 = ''.obs;
  var isSuspectedCovid19 = ''.obs;
  var isConfirmedCovid19 = ''.obs;
  var isAsymptomaticInfection = ''.obs;
  var isQuarantine = ''.obs;
  var isTransitHignrisk = ''.obs;
  var isStayHignrisk = ''.obs;
  var isContactHighriskPersonnel = ''.obs;
  var isGoAbroad = ''.obs;
  var isContactOverseasPersonnel = ''.obs;
  var isContactSickPeople = ''.obs;
  var isInformedByTeacher = ''.obs;
  var isResponsibleForAuthenticity = ''.obs;
  var supplementaryNotes = ''.obs;
  var createdBy = ''.obs;
  var createdTime = ''.obs;
  var updatedBy = ''.obs;
  var updatedTime = ''.obs;
  @override
  void onInit() {
    super.onInit();
    print(userId.value! + "1231231312312");
    getAllInfo();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  //获取全部健康上报信息
  getAllInfo() {
    Map<String, dynamic> params = {
      "userId": userId.value,
    };
    request.get("/shisheng/health", params: params).then((res) {
      print(res);
      healthId.value = HealthReportAllstuModel.fromJson(res).healthId;
      userId.value = HealthReportAllstuModel.fromJson(res).userId;
      isHealthy.value = HealthReportAllstuModel.fromJson(res).isHealthy!;
      reportTime.value = HealthReportAllstuModel.fromJson(res).reportTime!;
      position.value = HealthReportAllstuModel.fromJson(res).position!;
      address.value = HealthReportAllstuModel.fromJson(res).address!;
      isInSchool.value = HealthReportAllstuModel.fromJson(res).isInSchool!;
      isTest48.value = HealthReportAllstuModel.fromJson(res).isTest48!;
      isAccinated.value = HealthReportAllstuModel.fromJson(res).isAccinated!;
      isSymptom10.value = HealthReportAllstuModel.fromJson(res).isSymptom10!;
      isSuspectedCovid19.value =
          HealthReportAllstuModel.fromJson(res).isSuspectedCovid19!;
    }).catchError((_) {
      EasyLoading.showError('数据解析异常');
    });
  }
}
