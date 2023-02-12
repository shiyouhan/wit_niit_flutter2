import 'package:date_format/date_format.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/data/leave_from_model.dart';
import 'package:wit_niit_flutter2/app/data/user_detail_model.dart';
import 'package:wit_niit_flutter2/main.dart';

import '../../../config/net_url.dart';

class LeaveAddController extends GetxController {
  //TODO: Implement HealthController

  var textcontroller = TextEditingController().obs;
  var numberController = TextEditingController().obs;
  var userData = UserDetailModel().obs;
  var starDate = 0.obs;
  var occupyGroup = 3.obs;
  var outGroup = 3.obs;

  var endDate = 0.obs;

  // var starDateStr = "请选择".obs;
  // var endDateStr = "请选择".obs;
  var days = "".obs;
  final text = "".obs;

  var reasonController = TextEditingController().obs;
  var reason = "".obs;
  var words = 0.obs;
  var focusNode = FocusNode().obs;

  var teachers = ["请选择任课老师"].obs;

  // 请假表单数据model
  var leaveFromModel = LeaveFromModel(
      type: "请选择",
      createdTime: "请选择",
      deadline: "请选择",
      days: 0,
      userId: SpUtil.getString("userId"),
      applicationTime: formatDate(DateTime.now(),
          [yyyy, '-', mm, '-', dd, ' ', hh, ':', nn, ':', ss])).obs;
  var formKey = GlobalKey<FormState>().obs;

  @override
  void onInit() async {
    super.onInit();
    numberController.value.text = "10304012412";
    userDetail(SpUtil.getString("userId")!, SpUtil.getString("token")!);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setController(value) => textcontroller.value.text = value;

  void setStarDate(value) {
    if (starDate.value == 0) {
      starDate.value = value.millisecondsSinceEpoch;
      print(starDate.value);
    } else {
      starDate.value = 0;
    }

    // starDateStr.value = formatDate(
    //     value, ["yyyy", "年", "mm", "月", "dd", "日", " ", "HH", ":", "nn"]);
    leaveFromModel.value.createdTime = formatDate(
        value, ["yyyy", "年", "mm", "月", "dd", "日", " ", "HH", ":", "nn"]);
  }

  void setEndDate(value) {
    endDate.value = value.millisecondsSinceEpoch;
    print(endDate.value);
    leaveFromModel.value.deadline = formatDate(
        value, ["yyyy", "年", "mm", "月", "dd", "日", " ", "HH", ":", "nn"]);
    // print(endDate.value);
    getDays();
  }

  void getDays() {
    print((endDate.value - starDate.value));
    // var date =
    //     DateTime.fromMillisecondsSinceEpoch(endDate.value - starDate.value);
    var date = ((endDate.value - starDate.value) / 86400000).floor();
    print(date);
    leaveFromModel.value.days = date;
  }

// 请求用户详细信息
  void userDetail(String userId, String token) async {
    var data =
        await request.get("/users/getUser/$userId", headers: {"token": token});
    userData.value = UserDetailModel.fromJson(data);
  }

  // 提交请假记录
  void addLeave() async {
    await request.post("${NetUrl.kHttp_HostName}/leave/add", data: leaveFromModel);
  }
}
