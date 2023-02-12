import 'package:flustars/flustars.dart';
import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/component/select_menu.dart';
import 'package:wit_niit_flutter2/app/config/net_url.dart';
import 'package:wit_niit_flutter2/app/data/leave_record.dart';
import 'package:wit_niit_flutter2/app/data/user_detail_model.dart';
import 'package:wit_niit_flutter2/main.dart';

class LeaveController extends GetxController {
  //TODO: Implement HealthController

  var leaveStatus = true.obs;
  var display = false.obs;
  var data = [].obs;

  List<String> textList = [
    "学号",
    "姓名",
    "性别",
    "电话",
    "学院",
    "班级",
    "现在年纪",
    "班主任姓名",
    "班主任电话",
    "住宿地址",
  ];

  List<selectMenuItem> menuList = [
    selectMenuItem(label: "事假", value: '1'),
    selectMenuItem(label: "病假", value: '2'),
    selectMenuItem(label: "其他", value: '3'),
  ];

  @override
  void onInit() {
    super.onInit();
    leaveData("13");
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setDisplay() => display.value = !display.value;

  void setLeaveStatus() => leaveStatus.value = !leaveStatus.value;

//  请求请假记录
  void leaveData(String userId) async {
    var ldata = await request.get("${NetUrl.kHttp_HostName}/leave/only/history",
        params: {"userId": "13"});
    // userData.value = UserDetailModel.fromJson(data);
    data.addAll(ldata);
    LogUtil.e(data);
    print(data.length);


    // LeaveRecord leaveRecord = LeaveRecord.fromJson(data);
  }
}
